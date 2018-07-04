/*
Navicat MySQL Data Transfer

Source Server         : ATOM
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : nplm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-06-06 20:40:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_info
-- ----------------------------
DROP TABLE IF EXISTS `auth_info`;
CREATE TABLE `auth_info` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_class` varchar(50) DEFAULT NULL,
  `auth_cn` varchar(50) DEFAULT NULL,
  `server_path` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bms_param
-- ----------------------------
DROP TABLE IF EXISTS `bms_param`;
CREATE TABLE `bms_param` (
  `param_name` varchar(32) NOT NULL,
  `param_value` varchar(60) DEFAULT NULL,
  `param_desc` varchar(100) DEFAULT NULL,
  `param_remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`param_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for menu_auth
-- ----------------------------
DROP TABLE IF EXISTS `menu_auth`;
CREATE TABLE `menu_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `auth_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for menu_tree
-- ----------------------------
DROP TABLE IF EXISTS `menu_tree`;
CREATE TABLE `menu_tree` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `menu_text` varchar(60) DEFAULT NULL,
  `icon_text` varchar(20) DEFAULT NULL,
  `node_type` int(11) DEFAULT NULL,
  `url_text` varchar(256) DEFAULT NULL,
  `order_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for org_info
-- ----------------------------
DROP TABLE IF EXISTS `org_info`;
CREATE TABLE `org_info` (
  `org_id` int(32) NOT NULL AUTO_INCREMENT,
  `parent_id` int(32) DEFAULT NULL,
  `org_code` varchar(30) NOT NULL,
  `org_name` varchar(100) NOT NULL,
  `org_addr` varchar(100) DEFAULT NULL,
  `org_manager` varchar(30) DEFAULT NULL,
  `org_telephone` varchar(20) DEFAULT NULL,
  `org_path` varchar(50) DEFAULT NULL,
  `editor` varchar(30) DEFAULT NULL,
  `approver` varchar(30) DEFAULT NULL,
  `approval_time` varchar(20) DEFAULT NULL,
  `last_edit_time` varchar(20) DEFAULT NULL,
  `edit_flag` varchar(1) DEFAULT NULL,
  `area_code` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`org_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_auth
-- ----------------------------
DROP TABLE IF EXISTS `role_auth`;
CREATE TABLE `role_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `auth_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  `role_desc` varchar(128) DEFAULT NULL,
  `role_creator` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_name` varchar(32) NOT NULL,
  `real_name` varchar(32) DEFAULT NULL,
  `pwd` varchar(32) DEFAULT NULL,
  `mobile_phone` varchar(20) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `register_time` varchar(19) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `org_path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--------------------------可怕表结构的分割线----------------------------------
drop index Index_account_info on account_info;
drop table if exists account_info;
/*==============================================================*/
/* Table: account_info                                          */
/*==============================================================*/
create table account_info
(
   receipt_loan_num     varchar(50) not null comment '借据编号',
   org_id               int comment '机构ID',
   up_state             varchar(2) comment '上报状态',
   update_date          varchar(20) comment '更新时间',
   file1_field1         varchar(32) comment '客户码',
   file1_field2         varchar(60) comment '客户名称',
   file1_field3         varchar(20) comment '客户类型',
   file1_field4         varchar(32) comment '企业规模',
   file1_field5         text comment '住址（个人）',
   file1_field6         varchar(32) comment '客户经理',
   file1_field7         varchar(32) comment '客户经理姓名',
   file1_field8         varchar(20) comment '起贷时间',
   file1_field9         varchar(20) comment '止贷时间',
   file1_field10        varchar(20) comment '原止贷时间',
   file1_field11        varchar(32) comment '贷款期限',
   file1_field12        varchar(20) comment '期限类型',
   file1_field13        varchar(20) comment '五级分类',
   file1_field14        varchar(19) comment '借据金额',
   file1_field15        varchar(19) comment '借据余额',
   file1_field16        text comment '借款用途描述',
   file1_field17        varchar(20) comment '贷款科目',
   file1_field18        varchar(20) comment '担保方式',
   file1_field19        varchar(15) comment '业务品种',
   file1_field20        varchar(20) comment '业务品种细分',
   file1_field21        varchar(20) comment '贷款投向',
   file1_field22        varchar(50) comment '贷款投向名称',
   file1_field23        varchar(50) comment '贷款投向细分',
   file1_field24        varchar(50) comment '个人经营细分',
   file1_field25        varchar(20) comment '涉农情况',
   file1_field26        text comment '涉农用途',
   file1_field27        varchar(2) comment '农林牧渔业贷款分类',
   file1_field28        varchar(20) comment '特色贷款分类',
   file1_field29        varchar(20) comment '特色贷款分类2',
   file1_field30        varchar(15) comment '行业分类',
   file1_field31        varchar(50) comment '行业名称',
   file1_field32        varchar(15) comment '三惠卡绑定标识',
   file1_field33        varchar(15) comment '银团标志',
   file1_field34        varchar(15) comment '再贷款标识',
   file1_field35        varchar(15) comment '贷款台帐状态',
   file1_field36        varchar(10) comment '是否工商登记',
   file1_field37        varchar(50) comment '登记注册号',
   file1_field38        varchar(10) comment '登记注册类型',
   file1_field39        varchar(10) comment '利率执行方式',
   file1_field40        varchar(10) comment '是否计复利',
   file1_field41        varchar(10) comment '利率调整方式',
   file1_field42        varchar(10) comment '是否自动调整利率',
   file1_field43        varchar(10) comment '贷款利率（年）(%)',
   file1_field44        varchar(10) comment '利率浮动比(%)',
   file1_field45        varchar(10) comment '计息方式',
   file1_field46        varchar(10) comment '贴息状态',
   file1_field47        varchar(20) comment '起息日期',
   file1_field48        varchar(19) comment '欠息累计',
   file1_field49        varchar(19) comment '应收利息累计',
   file1_field50        varchar(19) comment '实收利息累计',
   file1_field51        varchar(19) comment '表内欠息',
   file1_field52        varchar(19) comment '表外欠息',
   file1_field53        varchar(19) comment '登记簿欠息',
   file1_field54        varchar(10) comment '利息逾期天数',
   file1_field55        varchar(20) comment '最早利息逾期日期',
   file1_field56        varchar(50) comment '信用等级模型',
   file1_field57        varchar(10) comment '信用等级',
   file1_field58        varchar(20) comment '评级有效日期',
   file1_field59        varchar(20) comment '合同编号',
   file1_field60        varchar(2) comment '贷款合同类型',
   file1_field61        varchar(20) comment '合同起始日期',
   file1_field62        varchar(20) comment '合同终止日期',
   file1_field63        varchar(19) comment '合同金额',
   file1_field64        varchar(19) comment '合同可用余额',
   file1_field65        varchar(32) comment '合同贷款期限',
   file1_field66        varchar(20) comment '交易日期',
   file1_field67        varchar(20) comment '结清日期',
   file1_field68        varchar(20) comment '销户日期',
   file1_field69        varchar(15) comment '上次五级分类',
   file1_field70        varchar(20) comment '上次清分日期',
   file1_field71        varchar(20) comment '五级分类日期',
   file1_field72        varchar(15) comment '四级分类',
   file1_field73        varchar(19) comment '正常贷款余额（四级）',
   file1_field74        varchar(19) comment '逾期贷款余额（四级）',
   file1_field75        varchar(19) comment '呆滞贷款余额（四级）',
   file1_field76        varchar(19) comment '呆帐贷款余额（四级）',
   file1_field77        varchar(50) comment '集团名称',
   file1_field78        varchar(50) comment '集团编号',
   file1_field79        varchar(20) comment '集团成员类型',
   file1_field80        varchar(20) comment '经营状况',
   file1_field81        varchar(20) comment '控股类型',
   file1_field82        varchar(20) comment '龙头企业标志',
   file1_field83        varchar(20) comment '农业产业化龙头企业贷款',
   file1_field84        varchar(50) comment '创业贷款推荐单位',
   file1_field85        varchar(50) comment '创业贷款发放对象',
   file1_field86        varchar(50) comment '创业贷款投向',
   file1_field87        varchar(20) comment '创业贷款推荐单位行政级别',
   file1_field88        varchar(50) comment '失业人员小额担保贷款推荐单位',
   file1_field89        varchar(50) comment '失业人员小额担保贷款发放对象',
   file1_field90        varchar(50) comment '失业人员小额担保贷款投向',
   file1_field91        varchar(32) comment '法定代表人姓名',
   file1_field92        varchar(50) comment '微型企业培育贷款推荐单位',
   file1_field93        varchar(20) comment '房地产贷款投向分类',
   file1_field94        varchar(20) comment '房地产贷款投向细分',
   file1_field95        varchar(20) comment '房地产贷款投向分类其中',
   file1_field96        varchar(20) comment '按法律性质分类',
   file1_field97        varchar(20) comment '按隶属关系分类',
   file1_field98        varchar(10) comment '按类型分类',
   file1_field99        varchar(10) comment '按实际投向分类',
   file1_field100       varchar(10) comment '按偿债资金来源分类',
   file1_field101       varchar(10) comment '按贷款方式分类',
   file1_field102       varchar(10) comment '保障安居工程贷款投向分类',
   file1_field103       varchar(10) comment '保障安居工程贷款投向分类其中',
   file1_field104       varchar(10) comment '劳动密集型小企业贷款贷款形式',
   file1_field105       varchar(10) comment '对公业务品种(瑞丽)',
   file1_field106       varchar(10) comment '对私业务品种(瑞丽)',
   file1_field107       varchar(10) comment '贷款发放渠道',
   file1_field108       varchar(10) comment '行业资质评定等级',
   file1_field109       text comment '注册地址',
   file1_field110       varchar(10) comment '联保类型',
   file1_field111       varchar(10) comment '贷款形式',
   file1_field112       varchar(50) comment '最终审批机构',
   file1_field113       varchar(2) comment '性别',
   file1_field114       varchar(10) comment '民族',
   file1_field115       varchar(32) comment '证件号码',
   file1_field116       varchar(32) comment '地区编码',
   file1_field117       varchar(50) comment '贷款账号',
   file1_field118       varchar(50) comment '结算帐号',
   file1_field119       varchar(20) comment '手机号码',
   file1_field120       varchar(20) comment '短信通知号码',
   file1_field121       varchar(20) comment '联系电话（企业）',
   file1_field122       varchar(20) comment '住宅电话',
   file1_field123       varchar(20) comment '单位电话',
   file1_field124       varchar(4) comment '家庭拥有住房套数(个人住房)',
   file1_field125       varchar(10) comment '偿债收入比(个人住房)',
   file1_field126       varchar(10) comment '房屋面积(个人住房)',
   file1_field127       varchar(10) comment '贷款价值比(个人住房、企业房地产)',
   file1_field128       varchar(10) comment '展期次数',
   file1_field129       text comment '备注信息（统计专用）',
   file1_field130       varchar(10) comment '行业政策类型',
   file1_field131       varchar(19) comment '购房总价',
   primary key (receipt_loan_num)
);
alter table account_info comment '台账信息表(附件一account_info)';
/*==============================================================*/
/* Index: Index_account_info                                    */
/*==============================================================*/
create index Index_account_info on account_info
(
   receipt_loan_num,
   org_id,
   up_state,
   update_date,
   file1_field13,
   file1_field15,
   file1_field50,
   file1_field2
);
alter table account_info add constraint FK_Reference_1 foreign key (org_id)
      references org_info (org_id) on delete restrict on update restrict;


