package cn.cuberxp.controller;

import cn.cuberxp.domain.User;
import cn.cuberxp.service.MailService;
import cn.cuberxp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 零
 * @title: MailContoller
 * @projectName BookStory
 * @description: TODO
 * @date 19.7.4下午 7:27
 */
@Controller
public class MailContoller {
    @Autowired
    private MailService mailService;

    @PostMapping("/sendMail")
    @ResponseBody
    public Object sendMail(User user){
        System.out.println(user);
        Boolean result = mailService.sendMaile("<h1>欢迎你注册BoookStory用户</h1>" +
                        "<p>点击<a href='http://localhost:8080/BookStory/active.do?username=" + user.getUsername() + "&activeCode=" + user.getActiveCode() +"'>激活用户</a><p>",
                "测试", user.getEmail(), true);

        if(result){
            return "success";
        }else{
            return "error";
        }
    }
}
