import cn.cuberxp.dao.ProductsDao;
import cn.cuberxp.domain.Products;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 零
 * @title: testContainkey
 * @projectName BookStory
 * @description: TODO
 * @date 19.6.26上午 10:26
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext.xml")
public class testContainkey {
    @Autowired
    ProductsDao productsDao;

    @Test
    public void testContain(){
        Map<Products,Integer> map = new HashMap<>();
        Products product = productsDao.getProductById("2");

        map.put(product,1);
        Products product2 = productsDao.getProductById("2");

        System.out.println(map.containsKey(product2));
    }
}
