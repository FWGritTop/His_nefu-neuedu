package org.jshand.system.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.jshand.common.core.domain.entity.SysMenu;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
class ISysMenuServiceTest {

    @Resource
    ISysMenuService sysMenuService;

    @Test
    void selectMenuList() {
        Page<SysMenu> page = PageHelper.startPage(1, 5);
        sysMenuService.selectList();

        for (SysMenu sysMenu : page.getResult()) {
            System.out.println(sysMenu);
        }

        System.out.println("page.getTotal() = " + page.getTotal());
        System.out.println("page.getPages() = " + page.getPages());
        System.out.println("page.getPageNum() = " + page.getPageNum());
        System.out.println("page.getPageSize() = " + page.getPageSize());

        page = PageHelper.startPage(2, 5);
        sysMenuService.selectList();

        for (SysMenu sysMenu : page.getResult()) {
            System.out.println(sysMenu);
        }

        System.out.println("page.getTotal() = " + page.getTotal());
        System.out.println("page.getPages() = " + page.getPages());
        System.out.println("page.getPageNum() = " + page.getPageNum());
        System.out.println("page.getPageSize() = " + page.getPageSize());

        page = PageHelper.startPage(3, 5);
        sysMenuService.selectList();

        for (SysMenu sysMenu : page.getResult()) {
            System.out.println(sysMenu);
        }

        System.out.println("page.getTotal() = " + page.getTotal());
        System.out.println("page.getPages() = " + page.getPages());
        System.out.println("page.getPageNum() = " + page.getPageNum());
        System.out.println("page.getPageSize() = " + page.getPageSize());

    }
}