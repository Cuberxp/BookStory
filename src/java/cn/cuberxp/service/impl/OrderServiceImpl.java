package cn.cuberxp.service.impl;

import cn.cuberxp.dao.OrderDao;
import cn.cuberxp.domain.OrderList;
import cn.cuberxp.domain.Orderitem;
import cn.cuberxp.domain.Orders;
import cn.cuberxp.domain.Products;
import cn.cuberxp.service.OrderService;
import cn.cuberxp.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 零
 * @title: OrderServiceImpl
 * @projectName BookStory
 * @description: TODO
 * @date 19.6.26下午 8:03
 */
@Service
@Transactional
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    @Autowired
    private ProductsService productsService;

    @Override
    public void addOrder(Orders orders,List<Orderitem> orderitems) {
        orderDao.addOrder(orders);

        for (Orderitem orderitem : orderitems) {
            orderDao.addOrderitem(orderitem);
            productsService.updateProductsByID(orderitem.getProduct().getId(),orderitem.getPnum() - orderitem.getBuynum());
        }
    }

    @Override
    public List<Orders> checkOrder(Integer id) {
        return orderDao.checkOrder(id);
    }

    @Override
    public void deleteOrder(String id){
        orderDao.deleteOrdersItem(id);
        orderDao.deleteOrders(id);
    }

    @Override
    public OrderList searchOrderInfo(String id) {
        return orderDao.searchOrderInfo(id).get(0);
    }

    @Override
    public List<Products> searchOrderProducts(String id) {
        return orderDao.searchOrderProducts(id);
    }


}
