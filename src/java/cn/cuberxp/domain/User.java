package cn.cuberxp.domain;

import lombok.*;

import java.util.Date;


/**
 * @author 零
 * @title: User
 * @projectName BookStory
 * @description: TODO
 * @date 19.6.24下午 3:52
 */
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Integer id;
    private String username;
    private String password;
    private String gender;
    private String email;
    private String telephone;
    private String introduce;
    private String activeCode;
    private Integer state;
    private String role;
    private Date registTime;
}
