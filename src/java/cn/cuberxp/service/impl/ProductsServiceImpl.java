package cn.cuberxp.service.impl;

import cn.cuberxp.dao.ProductsDao;
import cn.cuberxp.domain.Products;
import cn.cuberxp.domain.ProductsPage;
import cn.cuberxp.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 零
 * @title: ProductsServiceImpl
 * @projectName BookStory
 * @description: TODO
 * @date 19.6.25下午 4:59
 */
@Service
public class ProductsServiceImpl implements ProductsService{
    @Autowired
    private ProductsDao productsDao;

    /**
     * 根据书名查询，书本信息
     * @param name
     * @param page 分页
     * @return
     */
    @Override
    public ProductsPage<Products> getProductsByName(String name, int page) {
        ProductsPage<Products> productsPage = new ProductsPage<>();
        List<Products> productsList;

        productsList = productsDao.getProductsByName("%" + name + "%",(page - 1) * productsPage.getPageSize(),productsPage.getPageSize());
        productsPage.setList(productsList);

        productsPage.setCurrentPage(page);
        productsPage.setTotalPage(productsList.size());
        int totalPage = (int)Math.ceil(productsList.size() * 1.0 / productsPage.getPageSize());

        productsPage.setTotalPage(totalPage);
        productsPage.setTotal((long)productsList.size());
        return productsPage;
    }

    @Override
    public void updateProductsByID(String id, int pnum) {
        productsDao.updateProduct(id,pnum);
    }

    /**
     * @param category 分类号
     * @param page 当前页
     * @return
     */
    @Override
    public ProductsPage<Products> getProductsByCategory(String category, int page) {
        ProductsPage<Products> list = new ProductsPage<Products>();
        List<Products> products;

        long total;
        if(category.equals("*"))
           total = productsDao.getTotal();
        else
            total = productsDao.getCategoryTotal(category);
        list.setTotal(total);

        //总页数
        int totalPage = (int)Math.ceil(total * 1.0 / list.getPageSize());
        list.setTotalPage(totalPage);

        //设置当前页
        list.setCurrentPage(page);

        //得到返回的数据
        if(category.equals("*"))
            products = productsDao.getProductAll((page - 1) * list.getPageSize(), list.getPageSize());
        else
            products = productsDao.getProductsByCategory(category, (page - 1) * list.getPageSize(), list.getPageSize());
        list.setList(products);

        return list;
    }

    @Override
    public Products getProductsById(String id) {
        return productsDao.getProductById(id);
    }
}
