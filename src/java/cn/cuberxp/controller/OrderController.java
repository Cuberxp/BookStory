package cn.cuberxp.controller;

import cn.cuberxp.domain.*;
import cn.cuberxp.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * @author 零
 * @title: OrderController
 * @projectName BookStory
 * @description: 订单控制器
 * @date 19.6.26下午 5:32
 */
@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    /**
     * 提交一条新的订单
     * @param orders
     * @param request
     * @return
     */
    @PostMapping("/addOrders.do")
    @ResponseBody
    public String addOrders(Orders orders, HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        Map<Products,Integer> map = ( Map<Products,Integer>)request.getSession().getAttribute("Cart");
        Map<String,Object> result = new HashMap<>();

        if(map == null || map.size() == 0){
            return "error";
        }
        if(user == null){
            result.put("state",1);

            return "error";
        }

        //订单样细表，一个订单对应多个产品
        List<Orderitem> orderitems = new ArrayList<>();
        double totalPrice = 0;
        for (Products products : map.keySet()) {
            Orderitem orderitem = new Orderitem();

            orderitem.setOrders(orders);
            orderitem.setProduct(products);
            orderitem.setBuynum(map.get(products));
            orderitem.setPnum(products.getPnum());
            orderitems.add(orderitem);
            totalPrice += products.getPrice() * map.get(products);
        }

        orders.setId(UUID.randomUUID().toString());
        orders.setOrdertime(new Date());
        orders.setUser(user);
        orders.setMoney(totalPrice);
        orders.setPaystate(0);

        orderService.addOrder(orders,orderitems);
        //清除购物车
        request.removeAttribute("Cart");

        result.put("success","提交订单成功");
        result.put("state",0);

        return "success";
    }

    @GetMapping("/checkOrder.do")
    public String checkOrder(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        List<Orders> orders = orderService.checkOrder(user.getId());

        request.setAttribute("orders",orders);
        request.setAttribute("len",orders.size());

        return "/order/orderlist";
    }

    @RequestMapping("/deleteOrder.do")
    public String deleteOrder(String OrderId,HttpServletRequest request){
        orderService.deleteOrder(OrderId);

        return checkOrder(request);
    }

    @RequestMapping("/checkDetails.do")
    public String searchOrderItem(String OrderId,HttpServletRequest request){
        OrderList orderInfo = orderService.searchOrderInfo(OrderId);
        orderInfo.setProductsList(orderService.searchOrderProducts(OrderId));
        request.setAttribute("OrderInfo",orderInfo);
        return "/order/orderInfo";
    }
}
