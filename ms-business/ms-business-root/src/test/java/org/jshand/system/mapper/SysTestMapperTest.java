package org.jshand.system.mapper;

import org.jshand.system.domain.SysTest;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
class SysTestMapperTest {
    @Resource
    SysTestMapper sysTestMapper;

    @Test
    void testInsert() {
        SysTest entity = new SysTest();

        entity.setName("jshand");
        entity.setCreateBy("金山");

        int ret = sysTestMapper.insert(entity);

        System.out.println("ret = " + ret);
    }

}