drop index Index_account_dispose on account_dispose;
drop table if exists account_dispose;
/*==============================================================*/
/* Table: account_dispose                                       */
/*==============================================================*/
create table account_dispose
(
   receipt_loan_num     varchar(50) not null comment '借据编号',
   file2_field1         varchar(50) comment '牵头联社',
   file2_field2         varchar(50) comment '实际发放机构',
   file2_field3         varchar(50) comment '关联贷款主体',
   file2_field4         varchar(50) comment '借款人实际控制人',
   file2_field5         varchar(20) comment '借款人实际控制人身份证号码',
   file2_field6         varchar(20) comment '担保人实际控制人',
   file2_field7         varchar(20) comment '担保人实际控制人身份证号码',
   file2_field8         text comment '表内外贷款',
   file2_field9         varchar(20) comment '社团标志',
   file2_field10        varchar(10) comment '进入（调入）不良的时间',
   file2_field11        varchar(9) comment '截止本期债务余额(本金）',
   file2_field12        varchar(9) comment '本年计划清收金额',
   file2_field13        varchar(4) comment '本期清收完成进度 %',
   file2_field14        text comment '抵、质押情况',
   file2_field15        text comment '借款人现状',
   file2_field16        text comment '担保人现状',
   file2_field17        text comment '抵、质押物现状',
   file2_field18        text comment '其他事项',
   file2_field19        varchar(20) comment '挂钩领导',
   file2_field20        varchar(20) comment '清收负责人',
   file2_field21        varchar(20) comment '清收人员',
   file2_field22        varchar(20) comment '诉讼情况',
   file2_field23        varchar(20) comment '执行情况',
   file2_field24        text comment '对其他财产线索的查封、冻结情况',
   file2_field25        text comment '清收处置措施、方案',
   file2_field26        varchar(10) comment '计划清收完成时限',
   file2_field27        varchar(9) comment '预计损失',
   file2_field28        text comment '上期清收处置工作完成情况及成效',
   file2_field29        text comment '本期计划清收处置工作开展情况',
   file2_field30        text comment '方案推进过程中发现的困难和问题',
   file2_field31        varchar(10) comment '核销时间（置换时间、收益权转让时间）',
   file2_field32        varchar(9) comment '核销金额（置换、收益权金额）',
   file2_field33        text comment '核销条款（置换批复、转让协议号）',
   file2_field34        varchar(9) comment '现欠余额',
   file2_field35        varchar(50) comment '贷款发放时最终审批机构',
   file2_field36        varchar(50) comment '核销最终审批机构',
   file2_field37        varchar(9) comment '核销后累计清收金额',
   file2_field38        text comment '清收方式',
   primary key (receipt_loan_num)
);
alter table account_dispose comment '台账清收处置(附件二account_dispose)';
/*==============================================================*/
/* Index: Index_account_dispose                                 */
/*==============================================================*/
create index Index_account_dispose on account_dispose
(
   receipt_loan_num
);
alter table account_dispose add constraint FK_Reference_3 foreign key (receipt_loan_num)
      references account_info (receipt_loan_num) on delete restrict on update restrict;


