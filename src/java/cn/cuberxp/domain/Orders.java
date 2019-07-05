package cn.cuberxp.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.List;

/**
 * @author 零
 * @title: orders
 * @projectName BookStory
 * @description: 订单实体类
 * @date 19.6.26下午 4:52
 */
@Setter
@Getter
@ToString
public class Orders {
    private String id;
    private Double money;
    //收件人地址
    private String receiverAddress;
    //收件人名字
    private String receiverName;
    //收件人电话
    private String receiverPhone;
    //支付状态 0 失败， 1 成功
    private Integer paystate;
    private Date ordertime;
    //外键
    private User user;
}
