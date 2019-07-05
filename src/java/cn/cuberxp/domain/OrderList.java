package cn.cuberxp.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@ToString
@Getter
@Setter
public class OrderList {
    private String orderId;
    private String receiverAddress;
    private String receiverName;
    private String receiverPhone;
    private List<Products> productsList;
}
