package cn.cuberxp.service.impl;

import cn.cuberxp.dao.UserDao;
import cn.cuberxp.domain.User;
import cn.cuberxp.service.MailService;
import cn.cuberxp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author 零
 * @title: UserServiceImpl
 * @projectName BookStory
 * @description: TODO
 * @date 19.6.24下午 4:03
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Autowired
    private MailService mailService;

    @Override
    public void addUser(User user) {
        String html = "<p>欢迎你注册BookStory用户</p>" +
                      "<br><a href='http://localhost:8080/BookStory/active.do?username=" + user.getUsername() + "&activeCode=" + user.getActiveCode()+"'>点击激活用户</a>";
        String subject = "激活用户";

        mailService.sendMaile(html,subject,user.getEmail(),true);
        userDao.addUser(user);
    }

    @Override
    public User findUserById(Integer id) {
        return userDao.findUserById(id);
    }

    @Override
    public User findUserByUsername(String username) {
        return userDao.findUserByUsername(username);
    }

    @Override
    public User findUserByUP(String username, String password) {
        return userDao.findUserByUP(username,password);
    }

    @Override
    public void updateUser(Integer id, String password, String gender, String telephone) {
        userDao.updateUser(id, password, gender, telephone);
    }


    /**
     * 激活用户
     * @param username 用户名
     * @param activeCode 用户的激活码
     * @return 用户是否激活成功
     */
    @Override
    public Boolean activeUser(String username, String activeCode) {
        User user = userDao.findUserByUsername(username);

        if(user.getActiveCode().equals(activeCode)){
            userDao.updateUserStateByUsername(username,1);
            return true;
        }

        return false;
    }
}
