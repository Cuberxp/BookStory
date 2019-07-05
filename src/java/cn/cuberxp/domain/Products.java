package cn.cuberxp.domain;

import lombok.*;

import java.util.Objects;

/**
 * @author 零
 * @title: Products
 * @projectName BookStory
 * @description: 商品实体类
 * @date 19.6.25上午 11:40
 */
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Products {
    private String id;
    private String name;
    private Double price;
    private String category;
    //库存
    private Integer pnum;
    private String imgurl;
    private String description;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Products products = (Products) o;
        return Objects.equals(id, products.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
