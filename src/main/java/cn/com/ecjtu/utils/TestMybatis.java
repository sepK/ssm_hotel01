package cn.com.ecjtu.utils;

import cn.com.ecjtu.mapper.IntakeMapper;
import cn.com.ecjtu.pojo.Intake;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-dao.xml","classpath:spring-service.xml"})
public class TestMybatis {
    @Resource
    private IntakeMapper intakeMapper;

    @Test
    public void demo(){
        for(int i = 0;i<1000;i++){
            String uid = String.valueOf((Math.random() * 9 + 1) * 1000000).substring(0, 7);
            intakeMapper.insert(new Intake(Integer.parseInt(uid),1,"张三001",new Date(),new Date(),1000.00));
        }

    }
}
