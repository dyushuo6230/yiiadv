/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : advanced

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-09-24 12:26:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('站长', '1', '1537632367');
INSERT INTO `auth_assignment` VALUES ('调试员', '2', '1537671856');

-- ----------------------------
-- Table structure for `auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1537631902', '1537631902');
INSERT INTO `auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1537632690', '1537632690');
INSERT INTO `auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1537632712', '1537632712');
INSERT INTO `auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1537632724', '1537632724');
INSERT INTO `auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1537631914', '1537631914');
INSERT INTO `auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1537632734', '1537632734');
INSERT INTO `auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1537631923', '1537631923');
INSERT INTO `auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1537632744', '1537632744');
INSERT INTO `auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1537631934', '1537631934');
INSERT INTO `auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1537632753', '1537632753');
INSERT INTO `auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1537673343', '1537673343');
INSERT INTO `auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1537673345', '1537673345');
INSERT INTO `auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1537675892', '1537675892');
INSERT INTO `auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1537675898', '1537675898');
INSERT INTO `auth_item` VALUES ('/debug/*', '2', null, null, null, '1537669688', '1537669688');
INSERT INTO `auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1537669702', '1537669702');
INSERT INTO `auth_item` VALUES ('/gii/*', '2', null, null, null, '1537669712', '1537669712');
INSERT INTO `auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1537669716', '1537669716');
INSERT INTO `auth_item` VALUES ('/user/*', '2', null, null, null, '1537673042', '1537673042');
INSERT INTO `auth_item` VALUES ('/user/index', '2', null, null, null, '1537673043', '1537673043');
INSERT INTO `auth_item` VALUES ('权限控制', '2', null, null, null, '1537632005', '1537632005');
INSERT INTO `auth_item` VALUES ('站长', '1', null, null, null, '1537632198', '1537632198');
INSERT INTO `auth_item` VALUES ('管理用户', '2', null, '修改用户', null, '1537673492', '1537676120');
INSERT INTO `auth_item` VALUES ('调试', '2', null, null, null, '1537669765', '1537669765');
INSERT INTO `auth_item` VALUES ('调试员', '1', null, '修改用户', null, '1537671718', '1537674430');

-- ----------------------------
-- Table structure for `auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('权限控制', '/admin/assignment/*');
INSERT INTO `auth_item_child` VALUES ('权限控制', '/admin/menu/*');
INSERT INTO `auth_item_child` VALUES ('权限控制', '/admin/permission/*');
INSERT INTO `auth_item_child` VALUES ('权限控制', '/admin/role/*');
INSERT INTO `auth_item_child` VALUES ('权限控制', '/admin/route/*');
INSERT INTO `auth_item_child` VALUES ('权限控制', '/admin/rule/*');
INSERT INTO `auth_item_child` VALUES ('管理用户', '/admin/user/*');
INSERT INTO `auth_item_child` VALUES ('调试', '/debug/*');
INSERT INTO `auth_item_child` VALUES ('调试', '/gii/*');
INSERT INTO `auth_item_child` VALUES ('站长', '权限控制');
INSERT INTO `auth_item_child` VALUES ('站长', '管理用户');
INSERT INTO `auth_item_child` VALUES ('调试员', '管理用户');
INSERT INTO `auth_item_child` VALUES ('站长', '调试');
INSERT INTO `auth_item_child` VALUES ('调试员', '调试');

-- ----------------------------
-- Table structure for `auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('修改用户', 0x4F3A32373A226261636B656E645C636F6D706F6E656E74735C5573657252756C65223A333A7B733A343A226E616D65223B733A31323A22E4BFAEE694B9E794A8E688B7223B733A393A22637265617465644174223B693A313533373637343337303B733A393A22757064617465644174223B693A313533373637343337303B7D, '1537674370', '1537674370');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '权限控制', null, null, null, '{\"icon\":\"fa fa-lock\",\"visible\":true}');
INSERT INTO `menu` VALUES ('2', '路由', '1', '/admin/route/index', '1', '{\"icon\":\"fa fa-circle-o\",\"visible\":true}');
INSERT INTO `menu` VALUES ('3', '权限', '1', '/admin/permission/index', '2', null);
INSERT INTO `menu` VALUES ('4', '角色', '1', '/admin/role/index', '3', null);
INSERT INTO `menu` VALUES ('5', '分配', '1', '/admin/assignment/index', '4', null);
INSERT INTO `menu` VALUES ('6', '菜单', '1', '/admin/menu/index', '5', null);
INSERT INTO `menu` VALUES ('8', '调试', null, null, '2', '{\"icon\":\"fa fa-wrench\",\"visible\":true}');
INSERT INTO `menu` VALUES ('9', 'gii', '8', '/gii/default/index', '1', null);
INSERT INTO `menu` VALUES ('10', 'debug', '8', '/debug/default/index', '2', null);
INSERT INTO `menu` VALUES ('11', '规则', '1', '/admin/rule/index', '6', null);
INSERT INTO `menu` VALUES ('12', '管理用户', null, '/admin/user/index', '3', null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL COMMENT '自动登录key',
  `password_hash` varchar(255) NOT NULL COMMENT '加密密码',
  `password_reset_token` varchar(255) DEFAULT NULL COMMENT '重置密码token',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `role` smallint(6) NOT NULL DEFAULT '10' COMMENT '角色等级',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '状态',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '_opy-qIMKzmcOSU6__XFb_LdTwoKowUH', '$2y$13$t.t3V7WvVJo35uHWmTH5mOiKBMFVnGq4.qURu22vCXgwnpZQ3xn36', null, 'admin@qq.com', '10', '10', '1537610152', '1537610152');
INSERT INTO `user` VALUES ('2', 'user123', 'sNmXZL_fXXYDWjfisgmH4TtgOGsBX0Tf', '$2y$13$9ntm0d/W8eqZdtI/gyj2DuUMJw5vdB0ZEgmAT8Cn95Qb2xy8CRoiq', null, 'user123@qq.com', '10', '10', '1537671838', '1537671838');
