package cn.cuberxp.dao;

import cn.cuberxp.domain.Products;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 零
 * @title: ProductsDao
 * @projectName BookStory
 * @description: 产品的dao
 * @date 19.6.25下午 4:17
 */
public interface ProductsDao {
    //根据id得到单个商品数据
    Products getProductById(String id);

    //得到分类下书的数量
    Long getCategoryTotal(String category);

    //得到总的数量
    Long getTotal();

    //根据分类号，得到该名字的商品数据
    List<Products> getProductsByCategory(@Param("category")String category, @Param("start")int start, @Param("pageSize")int pageSize);

    //得到所有商品数据
    List<Products> getProductAll(@Param("start")int start, @Param("end")int pageSize);

    //更新商品数据
    void updateProduct(@Param("id")String id,@Param("pnum")int pnum);

    //根据书名查询，书本信息
    List<Products> getProductsByName(@Param("name")String name,@Param("start")int start,@Param("pageSize")int pageSize);
}