drop index Index_account_dispose_details on account_dispose_details;
drop table if exists account_dispose_details;
/*==============================================================*/
/* Table: account_dispose_details                               */
/*==============================================================*/
create table account_dispose_details
(
   receipt_loan_num     varchar(50) not null comment '借据编号',
   file3_field1         varchar(15) comment '现金清收本金合计',
   file3_field2         varchar(15) comment '正常现金清收',
   file3_field3         varchar(15) comment '诉讼清收',
   file3_field4         text comment '协商处置抵押物',
   file3_field5         varchar(20) comment '分期偿还',
   file3_field6         text comment '引入社会投资人项目并购或收购抵押物',
   file3_field7         text comment '现金清收本金其他',
   file3_field8         varchar(20) comment '现金清收利息',
   file3_field9         varchar(20) comment '资产转让（卖断）',
   file3_field10        varchar(20) comment '收到价款',
   file3_field11        varchar(20) comment '转让损失核销金额',
   file3_field12        varchar(20) comment '收本挂息',
   file3_field13        varchar(20) comment '以物抵债',
   file3_field14        varchar(20) comment '呆账核销',
   file3_field15        varchar(20) comment '风险救助金置换',
   file3_field16        varchar(20) comment '借新还旧',
   file3_field17        varchar(20) comment '债务转移',
   file3_field18        varchar(20) comment '调整担保',
   file3_field19        varchar(20) comment '资产转让（收益权）',
   file3_field20        varchar(20) comment '清收欠息后调入正常类',
   file3_field21        text comment '资产转让其他',
   file3_field22        varchar(9) comment '清收本息合计',
   primary key (receipt_loan_num)
);
alter table account_dispose_details comment '本期清收处置情况（附件三account_dispose_details）';
/*==============================================================*/
/* Index: Index_account_dispose_details                         */
/*==============================================================*/
create index Index_account_dispose_details on account_dispose_details
(
   receipt_loan_num
);
alter table account_dispose_details add constraint FK_Reference_4 foreign key (receipt_loan_num)
      references account_info (receipt_loan_num) on delete restrict on update restrict;


