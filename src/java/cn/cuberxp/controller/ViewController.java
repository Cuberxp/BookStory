package cn.cuberxp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author 零
 * @title: ViewController
 * @projectName BookStory
 * @description: 视图控制器
 * 负责转发到jsp页面
 * @date 19.7.4上午 9:35
 */
@Controller
public class ViewController {
    @GetMapping("/index")
    public String index(){
        return "/index";
    }

    /**
     * 购物车
     */
    @GetMapping("/cart")
    public String Cart(){
        return "/cart/cart";
    }

    /**
     * 失败的一些操作页面
     */
    @GetMapping("/privilege")
    public String Privilege(){
        return "/error/privilege";
    }

    /**
     * 订单相关的页面
     */
    @GetMapping("/order")
    public String Order(){
        return "/order/order";
    }

    @GetMapping("/orderInfo")
    public String OrderInfo(){
        return "/order/orderInfo";
    }
    @GetMapping("/orderlist")
    public String Orderlist(){
        return "/order/orderlist";
    }

    /**
     * 产品
     */
    @GetMapping("/product_info")
    public String Product_info(){
        return "/product/product_info";
    }
    @GetMapping("/product_list")
    public String Product_list(){
        return "/product/product_list";
    }
    @GetMapping("/product_list2")
    public String Product_list2(){
        return "/product/product_list2";
    }

    /**
     * 某些操作成功页面
     */
    @GetMapping("/createOrderSuccess")
    public String CreateOrderSuccess(){
        return "/success/createOrderSuccess";
    }
    @GetMapping("/delOrderSuccess")
    public String delOrderSuccess(){
        return "/success/delOrderSuccess";
    }
    @GetMapping("/activesuccess")
    public String activesuccess(){
        return "/success/activesuccess";
    }
    @GetMapping("/registersuccess")
    public String registersuccess(){
        return "/success/registersuccess";
    }
    /**
     * 用户
     */
    @GetMapping("/register")
    public String register(){
        return "/user/register";
    }
    @GetMapping("/login")
    public String login(){
        return "/user/login";
    }
    @GetMapping("/modifyuserinfoupdateuser")
    public String modifyuserinfoupdateuser(){
        return "/user/modifyuserinfoupdateuser";
    }
    @GetMapping("/myAccount")
    public String myAccount(){
        return "/user/myAccount";
    }
    @GetMapping("/modifyuserinfo")
    public String modifyuserinfo(){
        return "/user/modifyuserinfo";
    }
}
