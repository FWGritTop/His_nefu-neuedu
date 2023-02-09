package org.jshand.system.service.impl;

import org.jshand.system.domain.SysTest;
import org.jshand.system.service.ISysTestService;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.Assert;

import javax.annotation.Resource;

@SpringBootTest
class SysTestServiceImplTest {

    @Resource
    ISysTestService sysTestService;

    @Test
    public void test() {
        SysTest entity = new SysTest();
        entity.setName("sadasfasf");
        boolean save = sysTestService.save(entity);
        Assert.isTrue(save, "失败了");
    }

}