drop index Index_responsibility_info on responsibility_info;
drop table if exists responsibility_info;
/*==============================================================*/
/* Table: responsibility_info                                   */
/*==============================================================*/
create table responsibility_info
(
   receipt_loan_num     varchar(50) not null comment '借据编号',
   file4_field1         varchar(50) comment '主办社',
   file4_field2         text comment '不良信贷资产（损失）形成的主客观原因',
   file4_field3         varchar(10) comment '责任认定类型',
   file4_field4         varchar(10) comment '县级行社认定为有责或无责',
   file4_field5         varchar(20) comment '责任认定日期',
   file4_field6         varchar(32) comment '基社调查人姓名',
   file4_field7         varchar(80) comment '基社调查人岗位描述',
   file4_field8         text comment '基社调查人责任事项',
   file4_field9         text comment '基社调查人违规依据',
   file4_field10        varchar(20) comment '基社调查人责任人级别',
   file4_field11        varchar(10) comment '基社调查人贷时岗位角色',
   file4_field12        text comment '基社调查人贷时职务',
   file4_field13        text comment '基社调查人目前职务或现状',
   file4_field14        text comment '基社调查人责任追究情况',
   file4_field15        text comment '基社调查人处罚依据',
   file4_field16        varchar(32) comment '基社审查人姓名',
   file4_field17        varchar(80) comment '基社审查人岗位描述',
   file4_field18        text comment '基社审查人责任事项',
   file4_field19        text comment '基社审查人违规依据',
   file4_field20        varchar(20) comment '基社审查人责任人级别',
   file4_field21        varchar(10) comment '基社审查人贷时岗位角色',
   file4_field22        text comment '基社审查人贷时职务',
   file4_field23        text comment '基社审查人目前职务或现状',
   file4_field24        text comment '基社审查人责任追究情况',
   file4_field25        text comment '基社审查人处罚依据',
   file4_field26        varchar(32) comment '基社审批人姓名',
   file4_field27        varchar(80) comment '基社审批人岗位描述',
   file4_field28        text comment '基社审批人责任事项',
   file4_field29        text comment '基社审批人违规依据',
   file4_field30        varchar(20) comment '基社审批人责任人级别',
   file4_field31        varchar(10) comment '基社审批人贷时岗位角色',
   file4_field32        text comment '基社审批人贷时职务',
   file4_field33        text comment '基社审批人目前职务或现状',
   file4_field34        text comment '基社审批人责任追究情况',
   file4_field35        text comment '基社审批人处罚依据',
   file4_field36        varchar(32) comment '基社其他责任人姓名',
   file4_field37        varchar(80) comment '基社其他责任人岗位描述',
   file4_field38        text comment '基社其他责任人责任事项',
   file4_field39        text comment '基社其他责任人违规依据',
   file4_field40        varchar(20) comment '基社其他责任人责任人级别',
   file4_field41        varchar(10) comment '基社其他责任人贷时岗位角色',
   file4_field42        text comment '基社其他责任人贷时职务',
   file4_field43        text comment '基社其他责任人目前职务或现状',
   file4_field44        text comment '基社其他责任人责任追究情况',
   file4_field45        text comment '基社其他责任人处罚依据',
   file4_field46        varchar(32) comment '县社调查人姓名',
   file4_field47        varchar(80) comment '县社调查人岗位描述',
   file4_field48        text comment '县社调查人责任事项',
   file4_field49        text comment '县社调查人违规依据',
   file4_field50        varchar(20) comment '县社调查人责任人级别',
   file4_field51        varchar(10) comment '县社调查人贷时岗位角色',
   file4_field52        text comment '县社调查人贷时职务',
   file4_field53        text comment '县社调查人目前职务或现状',
   file4_field54        text comment '县社调查人责任追究情况',
   file4_field55        text comment '县社调查人处罚依据',
   file4_field56        varchar(32) comment '县社审查人姓名',
   file4_field57        varchar(80) comment '县社审查人岗位描述',
   file4_field58        text comment '县社审查人责任事项',
   file4_field59        text comment '县社审查人违规依据',
   file4_field60        text comment '县社审查人责任人级别',
   file4_field61        varchar(20) comment '县社审查人贷时岗位角色',
   file4_field62        varchar(10) comment '县社审查人贷时职务',
   file4_field63        text comment '县社审查人目前职务或现状',
   file4_field64        text comment '县社审查人责任追究情况',
   file4_field65        text comment '县社审查人处罚依据',
   file4_field66        varchar(32) comment '县社审批人姓名',
   file4_field67        varchar(80) comment '县社审批人岗位描述',
   file4_field68        text comment '县社审批人责任事项',
   file4_field69        text comment '县社审批人违规依据',
   file4_field70        varchar(20) comment '县社审批人责任人级别',
   file4_field71        varchar(10) comment '县社审批人贷时岗位角色',
   file4_field72        text comment '县社审批人贷时职务',
   file4_field73        text comment '县社审批人目前职务或现状',
   file4_field74        text comment '县社审批人责任追究情况',
   file4_field75        text comment '县社审批人处罚依据',
   file4_field76        varchar(32) comment '县社其他责任人姓名',
   file4_field77        varchar(80) comment '县社其他责任人岗位描述',
   file4_field78        text comment '县社其他责任人责任事项',
   file4_field79        text comment '县社其他责任人违规依据',
   file4_field80        varchar(20) comment '县社其他责任人责任人级别',
   file4_field81        varchar(10) comment '县社其他责任人贷时岗位角色',
   file4_field82        text comment '县社其他责任人贷时职务',
   file4_field83        text comment '县社其他责任人目前职务或现状',
   file4_field84        text comment '县社其他责任人责任追究情况',
   file4_field85        text comment '县社其他责任人处罚依据',
   file4_field86        text comment '县社责任认定工作组责任认定意见',
   file4_field87        text comment '县社责任认定领导小组审核意见',
   file4_field88        varchar(32) comment '县社责任认定结果通报（文号）',
   file4_field89        varchar(32) comment '县社责任追究结果通报（文号）',
   file4_field90        varchar(10) comment '县社认定为有责或无责',
   file4_field91        varchar(32) comment '市联社调查人姓名',
   file4_field92        varchar(80) comment '市联社调查人岗位描述',
   file4_field93        text comment '市联社调查人责任事项',
   file4_field94        text comment '市联社调查人违规依据',
   file4_field95        varchar(20) comment '市联社调查人责任人级别',
   file4_field96        varchar(10) comment '市联社调查人贷时岗位角色',
   file4_field97        text comment '市联社调查人贷时职务',
   file4_field98        text comment '市联社调查人目前职务或现状',
   file4_field99        text comment '市联社调查人责任追究情况',
   file4_field100       text comment '市联社调查人处罚依据',
   file4_field101       varchar(20) comment '市联社审查人姓名',
   file4_field102       varchar(80) comment '市联社审查人岗位描述',
   file4_field103       text comment '市联社审查人责任事项',
   file4_field104       text comment '市联社审查人违规依据',
   file4_field105       varchar(20) comment '市联社审查人责任人级别',
   file4_field106       varchar(10) comment '市联社审查人贷时岗位角色',
   file4_field107       text comment '市联社审查人贷时职务',
   file4_field108       text comment '市联社审查人目前职务或现状',
   file4_field109       text comment '市联社审查人责任追究情况',
   file4_field110       text comment '市联社审查人处罚依据',
   file4_field111       varchar(32) comment '市联社审批人姓名',
   file4_field112       varchar(80) comment '市联社审批人岗位描述',
   file4_field113       text comment '市联社审批人责任事项',
   file4_field114       text comment '市联社审批人违规依据',
   file4_field115       varchar(20) comment '市联社审批人责任人级别',
   file4_field116       varchar(10) comment '市联社审批人贷时岗位角色',
   file4_field117       text comment '市联社审批人贷时职务',
   file4_field118       text comment '市联社审批人目前职务或现状',
   file4_field119       text comment '市联社审批人责任追究情况',
   file4_field120       text comment '市联社审批人处罚依据',
   file4_field121       varchar(32) comment '市联社其他责任人姓名',
   file4_field122       varchar(80) comment '市联社其他责任人岗位描述',
   file4_field123       text comment '市联社其他责任人责任事项',
   file4_field124       text comment '市联社其他责任人违规依据',
   file4_field125       varchar(20) comment '市联社其他责任人责任人级别',
   file4_field126       varchar(10) comment '市联社其他责任人贷时岗位角色',
   file4_field127       text comment '市联社其他责任人贷时职务',
   file4_field128       text comment '市联社其他责任人目前职务或现状',
   file4_field129       text comment '市联社其他责任人责任追究情况',
   file4_field130       text comment '市联社其他责任人处罚依据',
   file4_field131       text comment '市联社责任认定工作组责任认定意见',
   file4_field132       text comment '市联社责任认定领导小组审核意见',
   file4_field133       varchar(32) comment '市联社责任认定结果通报（文号）',
   file4_field134       varchar(32) comment '市联社责任追究结果通报（文号）',
   file4_field135       varchar(32) comment '省联社姓名',
   file4_field136       varchar(80) comment '省联社岗位描述',
   file4_field137       text comment '省联社责任事项',
   file4_field138       text comment '省联社违规依据',
   file4_field139       varchar(20) comment '省联社责任认定结果通报（文号）',
   file4_field140       varchar(10) comment '省联社责任追究情况',
   file4_field141       varchar(32) comment '省联社责任追究结果通报（文号）',
   file4_field142       text comment '备注',
   primary key (receipt_loan_num)
);
alter table responsibility_info comment '责任认定信息(附件四responsibility_info)';
/*==============================================================*/
/* Index: Index_responsibility_info                             */
/*==============================================================*/
create index Index_responsibility_info on responsibility_info
(
   receipt_loan_num
);
alter table responsibility_info add constraint FK_Reference_2 foreign key (receipt_loan_num)
      references account_info (receipt_loan_num) on delete restrict on update restrict;


