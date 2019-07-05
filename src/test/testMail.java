import cn.cuberxp.service.MailService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author 零
 * @title: testMail
 * @projectName BookStory
 * @description: TODO
 * @date 19.7.2下午 8:03
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext.xml")
public class testMail {

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private MailService mailService;

    @Test
    public void testSenderText(){
       /* String s = mailService.sendMaile("<h1>欢迎你注册BoookStory用户</h1>" +
                        "<p>点击<a href='http://localhost:8080/BookStory/activesuccess.jsp'>激活用户</a><p>",
                "测试", "2317537731@qq.com", true);
        */
        System.out.println();
    }
}
