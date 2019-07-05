package cn.cuberxp.controller;

import cn.cuberxp.domain.Products;
import cn.cuberxp.domain.ProductsPage;
import cn.cuberxp.service.ProductsService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 零
 * @title: ProductsController
 * @projectName BookStory
 * @description: TODO
 * @date 19.6.25下午 5:23
 */
@Controller
public class ProductsController {
    @Autowired
    private ProductsService productsService;

    @RequestMapping("/showProductByName.do")
    public ModelAndView getProductsByName(@Param("productsName")String productsName,@Param("page")Integer page){
        ModelAndView modelAndView = new ModelAndView("/product/product_list2");
        ProductsPage<Products> productsPage;

        if(page == null)
            page = 1;
        if(productsName == null || productsName.length() == 0 || "*".equals(productsName)){
            productsPage = productsService.getProductsByCategory("*",page);
        }else{
            productsPage = productsService.getProductsByName(productsName,page);
        }

        modelAndView.addObject("productsPage",productsPage);
        modelAndView.addObject("productsName",productsName);
        return modelAndView;
    }
    /**
     * 根据分类查询商品数据信息
     * @param category
     * @param page
     * @return
     */
    @RequestMapping("/showProductByCategory.do")
    public ModelAndView getProductsByCategory(String category, Integer page, HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        ProductsPage<Products> productsPage;

        if(page == null)
            page = 1;
        if(category == null)
            category = "*";

        productsPage = productsService.getProductsByCategory(category,page);

        modelAndView.setViewName("/product/product_list");
        modelAndView.addObject("productsPage",productsPage);
        modelAndView.addObject("category",category);

        return modelAndView;
    }

    /**
     * 商品详细信息显示
     * @param id
     * @return
     */
    @RequestMapping("/product_info.do")
    public ModelAndView getProductsById(String id){
        ModelAndView modelAndView = new ModelAndView("/product/product_info");

        Products product = productsService.getProductsById(id);

        modelAndView.addObject("product",product);

        return  modelAndView;
    }

}
