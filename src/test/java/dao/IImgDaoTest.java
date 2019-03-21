package dao;

import com.dao.IImgDao;
import com.dao.IUserDao;
import com.model.user;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class IImgDaoTest {
    @Autowired
    private IImgDao iImgDao;

    @Test
    public void testSelectUser()throws Exception{
        System.out.println(iImgDao.allImg().toString());
    }
}
