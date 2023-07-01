-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2023-07-01 16:36:42
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `his`
--

-- --------------------------------------------------------

--
-- 表的结构 `checkapply`
--

CREATE TABLE `checkapply` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `Name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '申请名称',
  `Medical_Id` bigint(20) DEFAULT NULL COMMENT '病历id',
  `Creation_Time` datetime DEFAULT NULL COMMENT '申请时间',
  `Total_Sum` decimal(8,2) DEFAULT NULL COMMENT '总金额',
  `Objective` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '目的要求',
  `User_Id` bigint(20) DEFAULT NULL COMMENT '开立医生id',
  `state` bigint(20) DEFAULT NULL COMMENT '状态',
  `Invoice_Number` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发票编号（删除）',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='检查检验申请表';

-- --------------------------------------------------------

--
-- 表的结构 `checkdetailed`
--

CREATE TABLE `checkdetailed` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `CheckAppId` bigint(20) DEFAULT NULL COMMENT '检查申请id',
  `CheckProjId` bigint(20) DEFAULT NULL COMMENT '检查项目id',
  `DeptId` bigint(20) DEFAULT NULL COMMENT '执行科室id',
  `CreationTime` datetime DEFAULT NULL COMMENT '开立时间',
  `Position` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '检查目的和要求',
  `State` bigint(20) DEFAULT NULL COMMENT '1 - 已开立未交费\r\n            2 - 已交费未检查\r\n            3 - 已检查无结果\r\n            4 - 有结果',
  `Price` decimal(8,2) DEFAULT NULL COMMENT '单价',
  `Identification` bigint(20) DEFAULT NULL COMMENT '1 - 检查项\r\n            2 - 检验项\r\n            3 - 处置项',
  `InspectTime` datetime DEFAULT NULL COMMENT '检查时间',
  `Result` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '检查结果',
  `ResultTime` datetime DEFAULT NULL COMMENT '结果时间',
  `UserId2` bigint(20) DEFAULT NULL COMMENT '结果录入人员id',
  `UserId` bigint(20) DEFAULT NULL COMMENT '检查人员id',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='检查申请明细表';

-- --------------------------------------------------------

--
-- 表的结构 `checkrelation`
--

CREATE TABLE `checkrelation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `CheckProjId` bigint(20) DEFAULT NULL COMMENT '检查项目id',
  `CheckTempId` bigint(20) DEFAULT NULL COMMENT '申请模板id',
  `Position` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '检查目的和要求',
  `Department_id` bigint(20) DEFAULT NULL COMMENT '执行科室id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='检查模板关联表';

-- --------------------------------------------------------

--
-- 表的结构 `checktemplate`
--

CREATE TABLE `checktemplate` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `Name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '模板名称',
  `UserId` bigint(20) DEFAULT NULL COMMENT '创建医生id',
  `CreationTime` datetime DEFAULT NULL COMMENT '创建时间',
  `Scope` bigint(20) DEFAULT NULL COMMENT '模板使用范围',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='检查申请模板表';

-- --------------------------------------------------------

--
-- 表的结构 `constantitem`
--

CREATE TABLE `constantitem` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `ConstantTypeId` bigint(20) DEFAULT NULL COMMENT '所属常数类别ID',
  `ConstantCode` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '常数项编码',
  `ConstantName` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '常数项名称',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='常数项表';

-- --------------------------------------------------------

--
-- 表的结构 `constanttype`
--

CREATE TABLE `constanttype` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `ConstantTypeCode` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '常数类别编码',
  `ConstantTypeName` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '常数类别名称',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='常量类型表';

-- --------------------------------------------------------

--
-- 表的结构 `department`
--

CREATE TABLE `department` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `DeptCode` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '科室编码',
  `DeptName` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '科室名称',
  `DeptCategory` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '科室分类',
  `DeptTypeID` bigint(20) NOT NULL COMMENT '科室类型',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='科室表';

-- --------------------------------------------------------

--
-- 表的结构 `disease`
--

CREATE TABLE `disease` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `DiseaseCode` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '疾病助记编码',
  `DiseaseName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '疾病名称',
  `DiseaseICD` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '国际ICD编码',
  `DiseaseType` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '疾病所属分类',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='疾病表';

-- --------------------------------------------------------

--
-- 表的结构 `drugs`
--

CREATE TABLE `drugs` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `Drugs_Code` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '药品编码',
  `Drugs_Name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '药品名称',
  `Drugs_Format` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '药品规格',
  `Drugs_Unit` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '包装单位',
  `Manufacturer` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生产厂家',
  `Drugs_Dosage` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '药品剂型',
  `Drugs_Type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '药品类型',
  `Drugs_Price` decimal(8,2) DEFAULT NULL COMMENT '药品单价',
  `Mnemonic_Code` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拼音助记码',
  `Creation_Date` datetime DEFAULT NULL COMMENT '创建时间',
  `Last_Update_Date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `DelMark` bigint(20) DEFAULT NULL COMMENT '有效性标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='成品药表';

-- --------------------------------------------------------

--
-- 表的结构 `drugsdetailed`
--

CREATE TABLE `drugsdetailed` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `DrugsTemp_Id` bigint(20) DEFAULT NULL COMMENT '成药模板id',
  `Drugs_Id` bigint(20) DEFAULT NULL COMMENT '成药品id',
  `Drugs_Usage` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用法',
  `Drugs_Dosage` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用量',
  `Drugs_Frequency` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '频次'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='成药模板明细表';

-- --------------------------------------------------------

--
-- 表的结构 `drugstemplate`
--

CREATE TABLE `drugstemplate` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `Name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '模板名称',
  `UserId` bigint(20) DEFAULT NULL COMMENT '创建医生id',
  `CreationTime` datetime DEFAULT NULL COMMENT '创建时间',
  `Scope` bigint(20) DEFAULT NULL COMMENT '1 - 个人\r\n            2 - 科室\r\n            3 - 全院\r\n            ',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='成药处方模板表';

