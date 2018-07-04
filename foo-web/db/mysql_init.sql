/*
Navicat MySQL Data Transfer

Source Server         : ATOM
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : nmcm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-06-14 23:42:52
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
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_info
-- ----------------------------
INSERT INTO `auth_info` VALUES ('100', '菜单管理', '查询全部菜单树', '/menu/queryMenuTreeAll.action');
INSERT INTO `auth_info` VALUES ('101', '菜单管理', '修改菜单信息', '/menu/updateMenu.action');
INSERT INTO `auth_info` VALUES ('102', '菜单管理', '添加菜单信息', '/menu/addMenu.action');
INSERT INTO `auth_info` VALUES ('103', '菜单管理', '删除菜单信息', '/menu/removeMenu.action');
INSERT INTO `auth_info` VALUES ('110', '人员管理', '查询系统用户信息', '/user/findByCondition.action');
INSERT INTO `auth_info` VALUES ('111', '人员管理', '查询单个系统用户信息', '/user/findById.action');
INSERT INTO `auth_info` VALUES ('112', '人员管理', '添加系统用户信息', '/user/addUser.action');
INSERT INTO `auth_info` VALUES ('113', '人员管理', '修改系统用户信息', '/user/updateUser.action');
INSERT INTO `auth_info` VALUES ('114', '人员管理', '删除系统用户信息', '/user/delUser.action');
INSERT INTO `auth_info` VALUES ('115', '人员管理', '查询角色是否存在', '/role/isExitRoleByCreator.action');
INSERT INTO `auth_info` VALUES ('116', '人员管理', '重置密码', '/user/resetPassword.action');
INSERT INTO `auth_info` VALUES ('117', '人员管理', '查询角色信息', '/role/queryRoleInfo.action');
INSERT INTO `auth_info` VALUES ('120', '权限管理', '查询角色信息', '/role/findByCondition.action');
INSERT INTO `auth_info` VALUES ('121', '权限管理', '查询修改前角色信息', '/role/beforeUpdateRole.action');
INSERT INTO `auth_info` VALUES ('122', '权限管理', '查询角色是否可以删除', '/role/checkCanRemoveRole.action');
INSERT INTO `auth_info` VALUES ('123', '权限管理', '查询修改前角色信息', '/role/beforeUpdateRole.action');
INSERT INTO `auth_info` VALUES ('124', '权限管理', '查询权限信息勾选树', '/role/loadAuthorityCheckTree.action');
INSERT INTO `auth_info` VALUES ('125', '权限管理', '添加角色信息', '/role/addRole.action');
INSERT INTO `auth_info` VALUES ('126', '权限管理', '修改角色信息', '/role/updateRole.action');
INSERT INTO `auth_info` VALUES ('127', '权限管理', '修改角色编辑标志', '/role/updateRoleEditFlag.action');
INSERT INTO `auth_info` VALUES ('128', '权限管理', '删除角色信息', '/role/delRole.action');
INSERT INTO `auth_info` VALUES ('130', '参数管理', '查询参数信息', '/param/findParam.action');
INSERT INTO `auth_info` VALUES ('131', '参数管理', '添加参数信息', '/param/addParam.action');
INSERT INTO `auth_info` VALUES ('132', '参数管理', '修改参数信息', '/param/updateParam.action');
INSERT INTO `auth_info` VALUES ('133', '参数管理', '删除参数信息', '/param/removeParam.action');
INSERT INTO `auth_info` VALUES ('134', '参数管理', '批量删除参数信息', '/param/removeParams.action');
INSERT INTO `auth_info` VALUES ('135', '参数管理', '查询参数详细信息', '/param/findParamById.action');
INSERT INTO `auth_info` VALUES ('140', '机构管理', '查询机构列表信息', '/org/queryApprovedOrgInfos.action');
INSERT INTO `auth_info` VALUES ('141', '机构管理', '添加机构', '/org/addOrgInfo.action');
INSERT INTO `auth_info` VALUES ('142', '机构管理', '删除机构', '/org/removeOrgInfo.action');
INSERT INTO `auth_info` VALUES ('143', '机构管理', '更新机构', '/org/updateOrgInfo.action');
INSERT INTO `auth_info` VALUES ('144', '机构管理', '查询单个机构信息', '/org/queryOrgInfo.action');
INSERT INTO `auth_info` VALUES ('145', '机构管理', '查询机构是否可以删除', '/org/checkIsRemoveOrg.action');
INSERT INTO `auth_info` VALUES ('146', '机构管理', '根据父节点查询机构信息', '/org/queryOrgInfoByParentId.action');


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
-- Records of bms_param
-- ----------------------------
INSERT INTO `bms_param` VALUES ('excelSavePath', '\\root\\exec\\fileSavePath\\', 'excel文件保存路径', '');
INSERT INTO `bms_param` VALUES ('fileSavePath', '\\root\\exec\\fileSavePath\\', '文件保存路径', '');

-- ----------------------------
-- Table structure for menu_auth
-- ----------------------------
DROP TABLE IF EXISTS `menu_auth`;
CREATE TABLE `menu_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `auth_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_auth
-- ----------------------------
INSERT INTO `menu_auth` VALUES ('1', '3', '100');
INSERT INTO `menu_auth` VALUES ('2', '3', '101');
INSERT INTO `menu_auth` VALUES ('3', '3', '102');
INSERT INTO `menu_auth` VALUES ('4', '3', '103');

INSERT INTO `menu_auth` VALUES ('5', '5', '110');
INSERT INTO `menu_auth` VALUES ('6', '5', '111');
INSERT INTO `menu_auth` VALUES ('7', '5', '112');
INSERT INTO `menu_auth` VALUES ('8', '5', '113');
INSERT INTO `menu_auth` VALUES ('9', '5', '114');
INSERT INTO `menu_auth` VALUES ('10', '5', '115');
INSERT INTO `menu_auth` VALUES ('11', '5', '116');
INSERT INTO `menu_auth` VALUES ('12', '5', '117');

INSERT INTO `menu_auth` VALUES ('13', '6', '120');
INSERT INTO `menu_auth` VALUES ('14', '6', '121');
INSERT INTO `menu_auth` VALUES ('15', '6', '122');
INSERT INTO `menu_auth` VALUES ('16', '6', '123');
INSERT INTO `menu_auth` VALUES ('17', '6', '124');
INSERT INTO `menu_auth` VALUES ('18', '6', '125');
INSERT INTO `menu_auth` VALUES ('19', '6', '126');
INSERT INTO `menu_auth` VALUES ('20', '6', '127');
INSERT INTO `menu_auth` VALUES ('21', '6', '128');


INSERT INTO `menu_auth` VALUES ('22', '9', '130');
INSERT INTO `menu_auth` VALUES ('23', '9', '131');
INSERT INTO `menu_auth` VALUES ('24', '9', '132');
INSERT INTO `menu_auth` VALUES ('25', '9', '133');
INSERT INTO `menu_auth` VALUES ('26', '9', '134');
INSERT INTO `menu_auth` VALUES ('27', '9', '135');


INSERT INTO `menu_auth` VALUES ('28', '7', '140');
INSERT INTO `menu_auth` VALUES ('29', '7', '141');
INSERT INTO `menu_auth` VALUES ('30', '7', '142');
INSERT INTO `menu_auth` VALUES ('31', '7', '143');
INSERT INTO `menu_auth` VALUES ('32', '7', '144');
INSERT INTO `menu_auth` VALUES ('33', '7', '145');
INSERT INTO `menu_auth` VALUES ('34', '7', '146');


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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_tree
-- ----------------------------
INSERT INTO `menu_tree` VALUES ('1', null, '昆明农信不良资产管理系统', 'r', '0', null, '1');
INSERT INTO `menu_tree` VALUES ('2', '1', '开发维护', 'fa-tasks', '0', null, '2');
INSERT INTO `menu_tree` VALUES ('3', '2', '菜单管理', '', '1', '/nplm/menu/menu.html', '4');

INSERT INTO `menu_tree` VALUES ('4', '1', '基础管理', 'icon-group', '0', null, '3');
INSERT INTO `menu_tree` VALUES ('5', '4', '人员管理', '', '1', '/nplm/user/user.html', '7');
INSERT INTO `menu_tree` VALUES ('6', '4', '权限管理', '', '1', '/nplm/role/role.html', '6');
INSERT INTO `menu_tree` VALUES ('7', '4', '机构管理', '', '1', '/nplm/org/org.html', null);

INSERT INTO `menu_tree` VALUES ('8', '1', '系统管理', 'icon-gear', '0', '', null);
INSERT INTO `menu_tree` VALUES ('9', '8', '参数管理', '', '1', '/nplm/param/param.html', null);

INSERT INTO `menu_tree` VALUES ('10', '1', '报表管理', 'icon-bar-chart', '0', '', null);
INSERT INTO `menu_tree` VALUES ('11', '10', '培训信息明细报表', '', '1', '/nplm/report/trainDetailReport/trainDetailReport.html', null);


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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of org_info
-- ----------------------------
INSERT INTO `org_info` VALUES ('1', null, '000000000', '根机构', '昆明市', '管理员', '13888888888', '00001', 'sysadmin', '', '', '2018-05-06 10:24:34', '0', '000000001');



-- ----------------------------
-- Table structure for role_auth
-- ----------------------------
DROP TABLE IF EXISTS `role_auth`;
CREATE TABLE `role_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `auth_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_auth
-- ----------------------------
INSERT INTO `role_auth` VALUES ('1', '0', '100');
INSERT INTO `role_auth` VALUES ('2', '0', '101');
INSERT INTO `role_auth` VALUES ('3', '0', '102');
INSERT INTO `role_auth` VALUES ('4', '0', '103');
INSERT INTO `role_auth` VALUES ('5', '999', '110');
INSERT INTO `role_auth` VALUES ('6', '999', '111');
INSERT INTO `role_auth` VALUES ('7', '999', '112');
INSERT INTO `role_auth` VALUES ('8', '999', '113');
INSERT INTO `role_auth` VALUES ('9', '999', '114');
INSERT INTO `role_auth` VALUES ('10', '999', '115');
INSERT INTO `role_auth` VALUES ('11', '999', '116');
INSERT INTO `role_auth` VALUES ('12', '999', '117');
INSERT INTO `role_auth` VALUES ('13', '999', '120');
INSERT INTO `role_auth` VALUES ('14', '999', '121');
INSERT INTO `role_auth` VALUES ('15', '999', '122');
INSERT INTO `role_auth` VALUES ('16', '999', '123');
INSERT INTO `role_auth` VALUES ('17', '999', '124');
INSERT INTO `role_auth` VALUES ('18', '999', '125');
INSERT INTO `role_auth` VALUES ('19', '999', '126');
INSERT INTO `role_auth` VALUES ('20', '999', '127');
INSERT INTO `role_auth` VALUES ('21', '999', '128');
INSERT INTO `role_auth` VALUES ('22', '999', '140');
INSERT INTO `role_auth` VALUES ('23', '999', '141');
INSERT INTO `role_auth` VALUES ('24', '999', '142');
INSERT INTO `role_auth` VALUES ('25', '999', '143');
INSERT INTO `role_auth` VALUES ('26', '999', '144');
INSERT INTO `role_auth` VALUES ('27', '999', '145');
INSERT INTO `role_auth` VALUES ('28', '999', '146');

INSERT INTO `role_auth` VALUES ('29', '1001', '110');
INSERT INTO `role_auth` VALUES ('30', '1001', '111');
INSERT INTO `role_auth` VALUES ('31', '1001', '112');
INSERT INTO `role_auth` VALUES ('32', '1001', '113');
INSERT INTO `role_auth` VALUES ('33', '1001', '114');
INSERT INTO `role_auth` VALUES ('34', '1001', '115');
INSERT INTO `role_auth` VALUES ('35', '1001', '116');
INSERT INTO `role_auth` VALUES ('36', '1001', '117');
INSERT INTO `role_auth` VALUES ('37', '1001', '120');
INSERT INTO `role_auth` VALUES ('38', '1001', '121');
INSERT INTO `role_auth` VALUES ('39', '1001', '122');
INSERT INTO `role_auth` VALUES ('40', '1001', '123');
INSERT INTO `role_auth` VALUES ('41', '1001', '124');
INSERT INTO `role_auth` VALUES ('42', '1001', '125');
INSERT INTO `role_auth` VALUES ('43', '1001', '126');
INSERT INTO `role_auth` VALUES ('44', '1001', '127');
INSERT INTO `role_auth` VALUES ('45', '1001', '128');
INSERT INTO `role_auth` VALUES ('46', '1001', '130');
INSERT INTO `role_auth` VALUES ('47', '1001', '131');
INSERT INTO `role_auth` VALUES ('48', '1001', '132');
INSERT INTO `role_auth` VALUES ('49', '1001', '133');
INSERT INTO `role_auth` VALUES ('50', '1001', '134');
INSERT INTO `role_auth` VALUES ('51', '1001', '135');
INSERT INTO `role_auth` VALUES ('52', '1001', '140');
INSERT INTO `role_auth` VALUES ('53', '1001', '141');
INSERT INTO `role_auth` VALUES ('54', '1001', '142');
INSERT INTO `role_auth` VALUES ('55', '1001', '143');
INSERT INTO `role_auth` VALUES ('56', '1001', '144');
INSERT INTO `role_auth` VALUES ('57', '1001', '145');
INSERT INTO `role_auth` VALUES ('58', '1001', '146');

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
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('999', '权限管理员', '用户权限管理', null);
INSERT INTO `role_info` VALUES ('1000', '开发者', '菜单管理参数管理', null);
INSERT INTO `role_info` VALUES ('1001', '管理员', '全部权限', 'admin');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('1', '0', '3');
INSERT INTO `role_menu` VALUES ('2', '0', '2');
INSERT INTO `role_menu` VALUES ('3', '999', '4');
INSERT INTO `role_menu` VALUES ('4', '999', '5');
INSERT INTO `role_menu` VALUES ('5', '999', '6');
INSERT INTO `role_menu` VALUES ('6', '999', '7');
INSERT INTO `role_menu` VALUES ('7', '1001', '4');
INSERT INTO `role_menu` VALUES ('8', '1001', '5');
INSERT INTO `role_menu` VALUES ('9', '1001', '6');
INSERT INTO `role_menu` VALUES ('10', '1001', '7');
INSERT INTO `role_menu` VALUES ('11', '1001', '8');
INSERT INTO `role_menu` VALUES ('12', '1001', '9');

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
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('admin', '管理员', '72axtmmITGvJO0kkRZmlVg==', null, null, null, '1', null, '1', '00001');
INSERT INTO `user_info` VALUES ('developer', '开发者', 'RmHwWuxImWE1UQwwECFNkQ==', null, null, null, '1', null, '1', '00001');
INSERT INTO `user_info` VALUES ('sysadmin', '管理员', 'eVg/B57HHXtNwwg527C44Q==', '15999999999', null, '男', null, '2018-05-12 13:41:00', '1', '00001');

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

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '0', 'developer');
INSERT INTO `user_role` VALUES ('2', '999', 'admin');
INSERT INTO `user_role` VALUES ('3', '1001', 'sysadmin');
