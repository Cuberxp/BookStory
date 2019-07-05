package cn.cuberxp.service.impl;

import cn.cuberxp.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessageRemovedException;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Properties;

/**
 * @author 零
 * @title: MailServiceImpl
 * @projectName BookStory
 * @description: 邮件发送实现类
 * @date 19.7.2下午 7:25
 */
@Service
public class MailServiceImpl implements MailService {

    @Autowired
    private JavaMailSender javaMailSender;

    @Override
    public Boolean sendMaile(String text, String subject, String emailAddress,Boolean type) {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        //mimmessage的实现类
        MimeMessageHelper mimeMessageHelper;
        Properties properties = new Properties();

        try{
            properties.load(this.getClass().getResourceAsStream("/mail.properties"));
            //发件人
            String from = properties.getProperty("mail.smtp.username");

            mimeMessageHelper = new MimeMessageHelper(mimeMessage,true,"utf-8");

            //发件人
            mimeMessageHelper.setFrom(from);
            //收件人
            mimeMessageHelper.setTo(emailAddress);
            //主题
            mimeMessageHelper.setSubject(subject);

            //tyep为true表示，text以html的方式打开
            if(type){
                mimeMessageHelper.setText(text,true);
            }else{
                mimeMessageHelper.setText(text,false);
            }

            javaMailSender.send(mimeMessage);
        } catch (IOException e){
            e.printStackTrace();

            return false;
        } catch (MessagingException m){
            m.printStackTrace();

            return false;
        }

        return true;
    }
}
