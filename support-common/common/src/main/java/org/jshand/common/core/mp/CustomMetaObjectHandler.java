package org.jshand.common.core.mp;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.jshand.common.utils.SecurityUtils;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class CustomMetaObjectHandler implements MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
        this.setFieldValByName("createBy", SecurityUtils.getLoginUser().getUsername(), metaObject);
        this.setFieldValByName("createTime", new Date(), metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.setFieldValByName("updateBy", SecurityUtils.getLoginUser().getUsername(), metaObject);
        this.setFieldValByName("updateTime", new Date(), metaObject);
    }
}