package iyuesai.site;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zmsport.iyuesai.service.UserTeamService;

@ContextConfiguration(locations={"classpath:spring-data.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class TeamTest {
	@Autowired
    private UserTeamService service;
     
    @Test
    public void TestIndex(){
    	System.out.println(service.getCurrentUserTeamStatus(10, 16));
    }
}
