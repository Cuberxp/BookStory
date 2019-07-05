package cn.cuberxp.controller;

import cn.cuberxp.domain.Products;
import cn.cuberxp.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 零
 * @title: CartController
 * @projectName BookStory
 * @description: 购物车控制机
 * @date 19.6.26上午 10:53
 */
@Controller
public class CartController {
    @Autowired
    private ProductsService productsService;

    /**
     * 增加购物车里面的商品
     * @param id 商品id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/addProucts.do")
    public String addCart(@RequestParam("id")String id, HttpServletRequest request, HttpServletResponse response){
        Products products = productsService.getProductsById(id);
        Map<Products,Integer> map = (Map<Products,Integer>)request.getSession().getAttribute("Cart");

        if(map == null){
            map = new HashMap<Products,Integer>();
            map.put(products,1);
        }else{
            //当前商品，在不在购物车中在加一，不在为一
            if(map.containsKey(products)){
                if((map.get(products) + 1) <= products.getPnum()){
                    map.put(products,map.get(products) + 1);
                }
            }else {
                map.put(products,1);
            }
        }

        request.getSession().setAttribute("Cart",map);

        return "/cart/cart";
    }

    /**
     * 更新，购物车里己选商品的数量
     * @param id
     * @param num
     * @param request
     * @return
     */
    @RequestMapping("/changeNum.do")
    public String changeNum(@RequestParam("id")String id,@RequestParam("num")Integer num,HttpServletRequest request){
        Map<Products,Integer> map = (Map<Products,Integer>)request.getSession().getAttribute("Cart");

        if((id != null && !id.isEmpty())&& num != null){
            Products product = productsService.getProductsById(id);

            if(map.containsKey(product)){
                if(num <= 0){
                    map.remove(product);
                }else{
                    map.put(product,num);
                }
            }
        }

        request.getSession().setAttribute("Cart",map);
        return "/cart/cart";
    }
}
