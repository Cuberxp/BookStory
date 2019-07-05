package cn.cuberxp.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author 零
 * @title: orderitem
 * @projectName BookStory
 * @description: 订单详情
 * @date 19.6.26下午 4:52
 */
@Setter
@Getter
@ToString
public class Orderitem {
    private Integer buynum;
    private Integer pnum;
    private Orders orders;
    private Products product;
}
