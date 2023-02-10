package org.jshand.system.service;

import org.jshand.system.domain.SysTest;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ISysTestServiceTest {

    @Resource
    ISysTestService sysTestService;


    @Test
    public void sysTestService(){


        SysTest entity = new SysTest();

        entity.setId(System.currentTimeMillis());
        entity.setName("abcdef");

        boolean save = sysTestService.save(entity);

        System.out.println("save = " + save);

    }

}