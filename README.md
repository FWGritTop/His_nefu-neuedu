# His_nefu-neuedu
> 23.7月与两位nefu佬的neuedu的his项目
> 
import老师改的若依的模板
[链接](https://gitee.com/jshand/boot-admin-template.git)

make by gsx lhl ljp
nefu2020 in 2023
只写完了挂号、上传下载、
财务管理力不足、没写
数据库一开始建立的不是很好，所以就交接有些冲突

数据库名称
his
用户名
root
密码123456
```
角色：
收费管理员：RegFee
门诊医生：Doctor
医技医生：TechDoctor
药房管理员：PhaAdmin
财务管理员：FinaAdmin
系统管理员：SysAdmin
超级管理员：admin
```

 ```
界面设想
收费管理员：RegFee
    挂号：可以现场挂号、退号
    收费：对患者进行收费确认
门诊医生：Doctor
    门诊：
        显示已挂号的病人列表（点击进入病人列表详情页）
        病人列表详情页可以进行确诊、（）
    检验结果：显示病人检验结果
医技医生：TechDoctor
    待检列表：显示自己需要操作的检验病人列表、对其进行录入
    医技项目补录：显示医技列表，可以新增医技项目
药房管理员：PhaAdmin
    药物分发：对患者进行发药确认、或者退药选择
    药品目录管理：对药品目录增删改查
财务管理员：FinaAdmin
    门诊日结核对：显示当日收费条目？做个统计
    费用管理：
        成品药管理：增删改查
        对非药品管理：增删改查
系统管理员：SysAdmin
    用户管理：增删改查用户表
    科室管理：增删改查科室表 
    诊断目录管理：增删改查诊断目录
    医生排班管理？待定
超级管理员：admin
 ```

 # 怎么样正确导入包
 1. 选取表
   生产代码
 2. 执行sql语句
 3. 导入前后端文件
 4. 后端修改sysTest--  register
 5. 后端导入包array
 6. 后端导入包base···
 7. 前端row修改成records
 8. 修改页数选项
```html
<el-pagination
        @size-change="getList"
        @current-change="getList"
        :current-page.sync="queryParams.current" 
        :page-size.sync= "queryParams.size"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
```