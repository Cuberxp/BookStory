package cn.cuberxp.dao;

import cn.cuberxp.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * @author 零
 * @title: UserDao
 * @projectName BookStory
 * @description: 用户的操作
 * @date 19.6.24下午 3:52
 */

public interface UserDao {
    void addUser(User user);
    User findUserById(Integer id);
    User findUserByUsername(String username);
    User findUserByUP(@Param("username") String username, @Param("password") String password);
    void updateUser(Integer id, String password, String gender, String telephone);

    void  updateUserStateByUsername(@Param("username")String username,@Param("state")Integer state);
}
