package cn.cuberxp.service;

import cn.cuberxp.domain.OrderList;
import cn.cuberxp.domain.Orderitem;
import cn.cuberxp.domain.Orders;
import cn.cuberxp.domain.Products;
import org.springframework.core.annotation.Order;

import java.util.List;

/**
 * @author 零
 * @title: OrderService
 * @projectName BookStory
 * @description: TODO
 * @date 19.6.26下午 8:01
 */
public interface OrderService {
    void addOrder(Orders orders, List<Orderitem> orderitems);
    List<Orders> checkOrder(Integer id);
    void deleteOrder(String id);
    OrderList searchOrderInfo(String id);
    List<Products> searchOrderProducts(String id);
}
