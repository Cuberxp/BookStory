package cn.cuberxp.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

/**
 * @author 零
 * @title: ProductsPage
 * @projectName BookStory
 * @description: 分页的实体类
 * @date 19.6.25下午 4:18
 */
@Setter
@Getter
@ToString
public class ProductsPage<T>{
    //商品总的数量
    private Long total;
    //当前页
    private int currentPage;
    //每页的数量
    private int pageSize = 4;
    //总页数
    private int totalPage;
    //商品数据
    private List<T> list;

}
