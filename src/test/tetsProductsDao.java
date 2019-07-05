import cn.cuberxp.dao.ProductsDao;
import cn.cuberxp.domain.Products;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author 零
 * @title: tetsProductsDao
 * @projectName BookStory
 * @description: TODO
 * @date 19.6.25下午 4:41
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext.xml")
public class tetsProductsDao {

    @Autowired
    ProductsDao productsDao;

    @Test
    public void test(){
        List<Products> list = productsDao.getProductsByCategory("文学", 1, 10);

        for (Products products : list) {
            System.out.println(products);
        }
    }

    @Test
    public void testTOtal(){
        Long total = productsDao.getCategoryTotal("文学");

        System.out.println(total);
    }
}
