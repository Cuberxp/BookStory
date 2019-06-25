package cn.cuberxp.service.impl;

import cn.cuberxp.dao.UserDao;
import cn.cuberxp.domain.User;
import cn.cuberxp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    @Override
    public void addUser(User user) {
        userDao.addUser(user);
    }
}