drop index Index_account_files on account_files;
drop table if exists account_files;
/*==============================================================*/
/* Table: account_files                                         */
/*==============================================================*/
create table account_files
(
   ID                   int not null auto_increment,
   receipt_loan_num     varchar(50) comment '借据编号',
   file_type            varchar(50) comment '文件类型',
   file_name            varchar(100) comment '文件名称',
   file_path            varchar(500) comment '文件路径',
   primary key (ID)
);
alter table account_files comment '台账附件表';
/*==============================================================*/
/* Index: Index_account_files                                   */
/*==============================================================*/
create index Index_account_files on account_files
(
   receipt_loan_num
);
alter table account_files add constraint FK_Reference_7 foreign key (receipt_loan_num)
      references account_info (receipt_loan_num) on delete restrict on update restrict;


drop index Index_account_change_info on account_change_info;
drop table if exists account_change_info;
/*==============================================================*/
/* Table: account_change_info                                   */
/*==============================================================*/
create table account_change_info
(
   ID                   int not null auto_increment,
   receipt_loan_num     varchar(50) comment '借据编号',
   iteam_name           varchar(50) comment '变动项名称',
   cheange_desc         varchar(100) comment '变动描述',
   primary key (ID)
);
alter table account_change_info comment '台账变化记录表';
/*==============================================================*/
/* Index: Index_account_change_info                             */
/*==============================================================*/
create index Index_account_change_info on account_change_info
(
   ID,
   receipt_loan_num
);
alter table account_change_info add constraint FK_Reference_5 foreign key (receipt_loan_num)
      references account_info (receipt_loan_num) on delete restrict on update restrict;


