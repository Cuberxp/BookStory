package cn.cuberxp.controller;

import cn.cuberxp.domain.User;
import cn.cuberxp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.Date;
import java.util.UUID;

/**
 * @author 零
 * @title: UserController
 * @projectName BookStory
 * @description: TODO
 * @date 19.6.24下午 4:06
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    //User(id=null, username=cuberxp, password=tmkeeg52gyjij.., gender=男, email=2317537731@qq.com, telephone=18821914103, introduce=你好啊, activeCode=null, state=null, role=null, registTime=null)
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public void register(User user){
        user.setActiveCode(UUID.randomUUID().toString());
        user.setRole("普通用户");
        System.out.println(user);

    }
}
