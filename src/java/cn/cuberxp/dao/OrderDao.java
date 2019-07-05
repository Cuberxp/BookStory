package cn.cuberxp.dao;

import cn.cuberxp.domain.OrderList;
import cn.cuberxp.domain.Orderitem;
import cn.cuberxp.domain.Orders;
import cn.cuberxp.domain.Products;

import java.util.List;

/**
 * @author 零
 * @title: OrderDao
 * @projectName BookStory
 * @description: 订单操作类
 * @date 19.6.26下午 7:49
 */
public interface OrderDao {
    void addOrder(Orders orders);

    void addOrderitem(Orderitem orderitem);

    List<Orders> checkOrder(Integer id);

    void deleteOrders(String id);

    void deleteOrdersItem(String id);

    List<OrderList> searchOrderInfo(String id);

    List<Products> searchOrderProducts(String id);
}
