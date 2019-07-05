package cn.cuberxp.controller;

import cn.cuberxp.domain.User;
import cn.cuberxp.service.UserService;
import cn.cuberxp.util.Verification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
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
    @RequestMapping(value = "/register.do",method = RequestMethod.POST)
    public String register(User user, HttpServletRequest request, HttpServletResponse response){
        String checkCode = request.getParameter("textinput");
        HttpSession session = request.getSession();
        String code = (String)session.getAttribute("code");
        System.out.println(checkCode+" "+code);
        session.removeAttribute("code");
        if(!code.equals(checkCode)){
            request.setAttribute("register_err","验证码错误!!");
            return "/success/registersuccess";
        }
        Boolean flag = userService.findUserByUsername(user.getUsername()) == null;
        if(!flag){
            request.setAttribute("register_err","用户名重复!!");
            return "/success/registersuccess";
        }
        user.setActiveCode(UUID.randomUUID().toString());
        user.setRole("普通用户");
        user.setRegistTime(new Date());
        user.setState(0);
        userService.addUser(user);
        return "/success/registersuccess";
    }

    @RequestMapping(value="/getCode")
    public void getCode(HttpServletRequest request, HttpServletResponse response){
        try {
            ImageIO.write(Verification.verification(), "JPEG", response.getOutputStream());
            request.getSession().setAttribute("code", Verification.getCode());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value="/login.do")
    public String login(String username, String password, HttpServletRequest request, HttpServletResponse response){
        User user = userService.findUserByUP(username, password);
        if(user == null){
            request.setAttribute("login_err","用户名或密码错误!!");
            return "/user/login";
        }else{
            String autoLogin = request.getParameter("autoLogin");
            String rememberMe = request.getParameter("rememberMe");
            Cookie nameCookie,passCookie,renameCookie,autoCookie,reCookie;
            if("on".equals(autoLogin)){
                nameCookie = new Cookie("username",user.getUsername());
                nameCookie.setMaxAge(60 * 60 * 24 * 60);
                response.addCookie(nameCookie);
                passCookie = new Cookie("password",user.getPassword());
                passCookie.setMaxAge(60 * 60 * 24 * 60);
                response.addCookie(passCookie);
                autoCookie = new Cookie("autoLogin","YES");
                autoCookie.setMaxAge(60 * 60 * 24 * 60);
                response.addCookie(autoCookie);
                System.out.println("autoLogin"+" "+"保存user");
            }
            if("on".equals(rememberMe)){
                renameCookie = new Cookie("reusername",user.getUsername());
                renameCookie.setMaxAge(60 * 60 * 24 * 60);
                response.addCookie(renameCookie);
                reCookie = new Cookie("rememberMe","YES");
                reCookie.setMaxAge(60 * 60 * 24 * 60);
                response.addCookie(reCookie);
            }else{
                for(Cookie e : request.getCookies()){
                    if("reusername".equals(e.getName()) || "rememberMe".equals(e.getName())){
                        e.setMaxAge(0);
                        response.addCookie(e);
                    }
                }
            }
            request.getSession().setAttribute("user",user);
            request.getSession().setMaxInactiveInterval(60 * 60 * 24 * 60);
            return "/index";
        }
    }


    @RequestMapping(value = "/logout.do")
    public String logout(HttpServletRequest request, HttpServletResponse response){
        request.getSession().removeAttribute("user");
        Cookie[] cookies = request.getCookies();
        for(Cookie e : cookies){
            if("autoLogin".equals(e.getName()) || "username".equals(e.getName()) || "password".equals(e.getName())){
                e.setMaxAge(0);
                response.addCookie(e);
            }
        }
        return "/index";
    }

    @RequestMapping(value = "/checkLogin.do")
    public String checkLogin(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        if(session.getAttribute("user") == null){
            Cookie[] cookies = request.getCookies();
            String autoLogin = "";
            String username = "";
            String password = "";
            for(Cookie e : cookies){
                if("autoLogin".equals(e.getName())){
                    autoLogin = e.getValue();
                }else if("username".equals(e.getName())){
                    username = e.getValue();
                }else if("password".equals(e.getName())){
                    password = e.getValue();
                }
            }
            if("YES".equals(autoLogin)){
                session.setAttribute("user",userService.findUserByUP(username,password));
            }
        }
        return "/index";
    }


    /**
     * 查看自己的账号信息
     * @param request
     * @return
     */
    @RequestMapping(value = "/myAccount.do")
    public String accountManage(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");

        if(user == null){
            //注意redirect重定向会丢失数据,forward不会,想从二级目录跳到webapp下的jsp页面，可以用/页面名，但这只能算是
            return "/user/login";
        }else{
            return "/user/myAccount";
        }
    }

    @RequestMapping(value = "/updateUser.do")
    public String updateUser(Integer id, String password, String gender, String telephone, HttpServletRequest request){
        userService.updateUser(id,password,gender,telephone);

        User user = userService.findUserById(id);

        request.getSession().setAttribute("user",user);

        return "/user/myAccount";
    }


    /**
     * 用户激活
     * @param username
     * @param activeCode 激活码
     * @return
     */
    @GetMapping("/active.do")
    public String activeUser(String username,String activeCode){
        if(userService.activeUser(username,activeCode))
            return "/success/activesuccess";
        return "/error/privilege";
    }
}
