package cn.cuberxp.service;

import cn.cuberxp.domain.Products;
import cn.cuberxp.domain.ProductsPage;

import java.util.List;

/**
 * @author 零
 * @title: ProductsService
 * @projectName BookStory
 * @description: TODO
 * @date 19.6.25下午 4:59
 */
public interface ProductsService {
    ProductsPage<Products> getProductsByCategory(String category, int page);

    ProductsPage<Products> getProductsByName(String name,int page);

    Products getProductsById(String id);

    void updateProductsByID(String id,int pnum);

}