-- --------------------------------------------------------

--
-- 表的结构 `expenseclass`
--

CREATE TABLE `expenseclass` (
  `ID` bigint(20) DEFAULT NULL COMMENT 'ID',
  `ExpCode` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '费用科目编码',
  `ExpName` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '费用科目名称',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='费用科目表';

-- --------------------------------------------------------

--
-- 表的结构 `fmeditem`
--

CREATE TABLE `fmeditem` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `ItemCode` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '项目编码',
  `ItemName` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '项目名称',
  `Format` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '规格',
  `Price` decimal(8,2) DEFAULT NULL COMMENT '单价',
  `ExpClassID` bigint(20) DEFAULT NULL COMMENT '费用分类',
  `DeptId` bigint(20) DEFAULT NULL COMMENT '执行科室id',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='非药品收费项目表';

-- --------------------------------------------------------

--
-- 表的结构 `gen_table`
--

CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8mb4_bin DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8mb4_bin DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8mb4_bin DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8mb4_bin DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='代码生成业务表';

-- --------------------------------------------------------

--
-- 表的结构 `gen_table_column`
--

CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL COMMENT '编号',
  `table_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8mb4_bin DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='代码生成业务表字段';

-- --------------------------------------------------------

--
-- 表的结构 `invoice`
--

CREATE TABLE `invoice` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `InvoiceNum` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发票号码',
  `Money` decimal(8,2) DEFAULT NULL COMMENT '发票金额',
  `State` bigint(20) DEFAULT NULL COMMENT '0 - 作废\r\n            1 - 正常\r\n            2 - 重打\r\n            3 - 补打\r\n            4 - 红冲',
  `CreationTime` datetime DEFAULT NULL COMMENT '开立时间',
  `UserId` bigint(20) DEFAULT NULL COMMENT '开立人员id',
  `DailyState` bigint(20) DEFAULT NULL COMMENT '0 - 未日结审核\r\n            1 - 已经审核\r\n            默认值为0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='发票表';

-- --------------------------------------------------------

--
-- 表的结构 `medicalrecord`
--

CREATE TABLE `medicalrecord` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `Case_Number` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '病历号',
  `Register_Id` bigint(20) NOT NULL COMMENT '挂号id',
  `Medical_Readme` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '主诉',
  `Medical_Present` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '现病史',
  `Present_Treat` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '现病治疗情况',
  `Medical_History` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '既往史',
  `Medical_Allergy` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '过敏史',
  `Medical_Physique` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '体格检查',
  `Test_Order` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '检查建议',
  `Check_Order` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '检验建议',
  `Medical_Tested` varchar(512) COLLATE utf8mb4_bin NOT NULL COMMENT '检查结果',
  `Medical_Checked` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '检验结果',
  `Medical_Diagnosis` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '诊断结果',
  `Medical_Handling` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '处理意见',
  `Case_State` bigint(20) DEFAULT NULL COMMENT '病历状态',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='病历信息表';

-- --------------------------------------------------------

--
-- 表的结构 `patientcosts`
--

CREATE TABLE `patientcosts` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `InvoiceId` bigint(20) DEFAULT NULL COMMENT '发票号码',
  `RegisterId` bigint(20) DEFAULT NULL COMMENT '挂号id',
  `Name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '项目名称',
  `Price` decimal(8,2) DEFAULT NULL COMMENT '项目价格',
  `DeptId` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '执行科室名称',
  `State` bigint(20) DEFAULT NULL COMMENT '状态',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='患者费用明细表';

-- --------------------------------------------------------

--
-- 表的结构 `prescription`
--

CREATE TABLE `prescription` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `Medical_Id` bigint(20) DEFAULT NULL COMMENT '病历id',
  `User_Id` bigint(20) DEFAULT NULL COMMENT '开立医生id',
  `Prescription_Name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '处方名称',
  `Prescription_State` bigint(20) DEFAULT NULL COMMENT '处方状态',
  `Prescription_Time` datetime DEFAULT NULL COMMENT '开立时间',
  `Invoice_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发票编号',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='成药处方表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_blob_triggers`
--

CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Blob类型的触发器表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_calendars`
--

CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='日历信息表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_cron_triggers`
--

CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '时区'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Cron类型的触发器表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_fired_triggers`
--

CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) COLLATE utf8mb4_bin NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) COLLATE utf8mb4_bin NOT NULL COMMENT '状态',
  `job_name` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否接受恢复执行'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='已触发的触发器表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_job_details`
--

CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `description` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='任务详细信息表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_locks`
--

CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) COLLATE utf8mb4_bin NOT NULL COMMENT '悲观锁名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='存储的悲观锁信息表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_paused_trigger_grps`
--

CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='暂停的触发器表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_scheduler_state`
--

CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='调度器状态表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_simple_triggers`
--

CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='简单触发器的信息表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_simprop_triggers`
--

CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='同步机制的行锁表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_triggers`
--

CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) COLLATE utf8mb4_bin NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) COLLATE utf8mb4_bin NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='触发器详细信息表';

-- --------------------------------------------------------

--
-- 表的结构 `register`
--

CREATE TABLE `register` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `RealName` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '真实姓名',
  `Gender` bigint(20) DEFAULT NULL COMMENT '性别',
  `IDnumber` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '身份证号',
  `BirthDate` date DEFAULT NULL COMMENT '出生日期',
  `Age` bigint(20) DEFAULT NULL COMMENT '年龄',
  `AgeType` bigint(20) DEFAULT NULL COMMENT '年龄类型',
  `HomeAddress` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '家庭住址',
  `CaseNumber` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '一名患者在同一医院看诊多次，根据患者是否使用同一个病历本，确定该患者的“病历号码”是否相同。',
  `VisitDate` date NOT NULL COMMENT '本次看诊日期',
  `DeptId` bigint(20) DEFAULT NULL COMMENT '本次挂号科室ID',
  `UserId` bigint(20) DEFAULT NULL COMMENT '本次挂号医生id',
  `RegistId` bigint(20) NOT NULL COMMENT '本次挂号级别id',
  `SettleID` bigint(20) NOT NULL COMMENT '结算类别id',
  `IsBook` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '病历本要否',
  `RegisterTime` datetime DEFAULT NULL COMMENT '挂号时间',
  `RegisterID` bigint(20) NOT NULL COMMENT '挂号员ID',
  `VisitState` bigint(20) DEFAULT NULL COMMENT '本次看诊状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='患者历次挂号信息表';