drop table if exists account_info_his;
/*==============================================================*/
/* Table: account_info_his                                      */
/*==============================================================*/
create table account_info_his
(
   ID                   int not null auto_increment,
   receipt_loan_num     varchar(50) comment '借据编号',
   org_id               int comment '机构ID',
   up_state             varchar(2) comment '上报状态',
   update_date          varchar(20) comment '更新时间',
   file1_field1         varchar(32) comment '客户码',
   file1_field2         varchar(60) comment '客户名称',
   file1_field3         varchar(20) comment '客户类型',
   file1_field4         varchar(32) comment '企业规模',
   file1_field5         text comment '住址（个人）',
   file1_field6         varchar(32) comment '客户经理',
   file1_field7         varchar(32) comment '客户经理姓名',
   file1_field8         varchar(20) comment '起贷时间',
   file1_field9         varchar(20) comment '止贷时间',
   file1_field10        varchar(20) comment '原止贷时间',
   file1_field11        varchar(32) comment '贷款期限',
   file1_field12        varchar(20) comment '期限类型',
   file1_field13        varchar(20) comment '五级分类',
   file1_field14        varchar(19) comment '借据金额',
   file1_field15        varchar(19) comment '借据余额',
   file1_field16        text comment '借款用途描述',
   file1_field17        varchar(20) comment '贷款科目',
   file1_field18        varchar(20) comment '担保方式',
   file1_field19        varchar(15) comment '业务品种',
   file1_field20        varchar(20) comment '业务品种细分',
   file1_field21        varchar(20) comment '贷款投向',
   file1_field22        varchar(50) comment '贷款投向名称',
   file1_field23        varchar(50) comment '贷款投向细分',
   file1_field24        varchar(50) comment '个人经营细分',
   file1_field25        varchar(20) comment '涉农情况',
   file1_field26        text comment '涉农用途',
   file1_field27        varchar(2) comment '农林牧渔业贷款分类',
   file1_field28        varchar(20) comment '特色贷款分类',
   file1_field29        varchar(20) comment '特色贷款分类2',
   file1_field30        varchar(15) comment '行业分类',
   file1_field31        varchar(50) comment '行业名称',
   file1_field32        varchar(15) comment '三惠卡绑定标识',
   file1_field33        varchar(15) comment '银团标志',
   file1_field34        varchar(15) comment '再贷款标识',
   file1_field35        varchar(15) comment '贷款台帐状态',
   file1_field36        varchar(10) comment '是否工商登记',
   file1_field37        varchar(50) comment '登记注册号',
   file1_field38        varchar(10) comment '登记注册类型',
   file1_field39        varchar(10) comment '利率执行方式',
   file1_field40        varchar(10) comment '是否计复利',
   file1_field41        varchar(10) comment '利率调整方式',
   file1_field42        varchar(10) comment '是否自动调整利率',
   file1_field43        varchar(10) comment '贷款利率（年）(%)',
   file1_field44        varchar(10) comment '利率浮动比(%)',
   file1_field45        varchar(10) comment '计息方式',
   file1_field46        varchar(10) comment '贴息状态',
   file1_field47        varchar(20) comment '起息日期',
   file1_field48        varchar(19) comment '欠息累计',
   file1_field49        varchar(19) comment '应收利息累计',
   file1_field50        varchar(19) comment '实收利息累计',
   file1_field51        varchar(19) comment '表内欠息',
   file1_field52        varchar(19) comment '表外欠息',
   file1_field53        varchar(19) comment '登记簿欠息',
   file1_field54        varchar(10) comment '利息逾期天数',
   file1_field55        varchar(20) comment '最早利息逾期日期',
   file1_field56        varchar(50) comment '信用等级模型',
   file1_field57        varchar(10) comment '信用等级',
   file1_field58        varchar(20) comment '评级有效日期',
   file1_field59        varchar(20) comment '合同编号',
   file1_field60        varchar(2) comment '贷款合同类型',
   file1_field61        varchar(20) comment '合同起始日期',
   file1_field62        varchar(20) comment '合同终止日期',
   file1_field63        varchar(19) comment '合同金额',
   file1_field64        varchar(19) comment '合同可用余额',
   file1_field65        varchar(32) comment '合同贷款期限',
   file1_field66        varchar(20) comment '交易日期',
   file1_field67        varchar(20) comment '结清日期',
   file1_field68        varchar(20) comment '销户日期',
   file1_field69        varchar(15) comment '上次五级分类',
   file1_field70        varchar(20) comment '上次清分日期',
   file1_field71        varchar(20) comment '五级分类日期',
   file1_field72        varchar(15) comment '四级分类',
   file1_field73        varchar(19) comment '正常贷款余额（四级）',
   file1_field74        varchar(19) comment '逾期贷款余额（四级）',
   file1_field75        varchar(19) comment '呆滞贷款余额（四级）',
   file1_field76        varchar(19) comment '呆帐贷款余额（四级）',
   file1_field77        varchar(50) comment '集团名称',
   file1_field78        varchar(50) comment '集团编号',
   file1_field79        varchar(20) comment '集团成员类型',
   file1_field80        varchar(20) comment '经营状况',
   file1_field81        varchar(20) comment '控股类型',
   file1_field82        varchar(20) comment '龙头企业标志',
   file1_field83        varchar(20) comment '农业产业化龙头企业贷款',
   file1_field84        varchar(50) comment '创业贷款推荐单位',
   file1_field85        varchar(50) comment '创业贷款发放对象',
   file1_field86        varchar(50) comment '创业贷款投向',
   file1_field87        varchar(20) comment '创业贷款推荐单位行政级别',
   file1_field88        varchar(50) comment '失业人员小额担保贷款推荐单位',
   file1_field89        varchar(50) comment '失业人员小额担保贷款发放对象',
   file1_field90        varchar(50) comment '失业人员小额担保贷款投向',
   file1_field91        varchar(32) comment '法定代表人姓名',
   file1_field92        varchar(50) comment '微型企业培育贷款推荐单位',
   file1_field93        varchar(20) comment '房地产贷款投向分类',
   file1_field94        varchar(20) comment '房地产贷款投向细分',
   file1_field95        varchar(20) comment '房地产贷款投向分类其中',
   file1_field96        varchar(20) comment '按法律性质分类',
   file1_field97        varchar(20) comment '按隶属关系分类',
   file1_field98        varchar(10) comment '按类型分类',
   file1_field99        varchar(10) comment '按实际投向分类',
   file1_field100       varchar(10) comment '按偿债资金来源分类',
   file1_field101       varchar(10) comment '按贷款方式分类',
   file1_field102       varchar(10) comment '保障安居工程贷款投向分类',
   file1_field103       varchar(10) comment '保障安居工程贷款投向分类其中',
   file1_field104       varchar(10) comment '劳动密集型小企业贷款贷款形式',
   file1_field105       varchar(10) comment '对公业务品种(瑞丽)',
   file1_field106       varchar(10) comment '对私业务品种(瑞丽)',
   file1_field107       varchar(10) comment '贷款发放渠道',
   file1_field108       varchar(10) comment '行业资质评定等级',
   file1_field109       text comment '注册地址',
   file1_field110       varchar(10) comment '联保类型',
   file1_field111       varchar(10) comment '贷款形式',
   file1_field112       varchar(50) comment '最终审批机构',
   file1_field113       varchar(2) comment '性别',
   file1_field114       varchar(10) comment '民族',
   file1_field115       varchar(32) comment '证件号码',
   file1_field116       varchar(32) comment '地区编码',
   file1_field117       varchar(50) comment '贷款账号',
   file1_field118       varchar(50) comment '结算帐号',
   file1_field119       varchar(20) comment '手机号码',
   file1_field120       varchar(20) comment '短信通知号码',
   file1_field121       varchar(20) comment '联系电话（企业）',
   file1_field122       varchar(20) comment '住宅电话',
   file1_field123       varchar(20) comment '单位电话',
   file1_field124       varchar(4) comment '家庭拥有住房套数(个人住房)',
   file1_field125       varchar(10) comment '偿债收入比(个人住房)',
   file1_field126       varchar(10) comment '房屋面积(个人住房)',
   file1_field127       varchar(10) comment '贷款价值比(个人住房、企业房地产)',
   file1_field128       varchar(10) comment '展期次数',
   file1_field129       text comment '备注信息（统计专用）',
   file1_field130       varchar(10) comment '行业政策类型',
   file1_field131       varchar(19) comment '购房总价',
   primary key (ID)
);
alter table account_info_his comment '台账信息 历史表(附件一account_info)';


drop table if exists account_dispose_details_his;
/*==============================================================*/
/* Table: account_dispose_details_his                           */
/*==============================================================*/
create table account_dispose_details_his
(
   ID                   int not null,
   receipt_loan_num     varchar(50) comment '借据编号',
   file3_field1         varchar(15) comment '现金清收本金合计',
   file3_field2         varchar(15) comment '正常现金清收',
   file3_field3         varchar(15) comment '诉讼清收',
   file3_field4         text comment '协商处置抵押物',
   file3_field5         varchar(20) comment '分期偿还',
   file3_field6         text comment '引入社会投资人项目并购或收购抵押物',
   file3_field7         text comment '现金清收本金其他',
   file3_field8         varchar(20) comment '现金清收利息',
   file3_field9         varchar(20) comment '资产转让（卖断）',
   file3_field10        varchar(20) comment '收到价款',
   file3_field11        varchar(20) comment '转让损失核销金额',
   file3_field12        varchar(20) comment '收本挂息',
   file3_field13        varchar(20) comment '以物抵债',
   file3_field14        varchar(20) comment '呆账核销',
   file3_field15        varchar(20) comment '风险救助金置换',
   file3_field16        varchar(20) comment '借新还旧',
   file3_field17        varchar(20) comment '债务转移',
   file3_field18        varchar(20) comment '调整担保',
   file3_field19        varchar(20) comment '资产转让（收益权）',
   file3_field20        varchar(20) comment '清收欠息后调入正常类',
   file3_field21        text comment '资产转让其他',
   file3_field22        varchar(9) comment '清收本息合计',
   primary key (ID)
);
alter table account_dispose_details_his comment '本期清收处置情况 历史表（附件三account_dispose_details_his）';
alter table account_dispose_details_his add constraint FK_Reference_9 foreign key (ID)
      references account_info_his (ID) on delete restrict on update restrict;


