package cn.cuberxp.service;

import cn.cuberxp.domain.User;

/**
 * @author 零
 * @title: UserService
 * @projectName BookStory
 * @description: TODO
 * @date 19.6.24下午 4:03
 */
public interface UserService {
    void addUser(User user);
    User findUserById(Integer id);
    User findUserByUsername(String username);
    User findUserByUP(String username, String password);
    void updateUser(Integer id, String password, String gender, String telephone);

    //激活用户
    Boolean activeUser(String username,String activeCode);
}
