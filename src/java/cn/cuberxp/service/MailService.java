package cn.cuberxp.service;

import org.springframework.mail.javamail.JavaMailSender;

/**
 * @author 零
 * @title: MailService
 * @projectName BookStory
 * @description: 邮件发送
 * @date 19.7.2下午 7:20
 */
public interface MailService {
    Boolean sendMaile(String text, String subject, String emailAddress,Boolean type);
}