drop table if exists account_dispose_his;
/*==============================================================*/
/* Table: account_dispose_his                                   */
/*==============================================================*/
create table account_dispose_his
(
   ID                   int not null,
   receipt_loan_num     varchar(50) comment '借据编号',
   file2_field1         varchar(50) comment '牵头联社',
   file2_field2         varchar(50) comment '实际发放机构',
   file2_field3         varchar(50) comment '关联贷款主体',
   file2_field4         varchar(50) comment '借款人实际控制人',
   file2_field5         varchar(20) comment '借款人实际控制人身份证号码',
   file2_field6         varchar(20) comment '担保人实际控制人',
   file2_field7         varchar(20) comment '担保人实际控制人身份证号码',
   file2_field8         text comment '表内外贷款',
   file2_field9         varchar(20) comment '社团标志',
   file2_field10        varchar(10) comment '进入（调入）不良的时间',
   file2_field11        varchar(9) comment '截止本期债务余额(本金）',
   file2_field12        varchar(9) comment '本年计划清收金额',
   file2_field13        varchar(4) comment '本期清收完成进度 %',
   file2_field14        text comment '抵、质押情况',
   file2_field15        text comment '借款人现状',
   file2_field16        text comment '担保人现状',
   file2_field17        text comment '抵、质押物现状',
   file2_field18        text comment '其他事项',
   file2_field19        varchar(20) comment '挂钩领导',
   file2_field20        varchar(20) comment '清收负责人',
   file2_field21        varchar(20) comment '清收人员',
   file2_field22        varchar(20) comment '诉讼情况',
   file2_field23        varchar(20) comment '执行情况',
   file2_field24        text comment '对其他财产线索的查封、冻结情况',
   file2_field25        text comment '清收处置措施、方案',
   file2_field26        varchar(10) comment '计划清收完成时限',
   file2_field27        varchar(9) comment '预计损失',
   file2_field28        text comment '上期清收处置工作完成情况及成效',
   file2_field29        text comment '本期计划清收处置工作开展情况',
   file2_field30        text comment '方案推进过程中发现的困难和问题',
   file2_field31        varchar(10) comment '核销时间（置换时间、收益权转让时间）',
   file2_field32        varchar(9) comment '核销金额（置换、收益权金额）',
   file2_field33        text comment '核销条款（置换批复、转让协议号）',
   file2_field34        varchar(9) comment '现欠余额',
   file2_field35        varchar(50) comment '贷款发放时最终审批机构',
   file2_field36        varchar(50) comment '核销最终审批机构',
   file2_field37        varchar(9) comment '核销后累计清收金额',
   file2_field38        text comment '清收方式',
   primary key (ID)
);
alter table account_dispose_his comment '台账清收处置(附件二account_dispose_his)';
alter table account_dispose_his add constraint FK_Reference_8 foreign key (ID)
      references account_info_his (ID) on delete restrict on update restrict;


