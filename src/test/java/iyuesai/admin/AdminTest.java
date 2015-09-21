package iyuesai.admin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.zmsport.iyuesai.service.AdminServiceImpl;

@ContextConfiguration(locations={"classpath:spring-data.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class AdminTest {
	@Autowired
    private AdminServiceImpl service;
     
    @Test
    public void TestIndex(){
         System.out.println(service.findAdminByName("admin").getPassword());
    }
}