-- --------------------------------------------------------

--
-- 表的结构 `registlevel`
--

CREATE TABLE `registlevel` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `RegistCode` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '号别编码',
  `RegistName` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '号别名称',
  `IsDefault` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '0 - 不默认\r\n            1 - 默认',
  `Sequence` bigint(20) NOT NULL COMMENT '显示顺序号',
  `RegistFee` decimal(8,2) DEFAULT NULL COMMENT '挂号费',
  `RegistQuota` bigint(20) DEFAULT NULL COMMENT '挂号限额',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='挂号级别表';

-- --------------------------------------------------------

--
-- 表的结构 `registwork`
--

CREATE TABLE `registwork` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `UserId` bigint(20) DEFAULT NULL COMMENT '员工id',
  `StartTime` datetime DEFAULT NULL COMMENT '起始时间',
  `EndTime` datetime DEFAULT NULL COMMENT '结束时间',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='挂号工作时间表';

-- --------------------------------------------------------

--
-- 表的结构 `rule`
--

CREATE TABLE `rule` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `UserId` bigint(20) NOT NULL COMMENT '医生id',
  `RuleName` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '规则名称',
  `Week` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '星期',
  `DeptId` bigint(20) DEFAULT NULL COMMENT '科室id',
  `DelMark` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='排班规则表';

-- --------------------------------------------------------

--
-- 表的结构 `scheduling`
--

CREATE TABLE `scheduling` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `SchedDate` datetime NOT NULL COMMENT '排班日期',
  `DeptId` bigint(20) NOT NULL COMMENT '科室id',
  `UserId` bigint(20) DEFAULT NULL COMMENT '医生id',
  `Noon` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '午别',
  `RuleId` bigint(20) DEFAULT NULL COMMENT '排班规则id',
  `RegistQuota` bigint(20) NOT NULL COMMENT '挂号限额',
  `State` bigint(20) DEFAULT NULL COMMENT '1=有效  0=无效'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='排班表';

-- --------------------------------------------------------

--
-- 表的结构 `settlecategory`
--

CREATE TABLE `settlecategory` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `SettleCode` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '类别编码',
  `SettleName` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '类别名称',
  `IsDefault` bigint(20) DEFAULT NULL COMMENT '是否默认',
  `Sequence` bigint(20) NOT NULL COMMENT '显示顺序号',
  `DelMark` bigint(20) DEFAULT NULL COMMENT '1为删除'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='结算类别表';

-- --------------------------------------------------------

--
-- 表的结构 `sys_config`
--

CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8mb4_bin DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_bin DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='参数配置表';

--
-- 转存表中的数据 `sys_config`
--

INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-07-01 16:01:20', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
(2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-07-01 16:01:20', '', NULL, '初始化密码 123456'),
(3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-07-01 16:01:20', '', NULL, '深色主题theme-dark，浅色主题theme-light'),
(4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-07-01 16:01:20', '', NULL, '是否开启验证码功能（true开启，false关闭）'),
(5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-07-01 16:01:20', '', NULL, '是否开启注册用户功能（true开启，false关闭）'),
(6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-07-01 16:01:20', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- --------------------------------------------------------

--
-- 表的结构 `sys_dept`
--

CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='部门表';

--
-- 转存表中的数据 `sys_dept`
--

INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-01 16:01:19', '', NULL),
(101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-01 16:01:19', '', NULL),
(102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-01 16:01:19', '', NULL),
(103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-01 16:01:19', '', NULL),
(104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-01 16:01:19', '', NULL),
(105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-01 16:01:19', '', NULL),
(106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-01 16:01:19', '', NULL),
(107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-01 16:01:19', '', NULL),
(108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-01 16:01:19', '', NULL),
(109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-01 16:01:19', '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sys_dict_data`
--

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8mb4_bin DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='字典数据表';

--
-- 转存表中的数据 `sys_dict_data`
--

INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '性别男'),
(2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '性别女'),
(3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '性别未知'),
(4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '显示菜单'),
(5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '隐藏菜单'),
(6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '正常状态'),
(7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '停用状态'),
(8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '正常状态'),
(9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '停用状态'),
(10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '默认分组'),
(11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '系统分组'),
(12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '系统默认是'),
(13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '系统默认否'),
(14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '通知'),
(15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '公告'),
(16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '正常状态'),
(17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '关闭状态'),
(18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '其他操作'),
(19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '新增操作'),
(20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '修改操作'),
(21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '删除操作'),
(22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '授权操作'),
(23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '导出操作'),
(24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '导入操作'),
(25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '强退操作'),
(26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '生成操作'),
(27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '清空操作'),
(28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '正常状态'),
(29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '停用状态');

-- --------------------------------------------------------

--
-- 表的结构 `sys_dict_type`
--

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='字典类型表';

--
-- 转存表中的数据 `sys_dict_type`
--

INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '用户性别列表'),
(2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '菜单状态列表'),
(3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '系统开关列表'),
(4, '任务状态', 'sys_job_status', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '任务状态列表'),
(5, '任务分组', 'sys_job_group', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '任务分组列表'),
(6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '系统是否列表'),
(7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '通知类型列表'),
(8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '通知状态列表'),
(9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '操作类型列表'),
(10, '系统状态', 'sys_common_status', '0', 'admin', '2023-07-01 16:01:20', '', NULL, '登录状态列表');

-- --------------------------------------------------------

--
-- 表的结构 `sys_job`
--

CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8mb4_bin DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8mb4_bin DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='定时任务调度表';

--
-- 转存表中的数据 `sys_job`
--

INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-07-01 16:01:20', '', NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_job_log`
--

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='定时任务调度日志表';

-- --------------------------------------------------------

--
-- 表的结构 `sys_logininfor`
--

CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8mb4_bin DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='系统访问记录';

--
-- 转存表中的数据 `sys_logininfor`
--

INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES
(100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-07-01 16:19:23'),
(101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-01 16:19:41');

-- --------------------------------------------------------

--
-- 表的结构 `sys_menu`
--

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8mb4_bin DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8mb4_bin DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8mb4_bin DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='菜单权限表';

--
-- 转存表中的数据 `sys_menu`
--

INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-07-01 16:01:19', '', NULL, '系统管理目录'),
(2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-07-01 16:01:19', '', NULL, '系统监控目录'),
(3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-07-01 16:01:19', '', NULL, '系统工具目录'),
(100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-07-01 16:01:19', '', NULL, '用户管理菜单'),
(101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-07-01 16:01:19', '', NULL, '角色管理菜单'),
(102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-07-01 16:01:19', '', NULL, '菜单管理菜单'),
(103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-07-01 16:01:19', '', NULL, '部门管理菜单'),
(104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-07-01 16:01:19', '', NULL, '岗位管理菜单'),
(105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-07-01 16:01:19', '', NULL, '字典管理菜单'),
(106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-07-01 16:01:19', '', NULL, '参数设置菜单'),
(107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-07-01 16:01:19', '', NULL, '通知公告菜单'),
(108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-07-01 16:01:19', '', NULL, '日志管理菜单'),
(109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-07-01 16:01:19', '', NULL, '在线用户菜单'),
(110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-07-01 16:01:19', '', NULL, '定时任务菜单'),
(111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-07-01 16:01:19', '', NULL, '数据监控菜单'),
(112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-07-01 16:01:19', '', NULL, '服务监控菜单'),
(113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-07-01 16:01:19', '', NULL, '缓存监控菜单'),
(114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-07-01 16:01:19', '', NULL, '缓存列表菜单'),
(115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-07-01 16:01:19', '', NULL, '表单构建菜单'),
(116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-07-01 16:01:19', '', NULL, '代码生成菜单'),
(117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-07-01 16:01:19', '', NULL, '系统接口菜单'),
(500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-07-01 16:01:19', '', NULL, '操作日志菜单'),
(501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-07-01 16:01:19', '', NULL, '登录日志菜单'),
(1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-07-01 16:01:20', '', NULL, ''),
(2000, '挂号', 0, 4, '/index', NULL, NULL, 1, 0, 'C', '0', '0', '', 'peoples', 'admin', '2023-07-01 16:24:56', 'admin', '2023-07-01 16:25:01', ''),
(2001, '收费', 0, 5, '/index', NULL, NULL, 1, 0, 'C', '0', '0', '', 'money', 'admin', '2023-07-01 16:27:41', 'admin', '2023-07-01 16:27:54', ''),
(2002, '门诊', 0, 6, '/index', NULL, NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2023-07-01 16:28:52', 'admin', '2023-07-01 16:28:59', ''),
(2003, '检验结果', 0, 7, '/index', NULL, NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-07-01 16:29:16', '', NULL, ''),
(2004, '待检列表', 0, 8, '/index', NULL, NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-07-01 16:29:37', '', NULL, ''),
(2005, '医技项目补录', 0, 9, '/index', NULL, NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2023-07-01 16:29:52', 'admin', '2023-07-01 16:29:57', ''),
(2006, '药物分发', 0, 10, '/index', NULL, NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-07-01 16:30:13', '', NULL, ''),
(2007, '药品目录管理', 0, 11, '/index', NULL, NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-07-01 16:30:28', '', NULL, ''),
(2008, '门诊日结核对', 0, 12, '/index', NULL, NULL, 1, 0, 'M', '0', '0', '', '#', 'admin', '2023-07-01 16:30:43', 'admin', '2023-07-01 16:30:49', ''),
(2009, '费用科目管理', 0, 13, '/index', NULL, NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-07-01 16:31:11', '', NULL, ''),
(2010, '科室管理', 0, 14, '/index', NULL, NULL, 1, 0, 'M', '0', '0', '', '#', 'admin', '2023-07-01 16:31:39', 'admin', '2023-07-01 16:31:48', ''),
(2011, '诊断目录管理', 0, 15, '/index', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2023-07-01 16:32:07', '', NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_notice`
--

CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='通知公告表';

--
-- 转存表中的数据 `sys_notice`
--

INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xe696b0e78988e69cace58685e5aeb9, '0', 'admin', '2023-07-01 16:01:20', '', NULL, '管理员'),
(2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xe7bbb4e68aa4e58685e5aeb9, '0', 'admin', '2023-07-01 16:01:20', '', NULL, '管理员');

-- --------------------------------------------------------

--
-- 表的结构 `sys_oper_log`
--

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_bin DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='操作日志记录';

--
-- 转存表中的数据 `sys_oper_log`
--

INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES
(100, '角色管理', 3, 'org.jshand.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/2', '127.0.0.1', '内网IP', '{}', NULL, 1, '普通角色已分配,不能删除', '2023-07-01 16:17:37', 0),
(101, '用户管理', 3, 'org.jshand.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:17:42', 0),
(102, '角色管理', 3, 'org.jshand.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:17:46', 0),
(103, '菜单管理', 3, 'org.jshand.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:17:55', 0),
(104, '角色管理', 1, 'org.jshand.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"RegFee\",\"roleName\":\"收费管理员\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:21:33', 0),
(105, '角色管理', 1, 'org.jshand.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":101,\"roleKey\":\"Doctor\",\"roleName\":\"门诊医生\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:22:33', 0),
(106, '角色管理', 1, 'org.jshand.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":102,\"roleKey\":\"TechDoctor\",\"roleName\":\"医技医生\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:22:42', 0),
(107, '角色管理', 1, 'org.jshand.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":103,\"roleKey\":\"PhaAdmin\",\"roleName\":\"药房管理员\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:22:52', 0),
(108, '角色管理', 1, 'org.jshand.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":104,\"roleKey\":\"FinaAdmin\",\"roleName\":\"财务管理员\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:23:02', 0),
(109, '角色管理', 1, 'org.jshand.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":105,\"roleKey\":\"SysAdmin\",\"roleName\":\"系统管理员\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:23:09', 0),
(110, '菜单管理', 1, 'org.jshand.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"挂号\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:24:56', 0),
(111, '菜单管理', 2, 'org.jshand.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-07-01 16:24:56\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"挂号\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:25:01', 0),
(112, '菜单管理', 1, 'org.jshand.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"收费\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:27:42', 0),
(113, '菜单管理', 2, 'org.jshand.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-07-01 16:27:41\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"收费\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:27:54', 0),
(114, '菜单管理', 1, 'org.jshand.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"门诊\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:28:53', 0),
(115, '菜单管理', 2, 'org.jshand.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-07-01 16:28:52\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"门诊\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:28:59', 0),
(116, '菜单管理', 1, 'org.jshand.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"检验结果\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:29:16', 0),
(117, '菜单管理', 1, 'org.jshand.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"待检列表\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:29:37', 0),
(118, '菜单管理', 1, 'org.jshand.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"医技项目补录\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:29:52', 0),
(119, '菜单管理', 2, 'org.jshand.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-07-01 16:29:52\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"医技项目补录\",\"menuType\":\"C\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:29:57', 0),
(120, '菜单管理', 1, 'org.jshand.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"药物分发\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:30:13', 0),
(121, '菜单管理', 1, 'org.jshand.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"药品目录管理\",\"menuType\":\"C\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:30:28', 0),
(122, '菜单管理', 1, 'org.jshand.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"门诊日结核对\",\"menuType\":\"M\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:30:43', 0),
(123, '菜单管理', 2, 'org.jshand.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-07-01 16:30:43\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"门诊日结核对\",\"menuType\":\"M\",\"orderNum\":12,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:30:49', 0),
(124, '菜单管理', 1, 'org.jshand.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"费用科目管理\",\"menuType\":\"C\",\"orderNum\":13,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:31:11', 0),
(125, '菜单管理', 1, 'org.jshand.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"科室管理\",\"menuType\":\"M\",\"orderNum\":13,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:31:39', 0),
(126, '菜单管理', 2, 'org.jshand.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-07-01 16:31:39\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"科室管理\",\"menuType\":\"M\",\"orderNum\":14,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:31:48', 0),
(127, '菜单管理', 1, 'org.jshand.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"诊断目录管理\",\"menuType\":\"M\",\"orderNum\":15,\"params\":{},\"parentId\":0,\"path\":\"/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:32:07', 0),
(128, '角色管理', 2, 'org.jshand.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-07-01 16:21:33\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001],\"params\":{},\"roleId\":100,\"roleKey\":\"RegFee\",\"roleName\":\"收费管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:33:15', 0),
(129, '角色管理', 2, 'org.jshand.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-07-01 16:22:33\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,2003],\"params\":{},\"roleId\":101,\"roleKey\":\"Doctor\",\"roleName\":\"门诊医生\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:33:21', 0),
(130, '角色管理', 2, 'org.jshand.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-07-01 16:22:42\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2004,2005],\"params\":{},\"roleId\":102,\"roleKey\":\"TechDoctor\",\"roleName\":\"医技医生\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:33:28', 0),
(131, '角色管理', 2, 'org.jshand.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-07-01 16:22:52\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2007],\"params\":{},\"roleId\":103,\"roleKey\":\"PhaAdmin\",\"roleName\":\"药房管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:33:35', 0),
(132, '角色管理', 2, 'org.jshand.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-07-01 16:23:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2008,2009],\"params\":{},\"roleId\":104,\"roleKey\":\"FinaAdmin\",\"roleName\":\"财务管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:33:41', 0),
(133, '角色管理', 2, 'org.jshand.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-07-01 16:23:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,2010,2011],\"params\":{},\"roleId\":105,\"roleKey\":\"SysAdmin\",\"roleName\":\"系统管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:33:52', 0),
(134, '用户管理', 1, 'org.jshand.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"收费管理员\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"status\":\"0\",\"userId\":100,\"userName\":\"RegFee\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:34:54', 0),
(135, '用户管理', 1, 'org.jshand.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"Doctor\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":101,\"userName\":\"Doctor\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:35:05', 0),
(136, '用户管理', 1, 'org.jshand.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"TechDoctor\",\"params\":{},\"postIds\":[],\"roleIds\":[102],\"status\":\"0\",\"userId\":102,\"userName\":\"TechDoctor\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:35:16', 0),
(137, '用户管理', 1, 'org.jshand.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"PhaAdmin\",\"params\":{},\"postIds\":[],\"roleIds\":[103],\"status\":\"0\",\"userId\":103,\"userName\":\"PhaAdmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:35:30', 0),
(138, '用户管理', 1, 'org.jshand.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"FinaAdmin\",\"params\":{},\"postIds\":[],\"roleIds\":[104],\"status\":\"0\",\"userId\":104,\"userName\":\"FinaAdmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:35:43', 0),
(139, '用户管理', 1, 'org.jshand.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"SysAdmin\",\"params\":{},\"postIds\":[],\"roleIds\":[105],\"status\":\"0\",\"userId\":105,\"userName\":\"SysAdmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-01 16:35:55', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_post`
--

CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='岗位信息表';

--
-- 转存表中的数据 `sys_post`
--

INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 'ceo', '董事长', 1, '0', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(2, 'se', '项目经理', 2, '0', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(3, 'hr', '人力资源', 3, '0', 'admin', '2023-07-01 16:01:19', '', NULL, ''),
(4, 'user', '普通员工', 4, '0', 'admin', '2023-07-01 16:01:19', '', NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_role`
--

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8mb4_bin DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色信息表';

--
-- 转存表中的数据 `sys_role`
--

INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-07-01 16:01:19', '', NULL, '超级管理员'),
(2, '普通角色', 'common', 2, '2', 1, 1, '0', '2', 'admin', '2023-07-01 16:01:19', '', NULL, '普通角色'),
(100, '收费管理员', 'RegFee', 0, '1', 1, 1, '0', '0', 'admin', '2023-07-01 16:21:33', 'admin', '2023-07-01 16:33:15', NULL),
(101, '门诊医生', 'Doctor', 0, '1', 1, 1, '0', '0', 'admin', '2023-07-01 16:22:33', 'admin', '2023-07-01 16:33:21', NULL),
(102, '医技医生', 'TechDoctor', 0, '1', 1, 1, '0', '0', 'admin', '2023-07-01 16:22:42', 'admin', '2023-07-01 16:33:28', NULL),
(103, '药房管理员', 'PhaAdmin', 0, '1', 1, 1, '0', '0', 'admin', '2023-07-01 16:22:52', 'admin', '2023-07-01 16:33:35', NULL),
(104, '财务管理员', 'FinaAdmin', 0, '1', 1, 1, '0', '0', 'admin', '2023-07-01 16:23:02', 'admin', '2023-07-01 16:33:41', NULL),
(105, '系统管理员', 'SysAdmin', 0, '1', 1, 1, '0', '0', 'admin', '2023-07-01 16:23:09', 'admin', '2023-07-01 16:33:52', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sys_role_dept`
--

CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色和部门关联表';

-- --------------------------------------------------------

--
-- 表的结构 `sys_role_menu`
--

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色和菜单关联表';

--
-- 转存表中的数据 `sys_role_menu`
--

INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
(100, 2000),
(100, 2001),
(101, 2002),
(101, 2003),
(102, 2004),
(102, 2005),
(103, 2006),
(103, 2007),
(104, 2008),
(104, 2009),
(105, 1),
(105, 100),
(105, 1000),
(105, 1001),
(105, 1002),
(105, 1003),
(105, 1004),
(105, 1005),
(105, 1006),
(105, 2010),
(105, 2011);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user`
--

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8mb4_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8mb4_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8mb4_bin DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8mb4_bin DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8mb4_bin DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户信息表';

--
-- 转存表中的数据 `sys_user`
--

INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-07-01 16:19:41', 'admin', '2023-07-01 16:01:19', '', '2023-07-01 16:19:41', '管理员'),
(2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2023-07-01 16:01:19', 'admin', '2023-07-01 16:01:19', '', NULL, '测试员'),
(100, NULL, 'RegFee', '收费管理员', '00', '', '', '0', '', '$2a$10$cYVHURym62g.fGcO3rCGCeHzpXxs7GydNvLOO41ZFVvgB0gXQ0g1q', '0', '0', '', NULL, 'admin', '2023-07-01 16:34:54', '', NULL, NULL),
(101, NULL, 'Doctor', 'Doctor', '00', '', '', '0', '', '$2a$10$4etZeADJrC6M1v6mc6UcbuJi6wISmm7FNcB3PZ261UIoRHUi9sNFa', '0', '0', '', NULL, 'admin', '2023-07-01 16:35:05', '', NULL, NULL),
(102, NULL, 'TechDoctor', 'TechDoctor', '00', '', '', '0', '', '$2a$10$ivDKURWT7plGyAShS7CiXeM/NC0lnu53VNhUA7/0575au6MeZhlYq', '0', '0', '', NULL, 'admin', '2023-07-01 16:35:16', '', NULL, NULL),
(103, NULL, 'PhaAdmin', 'PhaAdmin', '00', '', '', '0', '', '$2a$10$9PXtRGKpuqCIwY4ppIC1Ce5WapfNMAfCQVVVBwgdN/MNipWBgVmUK', '0', '0', '', NULL, 'admin', '2023-07-01 16:35:30', '', NULL, NULL),
(104, NULL, 'FinaAdmin', 'FinaAdmin', '00', '', '', '0', '', '$2a$10$k9EnG1Nzr.M7mGZ.lLbG/ObeLWX0dGAtQgdfJYNQoN2MOcmtBOONi', '0', '0', '', NULL, 'admin', '2023-07-01 16:35:43', '', NULL, NULL),
(105, NULL, 'SysAdmin', 'SysAdmin', '00', '', '', '0', '', '$2a$10$0a4LNSfV026tXMDTxPJR5O1NL3FqA/jHUselCgcjD4iF0GI0N5qIO', '0', '0', '', NULL, 'admin', '2023-07-01 16:35:55', '', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_post`
--

CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户与岗位关联表';

--
-- 转存表中的数据 `sys_user_post`
--

INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_role`
--

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户和角色关联表';

--
-- 转存表中的数据 `sys_user_role`
--

INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(100, 100),
(101, 101),
(102, 102),
(103, 103),
(104, 104),
(105, 105);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `UserName` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '登录名',
  `Password` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `RealName` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '真实姓名',
  `UserTypeID` bigint(20) DEFAULT NULL COMMENT '1 - 挂号人员\r\n            2 - 门诊医生\r\n            3 - 医技医生\r\n            4 - 药房人员\r\n            5 - 财务人员\r\n            6 - 行政人员\r\n            ',
  `DocTitleID` bigint(20) DEFAULT NULL COMMENT '医生职称',
  `IsScheduling` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否排班',
  `DeptId` bigint(20) NOT NULL COMMENT '所在科室ID',
  `RegistId` bigint(20) DEFAULT NULL COMMENT '挂号级别ID',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除标记'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户表(医院员工表)';

-- --------------------------------------------------------

--
-- 表的结构 `病历疾病诊断`
--

CREATE TABLE `病历疾病诊断` (
  `id` bigint(20) DEFAULT NULL COMMENT 'id',
  `MedicalId` bigint(20) DEFAULT NULL COMMENT '病历id',
  `DrugId` bigint(20) DEFAULT NULL COMMENT '疾病id',
  `state` bigint(20) DEFAULT NULL COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='病历疾病诊断';

--
-- 转储表的索引
--

--
-- 表的索引 `checkapply`
--
ALTER TABLE `checkapply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_病历id` (`Medical_Id`);

--
-- 表的索引 `checkdetailed`
--
ALTER TABLE `checkdetailed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_检查人员id` (`UserId`),
  ADD KEY `FK_检查科室id` (`DeptId`),
  ADD KEY `FK_申请id` (`CheckAppId`),
  ADD KEY `FK_项目id` (`CheckProjId`);

--
-- 表的索引 `checkrelation`
--
ALTER TABLE `checkrelation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_检查id` (`CheckProjId`),
  ADD KEY `FK_模板id` (`CheckTempId`);

--
-- 表的索引 `checktemplate`
--
ALTER TABLE `checktemplate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_医生id` (`UserId`);

--
-- 表的索引 `constantitem`
--
ALTER TABLE `constantitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_常数类别` (`ConstantTypeId`);

--
-- 表的索引 `constanttype`
--
ALTER TABLE `constanttype`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `drugsdetailed`
--
ALTER TABLE `drugsdetailed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_成药品id` (`Drugs_Id`),
  ADD KEY `FK_成药模板id` (`DrugsTemp_Id`);

--
-- 表的索引 `drugstemplate`
--
ALTER TABLE `drugstemplate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_医生id` (`UserId`);

--
-- 表的索引 `fmeditem`
--
ALTER TABLE `fmeditem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Reference_42` (`ExpClassID`),
  ADD KEY `FK_执行科室id` (`DeptId`);

--
-- 表的索引 `gen_table`
--
ALTER TABLE `gen_table`
  ADD PRIMARY KEY (`table_id`);

--
-- 表的索引 `gen_table_column`
--
ALTER TABLE `gen_table_column`
  ADD PRIMARY KEY (`column_id`);

--
-- 表的索引 `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_开立人员id` (`UserId`);

--
-- 表的索引 `medicalrecord`
--
ALTER TABLE `medicalrecord`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_挂号id` (`Register_Id`);

--
-- 表的索引 `patientcosts`
--
ALTER TABLE `patientcosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_发票号码` (`InvoiceId`),
  ADD KEY `FK_挂号id` (`RegisterId`);

--
-- 表的索引 `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_开立医生id` (`User_Id`),
  ADD KEY `FK_病历id` (`Medical_Id`);

--
-- 表的索引 `qrtz_blob_triggers`
--
ALTER TABLE `qrtz_blob_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`);

--
-- 表的索引 `qrtz_calendars`
--
ALTER TABLE `qrtz_calendars`
  ADD PRIMARY KEY (`sched_name`,`calendar_name`);

--
-- 表的索引 `qrtz_cron_triggers`
--
ALTER TABLE `qrtz_cron_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`);

--
-- 表的索引 `qrtz_fired_triggers`
--
ALTER TABLE `qrtz_fired_triggers`
  ADD PRIMARY KEY (`sched_name`,`entry_id`);

--
-- 表的索引 `qrtz_job_details`
--
ALTER TABLE `qrtz_job_details`
  ADD PRIMARY KEY (`sched_name`,`job_name`,`job_group`);

--
-- 表的索引 `qrtz_locks`
--
ALTER TABLE `qrtz_locks`
  ADD PRIMARY KEY (`sched_name`,`lock_name`);

--
-- 表的索引 `qrtz_paused_trigger_grps`
--
ALTER TABLE `qrtz_paused_trigger_grps`
  ADD PRIMARY KEY (`sched_name`,`trigger_group`);

--
-- 表的索引 `qrtz_scheduler_state`
--
ALTER TABLE `qrtz_scheduler_state`
  ADD PRIMARY KEY (`sched_name`,`instance_name`);

--
-- 表的索引 `qrtz_simple_triggers`
--
ALTER TABLE `qrtz_simple_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`);

--
-- 表的索引 `qrtz_simprop_triggers`
--
ALTER TABLE `qrtz_simprop_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`);

--
-- 表的索引 `qrtz_triggers`
--
ALTER TABLE `qrtz_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  ADD KEY `sched_name` (`sched_name`,`job_name`,`job_group`);

--
-- 表的索引 `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_医生id` (`UserId`),
  ADD KEY `FK_挂号级别id` (`RegistId`),
  ADD KEY `FK_结算类别id` (`SettleID`);

--
-- 表的索引 `registlevel`
--
ALTER TABLE `registlevel`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `registwork`
--
ALTER TABLE `registwork`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_员工id` (`UserId`);

--
-- 表的索引 `rule`
--
ALTER TABLE `rule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_医生id` (`UserId`),
  ADD KEY `FK_科室id` (`DeptId`);

--
-- 表的索引 `scheduling`
--
ALTER TABLE `scheduling`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_医生id` (`UserId`),
  ADD KEY `FK_科室id` (`DeptId`),
  ADD KEY `FK_规则id` (`RuleId`);

--
-- 表的索引 `settlecategory`
--
ALTER TABLE `settlecategory`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_config`
--
ALTER TABLE `sys_config`
  ADD PRIMARY KEY (`config_id`);

--
-- 表的索引 `sys_dept`
--
ALTER TABLE `sys_dept`
  ADD PRIMARY KEY (`dept_id`);

--
-- 表的索引 `sys_dict_data`
--
ALTER TABLE `sys_dict_data`
  ADD PRIMARY KEY (`dict_code`);

--
-- 表的索引 `sys_dict_type`
--
ALTER TABLE `sys_dict_type`
  ADD PRIMARY KEY (`dict_id`),
  ADD UNIQUE KEY `dict_type` (`dict_type`);

--
-- 表的索引 `sys_job`
--
ALTER TABLE `sys_job`
  ADD PRIMARY KEY (`job_id`,`job_name`,`job_group`);

--
-- 表的索引 `sys_job_log`
--
ALTER TABLE `sys_job_log`
  ADD PRIMARY KEY (`job_log_id`);

--
-- 表的索引 `sys_logininfor`
--
ALTER TABLE `sys_logininfor`
  ADD PRIMARY KEY (`info_id`),
  ADD KEY `idx_sys_logininfor_s` (`status`),
  ADD KEY `idx_sys_logininfor_lt` (`login_time`);

--
-- 表的索引 `sys_menu`
--
ALTER TABLE `sys_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- 表的索引 `sys_notice`
--
ALTER TABLE `sys_notice`
  ADD PRIMARY KEY (`notice_id`);

--
-- 表的索引 `sys_oper_log`
--
ALTER TABLE `sys_oper_log`
  ADD PRIMARY KEY (`oper_id`),
  ADD KEY `idx_sys_oper_log_bt` (`business_type`),
  ADD KEY `idx_sys_oper_log_s` (`status`),
  ADD KEY `idx_sys_oper_log_ot` (`oper_time`);

--
-- 表的索引 `sys_post`
--
ALTER TABLE `sys_post`
  ADD PRIMARY KEY (`post_id`);

--
-- 表的索引 `sys_role`
--
ALTER TABLE `sys_role`
  ADD PRIMARY KEY (`role_id`);

--
-- 表的索引 `sys_role_dept`
--
ALTER TABLE `sys_role_dept`
  ADD PRIMARY KEY (`role_id`,`dept_id`);

--
-- 表的索引 `sys_role_menu`
--
ALTER TABLE `sys_role_menu`
  ADD PRIMARY KEY (`role_id`,`menu_id`);

--
-- 表的索引 `sys_user`
--
ALTER TABLE `sys_user`
  ADD PRIMARY KEY (`user_id`);

--
-- 表的索引 `sys_user_post`
--
ALTER TABLE `sys_user_post`
  ADD PRIMARY KEY (`user_id`,`post_id`);

--
-- 表的索引 `sys_user_role`
--
ALTER TABLE `sys_user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_科室id` (`DeptId`);

--
-- 表的索引 `病历疾病诊断`
--
ALTER TABLE `病历疾病诊断`
  ADD KEY `FK_Reference_38` (`MedicalId`),
  ADD KEY `FK_Reference_39` (`DrugId`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `department`
--
ALTER TABLE `department`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id';

--
-- 使用表AUTO_INCREMENT `gen_table`
--
ALTER TABLE `gen_table`
  MODIFY `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号';

--
-- 使用表AUTO_INCREMENT `gen_table_column`
--
ALTER TABLE `gen_table_column`
  MODIFY `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号';

--
-- 使用表AUTO_INCREMENT `registlevel`
--
ALTER TABLE `registlevel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id';

--
-- 使用表AUTO_INCREMENT `settlecategory`
--
ALTER TABLE `settlecategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id';

--
-- 使用表AUTO_INCREMENT `sys_config`
--
ALTER TABLE `sys_config`
  MODIFY `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键', AUTO_INCREMENT=100;

--
-- 使用表AUTO_INCREMENT `sys_dept`
--
ALTER TABLE `sys_dept`
  MODIFY `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id', AUTO_INCREMENT=200;

--
-- 使用表AUTO_INCREMENT `sys_dict_data`
--
ALTER TABLE `sys_dict_data`
  MODIFY `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码', AUTO_INCREMENT=100;

--
-- 使用表AUTO_INCREMENT `sys_dict_type`
--
ALTER TABLE `sys_dict_type`
  MODIFY `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键', AUTO_INCREMENT=100;

--
-- 使用表AUTO_INCREMENT `sys_job`
--
ALTER TABLE `sys_job`
  MODIFY `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID', AUTO_INCREMENT=100;

--
-- 使用表AUTO_INCREMENT `sys_job_log`
--
ALTER TABLE `sys_job_log`
  MODIFY `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID';

--
-- 使用表AUTO_INCREMENT `sys_logininfor`
--
ALTER TABLE `sys_logininfor`
  MODIFY `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID', AUTO_INCREMENT=102;

--
-- 使用表AUTO_INCREMENT `sys_menu`
--
ALTER TABLE `sys_menu`
  MODIFY `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID', AUTO_INCREMENT=2012;

--
-- 使用表AUTO_INCREMENT `sys_notice`
--
ALTER TABLE `sys_notice`
  MODIFY `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID', AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `sys_oper_log`
--
ALTER TABLE `sys_oper_log`
  MODIFY `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键', AUTO_INCREMENT=140;

--
-- 使用表AUTO_INCREMENT `sys_post`
--
ALTER TABLE `sys_post`
  MODIFY `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `sys_role`
--
ALTER TABLE `sys_role`
  MODIFY `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID', AUTO_INCREMENT=106;

--
-- 使用表AUTO_INCREMENT `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID', AUTO_INCREMENT=106;

--
-- 限制导出的表
--

--
-- 限制表 `qrtz_blob_triggers`
--
ALTER TABLE `qrtz_blob_triggers`
  ADD CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`,`trigger_name`,`trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`);

--
-- 限制表 `qrtz_cron_triggers`
--
ALTER TABLE `qrtz_cron_triggers`
  ADD CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`,`trigger_name`,`trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`);

--
-- 限制表 `qrtz_simple_triggers`
--
ALTER TABLE `qrtz_simple_triggers`
  ADD CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`,`trigger_name`,`trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`);

--
-- 限制表 `qrtz_simprop_triggers`
--
ALTER TABLE `qrtz_simprop_triggers`
  ADD CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`,`trigger_name`,`trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`);

--
-- 限制表 `qrtz_triggers`
--
ALTER TABLE `qrtz_triggers`
  ADD CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`,`job_name`,`job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