drop table if exists responsibility_info_his;
/*==============================================================*/
/* Table: responsibility_info_his                               */
/*==============================================================*/
create table responsibility_info_his
(
   ID                   int not null,
   receipt_loan_num     varchar(50) comment '借据编号',
   file4_field1         varchar(50) comment '主办社',
   file4_field2         text comment '不良信贷资产（损失）形成的主客观原因',
   file4_field3         varchar(10) comment '责任认定类型',
   file4_field4         varchar(10) comment '县级行社认定为有责或无责',
   file4_field5         varchar(20) comment '责任认定日期',
   file4_field6         varchar(32) comment '基社调查人姓名',
   file4_field7         varchar(80) comment '基社调查人岗位描述',
   file4_field8         text comment '基社调查人责任事项',
   file4_field9         text comment '基社调查人违规依据',
   file4_field10        varchar(20) comment '基社调查人责任人级别',
   file4_field11        varchar(10) comment '基社调查人贷时岗位角色',
   file4_field12        text comment '基社调查人贷时职务',
   file4_field13        text comment '基社调查人目前职务或现状',
   file4_field14        text comment '基社调查人责任追究情况',
   file4_field15        text comment '基社调查人处罚依据',
   file4_field16        varchar(32) comment '基社审查人姓名',
   file4_field17        varchar(80) comment '基社审查人岗位描述',
   file4_field18        text comment '基社审查人责任事项',
   file4_field19        text comment '基社审查人违规依据',
   file4_field20        varchar(20) comment '基社审查人责任人级别',
   file4_field21        varchar(10) comment '基社审查人贷时岗位角色',
   file4_field22        text comment '基社审查人贷时职务',
   file4_field23        text comment '基社审查人目前职务或现状',
   file4_field24        text comment '基社审查人责任追究情况',
   file4_field25        text comment '基社审查人处罚依据',
   file4_field26        varchar(32) comment '基社审批人姓名',
   file4_field27        varchar(80) comment '基社审批人岗位描述',
   file4_field28        text comment '基社审批人责任事项',
   file4_field29        text comment '基社审批人违规依据',
   file4_field30        varchar(20) comment '基社审批人责任人级别',
   file4_field31        varchar(10) comment '基社审批人贷时岗位角色',
   file4_field32        text comment '基社审批人贷时职务',
   file4_field33        text comment '基社审批人目前职务或现状',
   file4_field34        text comment '基社审批人责任追究情况',
   file4_field35        text comment '基社审批人处罚依据',
   file4_field36        varchar(32) comment '基社其他责任人姓名',
   file4_field37        varchar(80) comment '基社其他责任人岗位描述',
   file4_field38        text comment '基社其他责任人责任事项',
   file4_field39        text comment '基社其他责任人违规依据',
   file4_field40        varchar(20) comment '基社其他责任人责任人级别',
   file4_field41        varchar(10) comment '基社其他责任人贷时岗位角色',
   file4_field42        text comment '基社其他责任人贷时职务',
   file4_field43        text comment '基社其他责任人目前职务或现状',
   file4_field44        text comment '基社其他责任人责任追究情况',
   file4_field45        text comment '基社其他责任人处罚依据',
   file4_field46        varchar(32) comment '县社调查人姓名',
   file4_field47        varchar(80) comment '县社调查人岗位描述',
   file4_field48        text comment '县社调查人责任事项',
   file4_field49        text comment '县社调查人违规依据',
   file4_field50        varchar(20) comment '县社调查人责任人级别',
   file4_field51        varchar(10) comment '县社调查人贷时岗位角色',
   file4_field52        text comment '县社调查人贷时职务',
   file4_field53        text comment '县社调查人目前职务或现状',
   file4_field54        text comment '县社调查人责任追究情况',
   file4_field55        text comment '县社调查人处罚依据',
   file4_field56        varchar(32) comment '县社审查人姓名',
   file4_field57        varchar(80) comment '县社审查人岗位描述',
   file4_field58        text comment '县社审查人责任事项',
   file4_field59        text comment '县社审查人违规依据',
   file4_field60        text comment '县社审查人责任人级别',
   file4_field61        varchar(20) comment '县社审查人贷时岗位角色',
   file4_field62        varchar(10) comment '县社审查人贷时职务',
   file4_field63        text comment '县社审查人目前职务或现状',
   file4_field64        text comment '县社审查人责任追究情况',
   file4_field65        text comment '县社审查人处罚依据',
   file4_field66        varchar(32) comment '县社审批人姓名',
   file4_field67        varchar(80) comment '县社审批人岗位描述',
   file4_field68        text comment '县社审批人责任事项',
   file4_field69        text comment '县社审批人违规依据',
   file4_field70        varchar(20) comment '县社审批人责任人级别',
   file4_field71        varchar(10) comment '县社审批人贷时岗位角色',
   file4_field72        text comment '县社审批人贷时职务',
   file4_field73        text comment '县社审批人目前职务或现状',
   file4_field74        text comment '县社审批人责任追究情况',
   file4_field75        text comment '县社审批人处罚依据',
   file4_field76        varchar(32) comment '县社其他责任人姓名',
   file4_field77        varchar(80) comment '县社其他责任人岗位描述',
   file4_field78        text comment '县社其他责任人责任事项',
   file4_field79        text comment '县社其他责任人违规依据',
   file4_field80        varchar(20) comment '县社其他责任人责任人级别',
   file4_field81        varchar(10) comment '县社其他责任人贷时岗位角色',
   file4_field82        text comment '县社其他责任人贷时职务',
   file4_field83        text comment '县社其他责任人目前职务或现状',
   file4_field84        text comment '县社其他责任人责任追究情况',
   file4_field85        text comment '县社其他责任人处罚依据',
   file4_field86        text comment '县社责任认定工作组责任认定意见',
   file4_field87        text comment '县社责任认定领导小组审核意见',
   file4_field88        varchar(32) comment '县社责任认定结果通报（文号）',
   file4_field89        varchar(32) comment '县社责任追究结果通报（文号）',
   file4_field90        varchar(10) comment '县社认定为有责或无责',
   file4_field91        varchar(32) comment '市联社调查人姓名',
   file4_field92        varchar(80) comment '市联社调查人岗位描述',
   file4_field93        text comment '市联社调查人责任事项',
   file4_field94        text comment '市联社调查人违规依据',
   file4_field95        varchar(20) comment '市联社调查人责任人级别',
   file4_field96        varchar(10) comment '市联社调查人贷时岗位角色',
   file4_field97        text comment '市联社调查人贷时职务',
   file4_field98        text comment '市联社调查人目前职务或现状',
   file4_field99        text comment '市联社调查人责任追究情况',
   file4_field100       text comment '市联社调查人处罚依据',
   file4_field101       varchar(20) comment '市联社审查人姓名',
   file4_field102       varchar(80) comment '市联社审查人岗位描述',
   file4_field103       text comment '市联社审查人责任事项',
   file4_field104       text comment '市联社审查人违规依据',
   file4_field105       varchar(20) comment '市联社审查人责任人级别',
   file4_field106       varchar(10) comment '市联社审查人贷时岗位角色',
   file4_field107       text comment '市联社审查人贷时职务',
   file4_field108       text comment '市联社审查人目前职务或现状',
   file4_field109       text comment '市联社审查人责任追究情况',
   file4_field110       text comment '市联社审查人处罚依据',
   file4_field111       varchar(32) comment '市联社审批人姓名',
   file4_field112       varchar(80) comment '市联社审批人岗位描述',
   file4_field113       text comment '市联社审批人责任事项',
   file4_field114       text comment '市联社审批人违规依据',
   file4_field115       varchar(20) comment '市联社审批人责任人级别',
   file4_field116       varchar(10) comment '市联社审批人贷时岗位角色',
   file4_field117       text comment '市联社审批人贷时职务',
   file4_field118       text comment '市联社审批人目前职务或现状',
   file4_field119       text comment '市联社审批人责任追究情况',
   file4_field120       text comment '市联社审批人处罚依据',
   file4_field121       varchar(32) comment '市联社其他责任人姓名',
   file4_field122       varchar(80) comment '市联社其他责任人岗位描述',
   file4_field123       text comment '市联社其他责任人责任事项',
   file4_field124       text comment '市联社其他责任人违规依据',
   file4_field125       varchar(20) comment '市联社其他责任人责任人级别',
   file4_field126       varchar(10) comment '市联社其他责任人贷时岗位角色',
   file4_field127       text comment '市联社其他责任人贷时职务',
   file4_field128       text comment '市联社其他责任人目前职务或现状',
   file4_field129       text comment '市联社其他责任人责任追究情况',
   file4_field130       text comment '市联社其他责任人处罚依据',
   file4_field131       text comment '市联社责任认定工作组责任认定意见',
   file4_field132       text comment '市联社责任认定领导小组审核意见',
   file4_field133       varchar(32) comment '市联社责任认定结果通报（文号）',
   file4_field134       varchar(32) comment '市联社责任追究结果通报（文号）',
   file4_field135       varchar(32) comment '省联社姓名',
   file4_field136       varchar(80) comment '省联社岗位描述',
   file4_field137       text comment '省联社责任事项',
   file4_field138       text comment '省联社违规依据',
   file4_field139       varchar(20) comment '省联社责任认定结果通报（文号）',
   file4_field140       varchar(10) comment '省联社责任追究情况',
   file4_field141       varchar(32) comment '省联社责任追究结果通报（文号）',
   file4_field142       text comment '备注',
   primary key (ID)
);
alter table responsibility_info_his comment '责任认定信息 历史表(附件四responsibility_his_info)';
alter table responsibility_info_his add constraint FK_Reference_10 foreign key (ID)
      references account_info_his (ID) on delete restrict on update restrict;
