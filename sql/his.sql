# Host: localhost  (Version: 5.7.26)
# Date: 2023-07-01 16:04:19
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES gb2312 */;

#
# Structure for table "checkapply"
#

DROP TABLE IF EXISTS `checkapply`;
CREATE TABLE `checkapply` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `Name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��������',
  `Medical_Id` bigint(20) DEFAULT NULL COMMENT '����id',
  `Creation_Time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `Total_Sum` decimal(8,2) DEFAULT NULL COMMENT '�ܽ��',
  `Objective` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Ŀ��Ҫ��',
  `User_Id` bigint(20) DEFAULT NULL COMMENT '����ҽ��id',
  `state` bigint(20) DEFAULT NULL COMMENT '״̬',
  `Invoice_Number` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��Ʊ��ţ�ɾ����',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ɾ�����',
  PRIMARY KEY (`id`),
  KEY `FK_����id` (`Medical_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�����������';

#
# Data for table "checkapply"
#

/*!40000 ALTER TABLE `checkapply` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkapply` ENABLE KEYS */;

#
# Structure for table "checkdetailed"
#

DROP TABLE IF EXISTS `checkdetailed`;
CREATE TABLE `checkdetailed` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `CheckAppId` bigint(20) DEFAULT NULL COMMENT '�������id',
  `CheckProjId` bigint(20) DEFAULT NULL COMMENT '�����Ŀid',
  `DeptId` bigint(20) DEFAULT NULL COMMENT 'ִ�п���id',
  `CreationTime` datetime DEFAULT NULL COMMENT '����ʱ��',
  `Position` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '���Ŀ�ĺ�Ҫ��',
  `State` bigint(20) DEFAULT NULL COMMENT '1 - �ѿ���δ����\r\n            2 - �ѽ���δ���\r\n            3 - �Ѽ���޽��\r\n            4 - �н��',
  `Price` decimal(8,2) DEFAULT NULL COMMENT '����',
  `Identification` bigint(20) DEFAULT NULL COMMENT '1 - �����\r\n            2 - ������\r\n            3 - ������',
  `InspectTime` datetime DEFAULT NULL COMMENT '���ʱ��',
  `Result` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�����',
  `ResultTime` datetime DEFAULT NULL COMMENT '���ʱ��',
  `UserId2` bigint(20) DEFAULT NULL COMMENT '���¼����Աid',
  `UserId` bigint(20) DEFAULT NULL COMMENT '�����Աid',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ɾ�����',
  PRIMARY KEY (`id`),
  KEY `FK_�����Աid` (`UserId`),
  KEY `FK_������id` (`DeptId`),
  KEY `FK_����id` (`CheckAppId`),
  KEY `FK_��Ŀid` (`CheckProjId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='���������ϸ��';

#
# Data for table "checkdetailed"
#

/*!40000 ALTER TABLE `checkdetailed` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkdetailed` ENABLE KEYS */;

#
# Structure for table "checkrelation"
#

DROP TABLE IF EXISTS `checkrelation`;
CREATE TABLE `checkrelation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `CheckProjId` bigint(20) DEFAULT NULL COMMENT '�����Ŀid',
  `CheckTempId` bigint(20) DEFAULT NULL COMMENT '����ģ��id',
  `Position` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '���Ŀ�ĺ�Ҫ��',
  `Department_id` bigint(20) DEFAULT NULL COMMENT 'ִ�п���id',
  PRIMARY KEY (`id`),
  KEY `FK_���id` (`CheckProjId`),
  KEY `FK_ģ��id` (`CheckTempId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='���ģ�������';

#
# Data for table "checkrelation"
#

/*!40000 ALTER TABLE `checkrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkrelation` ENABLE KEYS */;

#
# Structure for table "checktemplate"
#

DROP TABLE IF EXISTS `checktemplate`;
CREATE TABLE `checktemplate` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `Name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ģ������',
  `UserId` bigint(20) DEFAULT NULL COMMENT '����ҽ��id',
  `CreationTime` datetime DEFAULT NULL COMMENT '����ʱ��',
  `Scope` bigint(20) DEFAULT NULL COMMENT 'ģ��ʹ�÷�Χ',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ɾ�����',
  PRIMARY KEY (`id`),
  KEY `FK_ҽ��id` (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�������ģ���';

#
# Data for table "checktemplate"
#

/*!40000 ALTER TABLE `checktemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `checktemplate` ENABLE KEYS */;

#
# Structure for table "constantitem"
#

DROP TABLE IF EXISTS `constantitem`;
CREATE TABLE `constantitem` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `ConstantTypeId` bigint(20) DEFAULT NULL COMMENT '�����������ID',
  `ConstantCode` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '���������',
  `ConstantName` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '����������',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ɾ�����',
  PRIMARY KEY (`id`),
  KEY `FK_�������` (`ConstantTypeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�������';

#
# Data for table "constantitem"
#

/*!40000 ALTER TABLE `constantitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `constantitem` ENABLE KEYS */;

#
# Structure for table "constanttype"
#

DROP TABLE IF EXISTS `constanttype`;
CREATE TABLE `constanttype` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `ConstantTypeCode` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '����������',
  `ConstantTypeName` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�����������',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ɾ�����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�������ͱ�';

#
# Data for table "constanttype"
#

/*!40000 ALTER TABLE `constanttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `constanttype` ENABLE KEYS */;

#
# Structure for table "department"
#

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `DeptCode` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '���ұ���',
  `DeptName` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `DeptCategory` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '���ҷ���',
  `DeptTypeID` bigint(20) NOT NULL COMMENT '��������',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ɾ�����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='���ұ�';

#
# Data for table "department"
#

/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

#
# Structure for table "disease"
#

DROP TABLE IF EXISTS `disease`;
CREATE TABLE `disease` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `DiseaseCode` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�������Ǳ���',
  `DiseaseName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��������',
  `DiseaseICD` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '����ICD����',
  `DiseaseType` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '������������',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ɾ�����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='������';

#
# Data for table "disease"
#

/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;

#
# Structure for table "drugs"
#

DROP TABLE IF EXISTS `drugs`;
CREATE TABLE `drugs` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `Drugs_Code` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ҩƷ����',
  `Drugs_Name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ҩƷ����',
  `Drugs_Format` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ҩƷ���',
  `Drugs_Unit` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��װ��λ',
  `Manufacturer` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��������',
  `Drugs_Dosage` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ҩƷ����',
  `Drugs_Type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ҩƷ����',
  `Drugs_Price` decimal(8,2) DEFAULT NULL COMMENT 'ҩƷ����',
  `Mnemonic_Code` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ƴ��������',
  `Creation_Date` datetime DEFAULT NULL COMMENT '����ʱ��',
  `Last_Update_Date` datetime DEFAULT NULL COMMENT '����޸�ʱ��',
  `DelMark` bigint(20) DEFAULT NULL COMMENT '��Ч�Ա��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��Ʒҩ��';

#
# Data for table "drugs"
#

/*!40000 ALTER TABLE `drugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `drugs` ENABLE KEYS */;

#
# Structure for table "drugsdetailed"
#

DROP TABLE IF EXISTS `drugsdetailed`;
CREATE TABLE `drugsdetailed` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `DrugsTemp_Id` bigint(20) DEFAULT NULL COMMENT '��ҩģ��id',
  `Drugs_Id` bigint(20) DEFAULT NULL COMMENT '��ҩƷid',
  `Drugs_Usage` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�÷�',
  `Drugs_Dosage` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '����',
  `Drugs_Frequency` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Ƶ��',
  PRIMARY KEY (`id`),
  KEY `FK_��ҩƷid` (`Drugs_Id`),
  KEY `FK_��ҩģ��id` (`DrugsTemp_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��ҩģ����ϸ��';

#
# Data for table "drugsdetailed"
#

/*!40000 ALTER TABLE `drugsdetailed` DISABLE KEYS */;
/*!40000 ALTER TABLE `drugsdetailed` ENABLE KEYS */;

#
# Structure for table "drugstemplate"
#

DROP TABLE IF EXISTS `drugstemplate`;
CREATE TABLE `drugstemplate` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `Name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ģ������',
  `UserId` bigint(20) DEFAULT NULL COMMENT '����ҽ��id',
  `CreationTime` datetime DEFAULT NULL COMMENT '����ʱ��',
  `Scope` bigint(20) DEFAULT NULL COMMENT '1 - ����\r\n            2 - ����\r\n            3 - ȫԺ\r\n            ',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ɾ�����',
  PRIMARY KEY (`id`),
  KEY `FK_ҽ��id` (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��ҩ����ģ���';

#
# Data for table "drugstemplate"
#

/*!40000 ALTER TABLE `drugstemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `drugstemplate` ENABLE KEYS */;

#
# Structure for table "expenseclass"
#

DROP TABLE IF EXISTS `expenseclass`;
CREATE TABLE `expenseclass` (
  `ID` bigint(20) DEFAULT NULL COMMENT 'ID',
  `ExpCode` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '���ÿ�Ŀ����',
  `ExpName` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '���ÿ�Ŀ����',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ɾ�����'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='���ÿ�Ŀ��';

#
# Data for table "expenseclass"
#

/*!40000 ALTER TABLE `expenseclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenseclass` ENABLE KEYS */;

#
# Structure for table "fmeditem"
#

DROP TABLE IF EXISTS `fmeditem`;
CREATE TABLE `fmeditem` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `ItemCode` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��Ŀ����',
  `ItemName` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��Ŀ����',
  `Format` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '���',
  `Price` decimal(8,2) DEFAULT NULL COMMENT '����',
  `ExpClassID` bigint(20) DEFAULT NULL COMMENT '���÷���',
  `DeptId` bigint(20) DEFAULT NULL COMMENT 'ִ�п���id',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ɾ�����',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_42` (`ExpClassID`),
  KEY `FK_ִ�п���id` (`DeptId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��ҩƷ�շ���Ŀ��';

#
# Data for table "fmeditem"
#

/*!40000 ALTER TABLE `fmeditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `fmeditem` ENABLE KEYS */;

#
# Structure for table "gen_table"
#

DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '���',
  `table_name` varchar(200) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `table_comment` varchar(500) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `sub_table_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�����ӱ�ı���',
  `sub_table_fk_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�ӱ�����������',
  `class_name` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'ʵ��������',
  `tpl_category` varchar(200) COLLATE utf8mb4_bin DEFAULT 'crud' COMMENT 'ʹ�õ�ģ�壨crud������� tree���������',
  `package_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '���ɰ�·��',
  `module_name` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '����ģ����',
  `business_name` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '����ҵ����',
  `function_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '���ɹ�����',
  `function_author` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '���ɹ�������',
  `gen_type` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '���ɴ��뷽ʽ��0zipѹ���� 1�Զ���·����',
  `gen_path` varchar(200) COLLATE utf8mb4_bin DEFAULT '/' COMMENT '����·��������Ĭ����Ŀ·����',
  `options` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��������ѡ��',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��������ҵ���';

#
# Data for table "gen_table"
#


#
# Structure for table "gen_table_column"
#

DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '���',
  `table_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��������',
  `column_name` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '������',
  `column_comment` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '������',
  `column_type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '������',
  `java_type` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'JAVA����',
  `java_field` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'JAVA�ֶ���',
  `is_pk` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�Ƿ�������1�ǣ�',
  `is_increment` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�Ƿ�������1�ǣ�',
  `is_required` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�Ƿ���1�ǣ�',
  `is_insert` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�Ƿ�Ϊ�����ֶΣ�1�ǣ�',
  `is_edit` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�Ƿ�༭�ֶΣ�1�ǣ�',
  `is_list` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�Ƿ��б��ֶΣ�1�ǣ�',
  `is_query` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�Ƿ��ѯ�ֶΣ�1�ǣ�',
  `query_type` varchar(200) COLLATE utf8mb4_bin DEFAULT 'EQ' COMMENT '��ѯ��ʽ�����ڡ������ڡ����ڡ�С�ڡ���Χ��',
  `html_type` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��ʾ���ͣ��ı����ı��������򡢸�ѡ�򡢵�ѡ�����ڿؼ���',
  `dict_type` varchar(200) COLLATE utf8mb4_bin DEFAULT '' COMMENT '�ֵ�����',
  `sort` int(11) DEFAULT NULL COMMENT '����',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��������ҵ����ֶ�';

#
# Data for table "gen_table_column"
#


#
# Structure for table "invoice"
#

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `InvoiceNum` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��Ʊ����',
  `Money` decimal(8,2) DEFAULT NULL COMMENT '��Ʊ���',
  `State` bigint(20) DEFAULT NULL COMMENT '0 - ����\r\n            1 - ����\r\n            2 - �ش�\r\n            3 - ����\r\n            4 - ���',
  `CreationTime` datetime DEFAULT NULL COMMENT '����ʱ��',
  `UserId` bigint(20) DEFAULT NULL COMMENT '������Աid',
  `DailyState` bigint(20) DEFAULT NULL COMMENT '0 - δ�ս����\r\n            1 - �Ѿ����\r\n            Ĭ��ֵΪ0',
  PRIMARY KEY (`id`),
  KEY `FK_������Աid` (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��Ʊ��';

#
# Data for table "invoice"
#

/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;

#
# Structure for table "medicalrecord"
#

DROP TABLE IF EXISTS `medicalrecord`;
CREATE TABLE `medicalrecord` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `Case_Number` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '������',
  `Register_Id` bigint(20) NOT NULL COMMENT '�Һ�id',
  `Medical_Readme` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '����',
  `Medical_Present` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�ֲ�ʷ',
  `Present_Treat` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�ֲ��������',
  `Medical_History` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '����ʷ',
  `Medical_Allergy` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '����ʷ',
  `Medical_Physique` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�����',
  `Test_Order` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��齨��',
  `Check_Order` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '���齨��',
  `Medical_Tested` varchar(512) COLLATE utf8mb4_bin NOT NULL COMMENT '�����',
  `Medical_Checked` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '������',
  `Medical_Diagnosis` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��Ͻ��',
  `Medical_Handling` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�������',
  `Case_State` bigint(20) DEFAULT NULL COMMENT '����״̬',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ɾ�����',
  PRIMARY KEY (`id`),
  KEY `FK_�Һ�id` (`Register_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='������Ϣ��';

#
# Data for table "medicalrecord"
#

/*!40000 ALTER TABLE `medicalrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicalrecord` ENABLE KEYS */;

#
# Structure for table "patientcosts"
#

DROP TABLE IF EXISTS `patientcosts`;
CREATE TABLE `patientcosts` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `InvoiceId` bigint(20) DEFAULT NULL COMMENT '��Ʊ����',
  `RegisterId` bigint(20) DEFAULT NULL COMMENT '�Һ�id',
  `Name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��Ŀ����',
  `Price` decimal(8,2) DEFAULT NULL COMMENT '��Ŀ�۸�',
  `DeptId` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ִ�п�������',
  `State` bigint(20) DEFAULT NULL COMMENT '״̬',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ɾ�����',
  PRIMARY KEY (`id`),
  KEY `FK_��Ʊ����` (`InvoiceId`),
  KEY `FK_�Һ�id` (`RegisterId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='���߷�����ϸ��';

#
# Data for table "patientcosts"
#

/*!40000 ALTER TABLE `patientcosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientcosts` ENABLE KEYS */;

#
# Structure for table "prescription"
#

DROP TABLE IF EXISTS `prescription`;
CREATE TABLE `prescription` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `Medical_Id` bigint(20) DEFAULT NULL COMMENT '����id',
  `User_Id` bigint(20) DEFAULT NULL COMMENT '����ҽ��id',
  `Prescription_Name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��������',
  `Prescription_State` bigint(20) DEFAULT NULL COMMENT '����״̬',
  `Prescription_Time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `Invoice_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��Ʊ���',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ɾ�����',
  PRIMARY KEY (`id`),
  KEY `FK_����ҽ��id` (`User_Id`),
  KEY `FK_����id` (`Medical_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��ҩ������';

#
# Data for table "prescription"
#

/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;

#
# Structure for table "qrtz_calendars"
#

DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `calendar_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `calendar` blob NOT NULL COMMENT '��ų־û�calendar����',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='������Ϣ��';

#
# Data for table "qrtz_calendars"
#


#
# Structure for table "qrtz_fired_triggers"
#

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `entry_id` varchar(95) COLLATE utf8mb4_bin NOT NULL COMMENT '������ʵ��id',
  `trigger_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers��trigger_name�����',
  `trigger_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers��trigger_group�����',
  `instance_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '������ʵ����',
  `fired_time` bigint(13) NOT NULL COMMENT '������ʱ��',
  `sched_time` bigint(13) NOT NULL COMMENT '��ʱ���ƶ���ʱ��',
  `priority` int(11) NOT NULL COMMENT '���ȼ�',
  `state` varchar(16) COLLATE utf8mb4_bin NOT NULL COMMENT '״̬',
  `job_name` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��������',
  `job_group` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��������',
  `is_nonconcurrent` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�Ƿ񲢷�',
  `requests_recovery` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�Ƿ���ָܻ�ִ��',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�Ѵ����Ĵ�������';

#
# Data for table "qrtz_fired_triggers"
#


#
# Structure for table "qrtz_job_details"
#

DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `job_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `job_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `description` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��ؽ���',
  `job_class_name` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT 'ִ������������',
  `is_durable` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT '�Ƿ�־û�',
  `is_nonconcurrent` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT '�Ƿ񲢷�',
  `is_update_data` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT '�Ƿ��������',
  `requests_recovery` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT '�Ƿ���ָܻ�ִ��',
  `job_data` blob COMMENT '��ų־û�job����',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='������ϸ��Ϣ��';

#
# Data for table "qrtz_job_details"
#


#
# Structure for table "qrtz_locks"
#

DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `lock_name` varchar(40) COLLATE utf8mb4_bin NOT NULL COMMENT '����������',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�洢�ı�������Ϣ��';

#
# Data for table "qrtz_locks"
#


#
# Structure for table "qrtz_paused_trigger_grps"
#

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `trigger_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers��trigger_group�����',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��ͣ�Ĵ�������';

#
# Data for table "qrtz_paused_trigger_grps"
#


#
# Structure for table "qrtz_scheduler_state"
#

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `instance_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'ʵ������',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '�ϴμ��ʱ��',
  `checkin_interval` bigint(13) NOT NULL COMMENT '�����ʱ��',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='������״̬��';

#
# Data for table "qrtz_scheduler_state"
#


#
# Structure for table "qrtz_triggers"
#

DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `trigger_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '������������',
  `trigger_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '�����������������',
  `job_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_job_details��job_name�����',
  `job_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_job_details��job_group�����',
  `description` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��ؽ���',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '��һ�δ���ʱ�䣨���룩',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '��һ�δ���ʱ�䣨Ĭ��Ϊ-1��ʾ��������',
  `priority` int(11) DEFAULT NULL COMMENT '���ȼ�',
  `trigger_state` varchar(16) COLLATE utf8mb4_bin NOT NULL COMMENT '������״̬',
  `trigger_type` varchar(8) COLLATE utf8mb4_bin NOT NULL COMMENT '������������',
  `start_time` bigint(13) NOT NULL COMMENT '��ʼʱ��',
  `end_time` bigint(13) DEFAULT NULL COMMENT '����ʱ��',
  `calendar_name` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�ճ̱�����',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '����ִ�еĲ���',
  `job_data` blob COMMENT '��ų־û�job����',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��������ϸ��Ϣ��';

#
# Data for table "qrtz_triggers"
#


#
# Structure for table "qrtz_simprop_triggers"
#

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `trigger_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers��trigger_name�����',
  `trigger_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers��trigger_group�����',
  `str_prop_1` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'String���͵�trigger�ĵ�һ������',
  `str_prop_2` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'String���͵�trigger�ĵڶ�������',
  `str_prop_3` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'String���͵�trigger�ĵ���������',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int���͵�trigger�ĵ�һ������',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int���͵�trigger�ĵڶ�������',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long���͵�trigger�ĵ�һ������',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long���͵�trigger�ĵڶ�������',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal���͵�trigger�ĵ�һ������',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal���͵�trigger�ĵڶ�������',
  `bool_prop_1` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Boolean���͵�trigger�ĵ�һ������',
  `bool_prop_2` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Boolean���͵�trigger�ĵڶ�������',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='ͬ�����Ƶ�������';

#
# Data for table "qrtz_simprop_triggers"
#


#
# Structure for table "qrtz_simple_triggers"
#

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `trigger_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers��trigger_name�����',
  `trigger_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers��trigger_group�����',
  `repeat_count` bigint(7) NOT NULL COMMENT '�ظ��Ĵ���ͳ��',
  `repeat_interval` bigint(12) NOT NULL COMMENT '�ظ��ļ��ʱ��',
  `times_triggered` bigint(10) NOT NULL COMMENT '�Ѿ������Ĵ���',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�򵥴���������Ϣ��';

#
# Data for table "qrtz_simple_triggers"
#


#
# Structure for table "qrtz_cron_triggers"
#

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `trigger_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers��trigger_name�����',
  `trigger_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers��trigger_group�����',
  `cron_expression` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'cron���ʽ',
  `time_zone_id` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ʱ��',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Cron���͵Ĵ�������';

#
# Data for table "qrtz_cron_triggers"
#


#
# Structure for table "qrtz_blob_triggers"
#

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `trigger_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers��trigger_name�����',
  `trigger_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers��trigger_group�����',
  `blob_data` blob COMMENT '��ų־û�Trigger����',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Blob���͵Ĵ�������';

#
# Data for table "qrtz_blob_triggers"
#


#
# Structure for table "register"
#

DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `RealName` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��ʵ����',
  `Gender` bigint(20) DEFAULT NULL COMMENT '�Ա�',
  `IDnumber` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '���֤��',
  `BirthDate` date DEFAULT NULL COMMENT '��������',
  `Age` bigint(20) DEFAULT NULL COMMENT '����',
  `AgeType` bigint(20) DEFAULT NULL COMMENT '��������',
  `HomeAddress` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��ͥסַ',
  `CaseNumber` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'һ��������ͬһҽԺ�����Σ����ݻ����Ƿ�ʹ��ͬһ����������ȷ���û��ߵġ��������롱�Ƿ���ͬ��',
  `VisitDate` date NOT NULL COMMENT '���ο�������',
  `DeptId` bigint(20) DEFAULT NULL COMMENT '���ιҺſ���ID',
  `UserId` bigint(20) DEFAULT NULL COMMENT '���ιҺ�ҽ��id',
  `RegistId` bigint(20) NOT NULL COMMENT '���ιҺż���id',
  `SettleID` bigint(20) NOT NULL COMMENT '�������id',
  `IsBook` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '������Ҫ��',
  `RegisterTime` datetime DEFAULT NULL COMMENT '�Һ�ʱ��',
  `RegisterID` bigint(20) NOT NULL COMMENT '�Һ�ԱID',
  `VisitState` bigint(20) DEFAULT NULL COMMENT '���ο���״̬',
  PRIMARY KEY (`id`),
  KEY `FK_ҽ��id` (`UserId`),
  KEY `FK_�Һż���id` (`RegistId`),
  KEY `FK_�������id` (`SettleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�������ιҺ���Ϣ��';

#
# Data for table "register"
#

/*!40000 ALTER TABLE `register` DISABLE KEYS */;
/*!40000 ALTER TABLE `register` ENABLE KEYS */;

#
# Structure for table "registlevel"
#

DROP TABLE IF EXISTS `registlevel`;
CREATE TABLE `registlevel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `RegistCode` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '�ű����',
  `RegistName` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '�ű�����',
  `IsDefault` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '0 - ��Ĭ��\r\n            1 - Ĭ��',
  `Sequence` bigint(20) NOT NULL COMMENT '��ʾ˳���',
  `RegistFee` decimal(8,2) DEFAULT NULL COMMENT '�Һŷ�',
  `RegistQuota` bigint(20) DEFAULT NULL COMMENT '�Һ��޶�',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ɾ�����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�Һż����';

#
# Data for table "registlevel"
#

/*!40000 ALTER TABLE `registlevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `registlevel` ENABLE KEYS */;

#
# Structure for table "registwork"
#

DROP TABLE IF EXISTS `registwork`;
CREATE TABLE `registwork` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `UserId` bigint(20) DEFAULT NULL COMMENT 'Ա��id',
  `StartTime` datetime DEFAULT NULL COMMENT '��ʼʱ��',
  `EndTime` datetime DEFAULT NULL COMMENT '����ʱ��',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ɾ�����',
  PRIMARY KEY (`id`),
  KEY `FK_Ա��id` (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�ҺŹ���ʱ���';

#
# Data for table "registwork"
#

/*!40000 ALTER TABLE `registwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `registwork` ENABLE KEYS */;

#
# Structure for table "rule"
#

DROP TABLE IF EXISTS `rule`;
CREATE TABLE `rule` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `UserId` bigint(20) NOT NULL COMMENT 'ҽ��id',
  `RuleName` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `Week` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '����',
  `DeptId` bigint(20) DEFAULT NULL COMMENT '����id',
  `DelMark` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'ɾ�����',
  PRIMARY KEY (`id`),
  KEY `FK_ҽ��id` (`UserId`),
  KEY `FK_����id` (`DeptId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�Ű�����';

#
# Data for table "rule"
#

/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;

#
# Structure for table "scheduling"
#

DROP TABLE IF EXISTS `scheduling`;
CREATE TABLE `scheduling` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `SchedDate` datetime NOT NULL COMMENT '�Ű�����',
  `DeptId` bigint(20) NOT NULL COMMENT '����id',
  `UserId` bigint(20) DEFAULT NULL COMMENT 'ҽ��id',
  `Noon` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '���',
  `RuleId` bigint(20) DEFAULT NULL COMMENT '�Ű����id',
  `RegistQuota` bigint(20) NOT NULL COMMENT '�Һ��޶�',
  `State` bigint(20) DEFAULT NULL COMMENT '1=��Ч  0=��Ч',
  PRIMARY KEY (`id`),
  KEY `FK_ҽ��id` (`UserId`),
  KEY `FK_����id` (`DeptId`),
  KEY `FK_����id` (`RuleId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�Ű��';

#
# Data for table "scheduling"
#

/*!40000 ALTER TABLE `scheduling` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduling` ENABLE KEYS */;

#
# Structure for table "settlecategory"
#

DROP TABLE IF EXISTS `settlecategory`;
CREATE TABLE `settlecategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `SettleCode` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '������',
  `SettleName` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '�������',
  `IsDefault` bigint(20) DEFAULT NULL COMMENT '�Ƿ�Ĭ��',
  `Sequence` bigint(20) NOT NULL COMMENT '��ʾ˳���',
  `DelMark` bigint(20) DEFAULT NULL COMMENT '1Ϊɾ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��������';

#
# Data for table "settlecategory"
#

/*!40000 ALTER TABLE `settlecategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `settlecategory` ENABLE KEYS */;

#
# Structure for table "sys_config"
#

DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '��������',
  `config_name` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '��������',
  `config_key` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '��������',
  `config_value` varchar(500) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������ֵ',
  `config_type` char(1) COLLATE utf8mb4_bin DEFAULT 'N' COMMENT 'ϵͳ���ã�Y�� N��',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�������ñ�';

#
# Data for table "sys_config"
#

INSERT INTO `sys_config` VALUES (1,'�����ҳ-Ĭ��Ƥ����ʽ����','sys.index.skinName','skin-blue','Y','admin','2023-07-01 16:01:20','',NULL,'��ɫ skin-blue����ɫ skin-green����ɫ skin-purple����ɫ skin-red����ɫ skin-yellow'),(2,'�û�����-�˺ų�ʼ����','sys.user.initPassword','123456','Y','admin','2023-07-01 16:01:20','',NULL,'��ʼ������ 123456'),(3,'�����ҳ-���������','sys.index.sideTheme','theme-dark','Y','admin','2023-07-01 16:01:20','',NULL,'��ɫ����theme-dark��ǳɫ����theme-light'),(4,'�˺�����-��֤�뿪��','sys.account.captchaEnabled','true','Y','admin','2023-07-01 16:01:20','',NULL,'�Ƿ�����֤�빦�ܣ�true������false�رգ�'),(5,'�˺�����-�Ƿ����û�ע�Ṧ��','sys.account.registerUser','false','Y','admin','2023-07-01 16:01:20','',NULL,'�Ƿ���ע���û����ܣ�true������false�رգ�'),(6,'�û���¼-�������б�','sys.login.blackIPList','','Y','admin','2023-07-01 16:01:20','',NULL,'���õ�¼IP���������ƣ����ƥ������;�ָ���֧��ƥ�䣨*ͨ�䡢���Σ�');

#
# Structure for table "sys_dept"
#

DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '������id',
  `ancestors` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '�漶�б�',
  `dept_name` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT '��������',
  `order_num` int(4) DEFAULT '0' COMMENT '��ʾ˳��',
  `leader` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '������',
  `phone` varchar(11) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��ϵ�绰',
  `email` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '����',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '����״̬��0���� 1ͣ�ã�',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT 'ɾ����־��0������� 2����ɾ����',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='���ű�';

#
# Data for table "sys_dept"
#

INSERT INTO `sys_dept` VALUES (100,0,'0','�����Ƽ�',0,'����','15888888888','ry@qq.com','0','0','admin','2023-07-01 16:01:19','',NULL),(101,100,'0,100','�����ܹ�˾',1,'����','15888888888','ry@qq.com','0','0','admin','2023-07-01 16:01:19','',NULL),(102,100,'0,100','��ɳ�ֹ�˾',2,'����','15888888888','ry@qq.com','0','0','admin','2023-07-01 16:01:19','',NULL),(103,101,'0,100,101','�з�����',1,'����','15888888888','ry@qq.com','0','0','admin','2023-07-01 16:01:19','',NULL),(104,101,'0,100,101','�г�����',2,'����','15888888888','ry@qq.com','0','0','admin','2023-07-01 16:01:19','',NULL),(105,101,'0,100,101','���Բ���',3,'����','15888888888','ry@qq.com','0','0','admin','2023-07-01 16:01:19','',NULL),(106,101,'0,100,101','������',4,'����','15888888888','ry@qq.com','0','0','admin','2023-07-01 16:01:19','',NULL),(107,101,'0,100,101','��ά����',5,'����','15888888888','ry@qq.com','0','0','admin','2023-07-01 16:01:19','',NULL),(108,102,'0,100,102','�г�����',1,'����','15888888888','ry@qq.com','0','0','admin','2023-07-01 16:01:19','',NULL),(109,102,'0,100,102','������',2,'����','15888888888','ry@qq.com','0','0','admin','2023-07-01 16:01:19','',NULL);

#
# Structure for table "sys_dict_data"
#

DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '�ֵ����',
  `dict_sort` int(4) DEFAULT '0' COMMENT '�ֵ�����',
  `dict_label` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '�ֵ��ǩ',
  `dict_value` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '�ֵ��ֵ',
  `dict_type` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '�ֵ�����',
  `css_class` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��ʽ���ԣ�������ʽ��չ��',
  `list_class` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��������ʽ',
  `is_default` char(1) COLLATE utf8mb4_bin DEFAULT 'N' COMMENT '�Ƿ�Ĭ�ϣ�Y�� N��',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '״̬��0���� 1ͣ�ã�',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�ֵ����ݱ�';

#
# Data for table "sys_dict_data"
#

INSERT INTO `sys_dict_data` VALUES (1,1,'��','0','sys_user_sex','','','Y','0','admin','2023-07-01 16:01:20','',NULL,'�Ա���'),(2,2,'Ů','1','sys_user_sex','','','N','0','admin','2023-07-01 16:01:20','',NULL,'�Ա�Ů'),(3,3,'δ֪','2','sys_user_sex','','','N','0','admin','2023-07-01 16:01:20','',NULL,'�Ա�δ֪'),(4,1,'��ʾ','0','sys_show_hide','','primary','Y','0','admin','2023-07-01 16:01:20','',NULL,'��ʾ�˵�'),(5,2,'����','1','sys_show_hide','','danger','N','0','admin','2023-07-01 16:01:20','',NULL,'���ز˵�'),(6,1,'����','0','sys_normal_disable','','primary','Y','0','admin','2023-07-01 16:01:20','',NULL,'����״̬'),(7,2,'ͣ��','1','sys_normal_disable','','danger','N','0','admin','2023-07-01 16:01:20','',NULL,'ͣ��״̬'),(8,1,'����','0','sys_job_status','','primary','Y','0','admin','2023-07-01 16:01:20','',NULL,'����״̬'),(9,2,'��ͣ','1','sys_job_status','','danger','N','0','admin','2023-07-01 16:01:20','',NULL,'ͣ��״̬'),(10,1,'Ĭ��','DEFAULT','sys_job_group','','','Y','0','admin','2023-07-01 16:01:20','',NULL,'Ĭ�Ϸ���'),(11,2,'ϵͳ','SYSTEM','sys_job_group','','','N','0','admin','2023-07-01 16:01:20','',NULL,'ϵͳ����'),(12,1,'��','Y','sys_yes_no','','primary','Y','0','admin','2023-07-01 16:01:20','',NULL,'ϵͳĬ����'),(13,2,'��','N','sys_yes_no','','danger','N','0','admin','2023-07-01 16:01:20','',NULL,'ϵͳĬ�Ϸ�'),(14,1,'֪ͨ','1','sys_notice_type','','warning','Y','0','admin','2023-07-01 16:01:20','',NULL,'֪ͨ'),(15,2,'����','2','sys_notice_type','','success','N','0','admin','2023-07-01 16:01:20','',NULL,'����'),(16,1,'����','0','sys_notice_status','','primary','Y','0','admin','2023-07-01 16:01:20','',NULL,'����״̬'),(17,2,'�ر�','1','sys_notice_status','','danger','N','0','admin','2023-07-01 16:01:20','',NULL,'�ر�״̬'),(18,99,'����','0','sys_oper_type','','info','N','0','admin','2023-07-01 16:01:20','',NULL,'��������'),(19,1,'����','1','sys_oper_type','','info','N','0','admin','2023-07-01 16:01:20','',NULL,'��������'),(20,2,'�޸�','2','sys_oper_type','','info','N','0','admin','2023-07-01 16:01:20','',NULL,'�޸Ĳ���'),(21,3,'ɾ��','3','sys_oper_type','','danger','N','0','admin','2023-07-01 16:01:20','',NULL,'ɾ������'),(22,4,'��Ȩ','4','sys_oper_type','','primary','N','0','admin','2023-07-01 16:01:20','',NULL,'��Ȩ����'),(23,5,'����','5','sys_oper_type','','warning','N','0','admin','2023-07-01 16:01:20','',NULL,'��������'),(24,6,'����','6','sys_oper_type','','warning','N','0','admin','2023-07-01 16:01:20','',NULL,'�������'),(25,7,'ǿ��','7','sys_oper_type','','danger','N','0','admin','2023-07-01 16:01:20','',NULL,'ǿ�˲���'),(26,8,'���ɴ���','8','sys_oper_type','','warning','N','0','admin','2023-07-01 16:01:20','',NULL,'���ɲ���'),(27,9,'�������','9','sys_oper_type','','danger','N','0','admin','2023-07-01 16:01:20','',NULL,'��ղ���'),(28,1,'�ɹ�','0','sys_common_status','','primary','N','0','admin','2023-07-01 16:01:20','',NULL,'����״̬'),(29,2,'ʧ��','1','sys_common_status','','danger','N','0','admin','2023-07-01 16:01:20','',NULL,'ͣ��״̬');

#
# Structure for table "sys_dict_type"
#

DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '�ֵ�����',
  `dict_name` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '�ֵ�����',
  `dict_type` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '�ֵ�����',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '״̬��0���� 1ͣ�ã�',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�ֵ����ͱ�';

#
# Data for table "sys_dict_type"
#

INSERT INTO `sys_dict_type` VALUES (1,'�û��Ա�','sys_user_sex','0','admin','2023-07-01 16:01:20','',NULL,'�û��Ա��б�'),(2,'�˵�״̬','sys_show_hide','0','admin','2023-07-01 16:01:20','',NULL,'�˵�״̬�б�'),(3,'ϵͳ����','sys_normal_disable','0','admin','2023-07-01 16:01:20','',NULL,'ϵͳ�����б�'),(4,'����״̬','sys_job_status','0','admin','2023-07-01 16:01:20','',NULL,'����״̬�б�'),(5,'�������','sys_job_group','0','admin','2023-07-01 16:01:20','',NULL,'��������б�'),(6,'ϵͳ�Ƿ�','sys_yes_no','0','admin','2023-07-01 16:01:20','',NULL,'ϵͳ�Ƿ��б�'),(7,'֪ͨ����','sys_notice_type','0','admin','2023-07-01 16:01:20','',NULL,'֪ͨ�����б�'),(8,'֪ͨ״̬','sys_notice_status','0','admin','2023-07-01 16:01:20','',NULL,'֪ͨ״̬�б�'),(9,'��������','sys_oper_type','0','admin','2023-07-01 16:01:20','',NULL,'���������б�'),(10,'ϵͳ״̬','sys_common_status','0','admin','2023-07-01 16:01:20','',NULL,'��¼״̬�б�');

#
# Structure for table "sys_job"
#

DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `job_name` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '��������',
  `job_group` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '��������',
  `invoke_target` varchar(500) COLLATE utf8mb4_bin NOT NULL COMMENT '����Ŀ���ַ���',
  `cron_expression` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'cronִ�б��ʽ',
  `misfire_policy` varchar(20) COLLATE utf8mb4_bin DEFAULT '3' COMMENT '�ƻ�ִ�д�����ԣ�1����ִ�� 2ִ��һ�� 3����ִ�У�',
  `concurrent` char(1) COLLATE utf8mb4_bin DEFAULT '1' COMMENT '�Ƿ񲢷�ִ�У�0���� 1��ֹ��',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '״̬��0���� 1��ͣ��',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT '' COMMENT '��ע��Ϣ',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��ʱ������ȱ�';

#
# Data for table "sys_job"
#

INSERT INTO `sys_job` VALUES (1,'ϵͳĬ�ϣ��޲Σ�','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2023-07-01 16:01:20','',NULL,''),(2,'ϵͳĬ�ϣ��вΣ�','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2023-07-01 16:01:20','',NULL,''),(3,'ϵͳĬ�ϣ���Σ�','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2023-07-01 16:01:20','',NULL,'');

#
# Structure for table "sys_job_log"
#

DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '������־ID',
  `job_name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `job_group` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '��������',
  `invoke_target` varchar(500) COLLATE utf8mb4_bin NOT NULL COMMENT '����Ŀ���ַ���',
  `job_message` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��־��Ϣ',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT 'ִ��״̬��0���� 1ʧ�ܣ�',
  `exception_info` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '�쳣��Ϣ',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��ʱ���������־��';

#
# Data for table "sys_job_log"
#


#
# Structure for table "sys_logininfor"
#

DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `user_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '�û��˺�',
  `ipaddr` varchar(128) COLLATE utf8mb4_bin DEFAULT '' COMMENT '��¼IP��ַ',
  `login_location` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '��¼�ص�',
  `browser` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '���������',
  `os` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '����ϵͳ',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '��¼״̬��0�ɹ� 1ʧ�ܣ�',
  `msg` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '��ʾ��Ϣ',
  `login_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='ϵͳ���ʼ�¼';

#
# Data for table "sys_logininfor"
#


#
# Structure for table "sys_menu"
#

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '�˵�ID',
  `menu_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '�˵�����',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '���˵�ID',
  `order_num` int(4) DEFAULT '0' COMMENT '��ʾ˳��',
  `path` varchar(200) COLLATE utf8mb4_bin DEFAULT '' COMMENT '·�ɵ�ַ',
  `component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '���·��',
  `query` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '·�ɲ���',
  `is_frame` int(1) DEFAULT '1' COMMENT '�Ƿ�Ϊ������0�� 1��',
  `is_cache` int(1) DEFAULT '0' COMMENT '�Ƿ񻺴棨0���� 1�����棩',
  `menu_type` char(1) COLLATE utf8mb4_bin DEFAULT '' COMMENT '�˵����ͣ�MĿ¼ C�˵� F��ť��',
  `visible` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '�˵�״̬��0��ʾ 1���أ�',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '�˵�״̬��0���� 1ͣ�ã�',
  `perms` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Ȩ�ޱ�ʶ',
  `icon` varchar(100) COLLATE utf8mb4_bin DEFAULT '#' COMMENT '�˵�ͼ��',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT '' COMMENT '��ע',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�˵�Ȩ�ޱ�';

#
# Data for table "sys_menu"
#

INSERT INTO `sys_menu` VALUES (1,'ϵͳ����',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2023-07-01 16:01:19','',NULL,'ϵͳ����Ŀ¼'),(2,'ϵͳ���',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2023-07-01 16:01:19','',NULL,'ϵͳ���Ŀ¼'),(3,'ϵͳ����',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2023-07-01 16:01:19','',NULL,'ϵͳ����Ŀ¼'),(4,'��������',0,4,'http://ruoyi.vip',NULL,'',0,0,'M','0','0','','guide','admin','2023-07-01 16:01:19','',NULL,'����������ַ'),(100,'�û�����',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2023-07-01 16:01:19','',NULL,'�û�����˵�'),(101,'��ɫ����',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2023-07-01 16:01:19','',NULL,'��ɫ����˵�'),(102,'�˵�����',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2023-07-01 16:01:19','',NULL,'�˵�����˵�'),(103,'���Ź���',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2023-07-01 16:01:19','',NULL,'���Ź���˵�'),(104,'��λ����',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2023-07-01 16:01:19','',NULL,'��λ����˵�'),(105,'�ֵ����',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2023-07-01 16:01:19','',NULL,'�ֵ����˵�'),(106,'��������',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2023-07-01 16:01:19','',NULL,'�������ò˵�'),(107,'֪ͨ����',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2023-07-01 16:01:19','',NULL,'֪ͨ����˵�'),(108,'��־����',1,9,'log','','',1,0,'M','0','0','','log','admin','2023-07-01 16:01:19','',NULL,'��־����˵�'),(109,'�����û�',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2023-07-01 16:01:19','',NULL,'�����û��˵�'),(110,'��ʱ����',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2023-07-01 16:01:19','',NULL,'��ʱ����˵�'),(111,'���ݼ��',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2023-07-01 16:01:19','',NULL,'���ݼ�ز˵�'),(112,'������',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2023-07-01 16:01:19','',NULL,'�����ز˵�'),(113,'������',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2023-07-01 16:01:19','',NULL,'�����ز˵�'),(114,'�����б�',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2023-07-01 16:01:19','',NULL,'�����б�˵�'),(115,'������',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2023-07-01 16:01:19','',NULL,'�������˵�'),(116,'��������',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2023-07-01 16:01:19','',NULL,'�������ɲ˵�'),(117,'ϵͳ�ӿ�',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2023-07-01 16:01:19','',NULL,'ϵͳ�ӿڲ˵�'),(500,'������־',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2023-07-01 16:01:19','',NULL,'������־�˵�'),(501,'��¼��־',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2023-07-01 16:01:19','',NULL,'��¼��־�˵�'),(1000,'�û���ѯ',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2023-07-01 16:01:19','',NULL,''),(1001,'�û�����',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2023-07-01 16:01:19','',NULL,''),(1002,'�û��޸�',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2023-07-01 16:01:19','',NULL,''),(1003,'�û�ɾ��',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2023-07-01 16:01:19','',NULL,''),(1004,'�û�����',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2023-07-01 16:01:19','',NULL,''),(1005,'�û�����',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2023-07-01 16:01:19','',NULL,''),(1006,'��������',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2023-07-01 16:01:19','',NULL,''),(1007,'��ɫ��ѯ',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2023-07-01 16:01:19','',NULL,''),(1008,'��ɫ����',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2023-07-01 16:01:19','',NULL,''),(1009,'��ɫ�޸�',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2023-07-01 16:01:19','',NULL,''),(1010,'��ɫɾ��',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2023-07-01 16:01:19','',NULL,''),(1011,'��ɫ����',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2023-07-01 16:01:19','',NULL,''),(1012,'�˵���ѯ',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2023-07-01 16:01:19','',NULL,''),(1013,'�˵�����',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2023-07-01 16:01:19','',NULL,''),(1014,'�˵��޸�',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2023-07-01 16:01:19','',NULL,''),(1015,'�˵�ɾ��',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2023-07-01 16:01:19','',NULL,''),(1016,'���Ų�ѯ',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2023-07-01 16:01:19','',NULL,''),(1017,'��������',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2023-07-01 16:01:19','',NULL,''),(1018,'�����޸�',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2023-07-01 16:01:19','',NULL,''),(1019,'����ɾ��',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2023-07-01 16:01:19','',NULL,''),(1020,'��λ��ѯ',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2023-07-01 16:01:19','',NULL,''),(1021,'��λ����',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2023-07-01 16:01:19','',NULL,''),(1022,'��λ�޸�',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2023-07-01 16:01:19','',NULL,''),(1023,'��λɾ��',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2023-07-01 16:01:19','',NULL,''),(1024,'��λ����',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2023-07-01 16:01:19','',NULL,''),(1025,'�ֵ��ѯ',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2023-07-01 16:01:19','',NULL,''),(1026,'�ֵ�����',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2023-07-01 16:01:19','',NULL,''),(1027,'�ֵ��޸�',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2023-07-01 16:01:19','',NULL,''),(1028,'�ֵ�ɾ��',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2023-07-01 16:01:19','',NULL,''),(1029,'�ֵ䵼��',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2023-07-01 16:01:19','',NULL,''),(1030,'������ѯ',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2023-07-01 16:01:19','',NULL,''),(1031,'��������',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2023-07-01 16:01:19','',NULL,''),(1032,'�����޸�',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2023-07-01 16:01:19','',NULL,''),(1033,'����ɾ��',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2023-07-01 16:01:19','',NULL,''),(1034,'��������',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2023-07-01 16:01:19','',NULL,''),(1035,'�����ѯ',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2023-07-01 16:01:19','',NULL,''),(1036,'��������',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2023-07-01 16:01:20','',NULL,''),(1037,'�����޸�',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2023-07-01 16:01:20','',NULL,''),(1038,'����ɾ��',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2023-07-01 16:01:20','',NULL,''),(1039,'������ѯ',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2023-07-01 16:01:20','',NULL,''),(1040,'����ɾ��',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2023-07-01 16:01:20','',NULL,''),(1041,'��־����',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2023-07-01 16:01:20','',NULL,''),(1042,'��¼��ѯ',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2023-07-01 16:01:20','',NULL,''),(1043,'��¼ɾ��',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2023-07-01 16:01:20','',NULL,''),(1044,'��־����',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2023-07-01 16:01:20','',NULL,''),(1045,'�˻�����',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2023-07-01 16:01:20','',NULL,''),(1046,'���߲�ѯ',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2023-07-01 16:01:20','',NULL,''),(1047,'����ǿ��',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2023-07-01 16:01:20','',NULL,''),(1048,'����ǿ��',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2023-07-01 16:01:20','',NULL,''),(1049,'�����ѯ',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2023-07-01 16:01:20','',NULL,''),(1050,'��������',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2023-07-01 16:01:20','',NULL,''),(1051,'�����޸�',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2023-07-01 16:01:20','',NULL,''),(1052,'����ɾ��',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2023-07-01 16:01:20','',NULL,''),(1053,'״̬�޸�',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2023-07-01 16:01:20','',NULL,''),(1054,'���񵼳�',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2023-07-01 16:01:20','',NULL,''),(1055,'���ɲ�ѯ',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2023-07-01 16:01:20','',NULL,''),(1056,'�����޸�',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2023-07-01 16:01:20','',NULL,''),(1057,'����ɾ��',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2023-07-01 16:01:20','',NULL,''),(1058,'�������',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2023-07-01 16:01:20','',NULL,''),(1059,'Ԥ������',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2023-07-01 16:01:20','',NULL,''),(1060,'���ɴ���',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2023-07-01 16:01:20','',NULL,'');

#
# Structure for table "sys_notice"
#

DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `notice_title` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '�������',
  `notice_type` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '�������ͣ�1֪ͨ 2���棩',
  `notice_content` longblob COMMENT '��������',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '����״̬��0���� 1�رգ�',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='֪ͨ�����';

#
# Data for table "sys_notice"
#

INSERT INTO `sys_notice` VALUES (1,'��ܰ���ѣ�2018-07-01 �����°汾������','2',X'E696B0E78988E69CACE58685E5AEB9','0','admin','2023-07-01 16:01:20','',NULL,'����Ա'),(2,'ά��֪ͨ��2018-07-01 ����ϵͳ�賿ά��','1',X'E7BBB4E68AA4E58685E5AEB9','0','admin','2023-07-01 16:01:20','',NULL,'����Ա');

#
# Structure for table "sys_oper_log"
#

DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '��־����',
  `title` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'ģ�����',
  `business_type` int(2) DEFAULT '0' COMMENT 'ҵ�����ͣ�0���� 1���� 2�޸� 3ɾ����',
  `method` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '��������',
  `request_method` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '����ʽ',
  `operator_type` int(1) DEFAULT '0' COMMENT '�������0���� 1��̨�û� 2�ֻ����û���',
  `oper_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������Ա',
  `dept_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '��������',
  `oper_url` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '����URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������ַ',
  `oper_location` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '�����ص�',
  `oper_param` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '�������',
  `json_result` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '���ز���',
  `status` int(1) DEFAULT '0' COMMENT '����״̬��0���� 1�쳣��',
  `error_msg` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������Ϣ',
  `oper_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='������־��¼';

#
# Data for table "sys_oper_log"
#


#
# Structure for table "sys_post"
#

DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '��λID',
  `post_code` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '��λ����',
  `post_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '��λ����',
  `post_sort` int(4) NOT NULL COMMENT '��ʾ˳��',
  `status` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '״̬��0���� 1ͣ�ã�',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��λ��Ϣ��';

#
# Data for table "sys_post"
#

INSERT INTO `sys_post` VALUES (1,'ceo','���³�',1,'0','admin','2023-07-01 16:01:19','',NULL,''),(2,'se','��Ŀ����',2,'0','admin','2023-07-01 16:01:19','',NULL,''),(3,'hr','������Դ',3,'0','admin','2023-07-01 16:01:19','',NULL,''),(4,'user','��ͨԱ��',4,'0','admin','2023-07-01 16:01:19','',NULL,'');

#
# Structure for table "sys_role"
#

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '��ɫID',
  `role_name` varchar(30) COLLATE utf8mb4_bin NOT NULL COMMENT '��ɫ����',
  `role_key` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '��ɫȨ���ַ���',
  `role_sort` int(4) NOT NULL COMMENT '��ʾ˳��',
  `data_scope` char(1) COLLATE utf8mb4_bin DEFAULT '1' COMMENT '���ݷ�Χ��1��ȫ������Ȩ�� 2���Զ�����Ȩ�� 3������������Ȩ�� 4�������ż���������Ȩ�ޣ�',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '�˵���ѡ�����Ƿ������ʾ',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '������ѡ�����Ƿ������ʾ',
  `status` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '��ɫ״̬��0���� 1ͣ�ã�',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT 'ɾ����־��0������� 2����ɾ����',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��ɫ��Ϣ��';

#
# Data for table "sys_role"
#

INSERT INTO `sys_role` VALUES (1,'��������Ա','admin',1,'1',1,1,'0','0','admin','2023-07-01 16:01:19','',NULL,'��������Ա'),(2,'��ͨ��ɫ','common',2,'2',1,1,'0','0','admin','2023-07-01 16:01:19','',NULL,'��ͨ��ɫ');

#
# Structure for table "sys_role_dept"
#

DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '��ɫID',
  `dept_id` bigint(20) NOT NULL COMMENT '����ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��ɫ�Ͳ��Ź�����';

#
# Data for table "sys_role_dept"
#

INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);

#
# Structure for table "sys_role_menu"
#

DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '��ɫID',
  `menu_id` bigint(20) NOT NULL COMMENT '�˵�ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='��ɫ�Ͳ˵�������';

#
# Data for table "sys_role_menu"
#

INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060);

#
# Structure for table "sys_user"
#

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '�û�ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '����ID',
  `user_name` varchar(30) COLLATE utf8mb4_bin NOT NULL COMMENT '�û��˺�',
  `nick_name` varchar(30) COLLATE utf8mb4_bin NOT NULL COMMENT '�û��ǳ�',
  `user_type` varchar(2) COLLATE utf8mb4_bin DEFAULT '00' COMMENT '�û����ͣ�00ϵͳ�û���',
  `email` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '�û�����',
  `phonenumber` varchar(11) COLLATE utf8mb4_bin DEFAULT '' COMMENT '�ֻ�����',
  `sex` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '�û��Ա�0�� 1Ů 2δ֪��',
  `avatar` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'ͷ���ַ',
  `password` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '����',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '�ʺ�״̬��0���� 1ͣ�ã�',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT 'ɾ����־��0������� 2����ɾ����',
  `login_ip` varchar(128) COLLATE utf8mb4_bin DEFAULT '' COMMENT '����¼IP',
  `login_date` datetime DEFAULT NULL COMMENT '����¼ʱ��',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '������',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�û���Ϣ��';

#
# Data for table "sys_user"
#

INSERT INTO `sys_user` VALUES (1,103,'admin','����','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-07-01 16:01:19','admin','2023-07-01 16:01:19','',NULL,'����Ա'),(2,105,'ry','����','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-07-01 16:01:19','admin','2023-07-01 16:01:19','',NULL,'����Ա');

#
# Structure for table "sys_user_post"
#

DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '�û�ID',
  `post_id` bigint(20) NOT NULL COMMENT '��λID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�û����λ������';

#
# Data for table "sys_user_post"
#

INSERT INTO `sys_user_post` VALUES (1,1),(2,2);

#
# Structure for table "sys_user_role"
#

DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '�û�ID',
  `role_id` bigint(20) NOT NULL COMMENT '��ɫID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�û��ͽ�ɫ������';

#
# Data for table "sys_user_role"
#

INSERT INTO `sys_user_role` VALUES (1,1),(2,2);

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `UserName` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '��¼��',
  `Password` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '����',
  `RealName` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '��ʵ����',
  `UserTypeID` bigint(20) DEFAULT NULL COMMENT '1 - �Һ���Ա\r\n            2 - ����ҽ��\r\n            3 - ҽ��ҽ��\r\n            4 - ҩ����Ա\r\n            5 - ������Ա\r\n            6 - ������Ա\r\n            ',
  `DocTitleID` bigint(20) DEFAULT NULL COMMENT 'ҽ��ְ��',
  `IsScheduling` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�Ƿ��Ű�',
  `DeptId` bigint(20) NOT NULL COMMENT '���ڿ���ID',
  `RegistId` bigint(20) DEFAULT NULL COMMENT '�Һż���ID',
  `DelMark` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ɾ�����',
  PRIMARY KEY (`id`),
  KEY `FK_����id` (`DeptId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�û���(ҽԺԱ����)';

#
# Data for table "user"
#

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

#
# Structure for table "�����������"
#

DROP TABLE IF EXISTS `�����������`;
CREATE TABLE `�����������` (
  `id` bigint(20) DEFAULT NULL COMMENT 'id',
  `MedicalId` bigint(20) DEFAULT NULL COMMENT '����id',
  `DrugId` bigint(20) DEFAULT NULL COMMENT '����id',
  `state` bigint(20) DEFAULT NULL COMMENT '״̬',
  KEY `FK_Reference_38` (`MedicalId`),
  KEY `FK_Reference_39` (`DrugId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='�����������';

#
# Data for table "�����������"
#

/*!40000 ALTER TABLE `�����������` DISABLE KEYS */;
/*!40000 ALTER TABLE `�����������` ENABLE KEYS */;
