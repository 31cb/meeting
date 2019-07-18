/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : meeting

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-07-01 13:58:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth`
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `pkid` int(11) NOT NULL AUTO_INCREMENT,
  `auth_id` int(11) DEFAULT NULL,
  `auth_name` varchar(32) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth
-- ----------------------------
INSERT INTO `auth` VALUES ('1', '1', '发布会议', null);
INSERT INTO `auth` VALUES ('2', '2', '查看部门所有会议', null);

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `pkid` int(11) NOT NULL AUTO_INCREMENT,
  `dept_num` varchar(32) DEFAULT NULL,
  `dept_name` varchar(32) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '001', '行政部', '行政');
INSERT INTO `dept` VALUES ('2', '002', '技术部', '技术');
INSERT INTO `dept` VALUES ('3', '003', '研发部', '研发');
INSERT INTO `dept` VALUES ('4', '004', '人事部', '人事');

-- ----------------------------
-- Table structure for `dict`
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `pkid` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) DEFAULT NULL,
  `key_name` varchar(32) DEFAULT NULL,
  `dict_type` varchar(32) DEFAULT NULL,
  `dict_type_name` varchar(32) DEFAULT NULL,
  `value` varchar(32) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('1', 'user_st_0', '未激活', 'user_st', '用户状态', '0', null);
INSERT INTO `dict` VALUES ('2', 'user_st_1', '已激活', 'user_st', '用户状态', '1', null);
INSERT INTO `dict` VALUES ('3', 'room_st_0', '空闲', 'room_st', '会议室状态', '0', null);
INSERT INTO `dict` VALUES ('4', 'room_st_1', '使用中', 'room_st', '会议室状态', '1', null);
INSERT INTO `dict` VALUES ('5', 'room_st_2', '已预约', 'room_st', '会议室状态', '2', null);
INSERT INTO `dict` VALUES ('6', 'auth_flag_0', '无', 'auth_flag', '权限管理标志', '0', null);
INSERT INTO `dict` VALUES ('7', 'auth_flag_1', '有', 'auth_flag', '权限管理标志', '1', null);
INSERT INTO `dict` VALUES ('8', 'meet_st_0', '未开始', 'meet_st', '会议状态', '0', null);
INSERT INTO `dict` VALUES ('9', 'meet_st_1', '已完成', 'meet_st', '会议状态', '1', null);
INSERT INTO `dict` VALUES ('10', 'meet_st_2', '已过期', 'meet_st', '会议状态', '2', null);
INSERT INTO `dict` VALUES ('11', 'msg_type_1', '留言', 'msg_type', '消息类型', '1', null);
INSERT INTO `dict` VALUES ('12', 'msg_type_2', '回复', 'msg_type', '消息类型', '2', null);
INSERT INTO `dict` VALUES ('13', 'msg_st_0', '未读', 'msg_st', '消息状态', '0', null);
INSERT INTO `dict` VALUES ('14', 'msg_1', '已读', 'msg_st', '消息状态', '1', null);

-- ----------------------------
-- Table structure for `dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `dict_type`;
CREATE TABLE `dict_type` (
  `pkid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `type_name` varchar(32) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict_type
-- ----------------------------
INSERT INTO `dict_type` VALUES ('1', 'user_st', '用户状态', '1：已激活 0：未激活');
INSERT INTO `dict_type` VALUES ('2', 'room_st', '会议室状态', '2：已预约 1：使用中 0：空闲');
INSERT INTO `dict_type` VALUES ('3', 'auth_flag', '权限管理标志', '1：可以管理权限 0：不能管理权限');
INSERT INTO `dict_type` VALUES ('4', 'meet_st', '会议状态', '0：未开始 1：已结束');
INSERT INTO `dict_type` VALUES ('5', 'msg_type', '消息类型', '1：回复消息 2：留言消息');
INSERT INTO `dict_type` VALUES ('6', 'msg_st', '消息状态', '0：未读 1：已读');

-- ----------------------------
-- Table structure for `meet`
-- ----------------------------
DROP TABLE IF EXISTS `meet`;
CREATE TABLE `meet` (
  `pkid` int(11) NOT NULL AUTO_INCREMENT,
  `meet_name` varchar(50) DEFAULT NULL,
  `meet_start_time` datetime DEFAULT NULL,
  `meet_end_time` datetime DEFAULT NULL,
  `creat_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `creat_user` int(11) DEFAULT NULL,
  `meet_theme` varchar(200) DEFAULT NULL,
  `meet_des` varchar(200) DEFAULT NULL COMMENT '会议描述信息',
  `meet_attach_path` varchar(200) DEFAULT NULL COMMENT '附件路径',
  `meet_st` varchar(2) DEFAULT NULL,
  `meet_room_id` int(11) DEFAULT NULL,
  `send_flag` varchar(2) DEFAULT '0',
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meet
-- ----------------------------
INSERT INTO `meet` VALUES ('1', '测试', '2019-05-19 15:00:00', '2019-05-19 16:00:00', '2019-05-19 14:23:45', '2019-05-19 14:23:45', '1', '系统测试', '测试测试测试', 'E:\\svnwork\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\meeting\\WEB-INF\\upload\\2019-05-19\\会议.txt', '2', '1', '0', '无');
INSERT INTO `meet` VALUES ('2', '会议', '2019-05-27 17:00:00', '2019-05-27 18:00:00', '2019-05-19 17:59:26', '2019-05-19 17:59:26', '1', '会议', '', 'E:\\svnwork\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\meeting\\WEB-INF\\upload\\2019-05-19\\会议.txt', '2', '2', '0', '');
INSERT INTO `meet` VALUES ('3', '测试1', '2019-05-20 18:00:00', '2019-05-20 20:00:00', '2019-05-19 18:00:33', '2019-05-19 18:00:33', '1', '测试1', '1', null, '1', '1', '0', '1');
INSERT INTO `meet` VALUES ('4', '讨论', '2019-05-22 09:00:00', '2019-05-22 11:00:00', '2019-05-19 18:03:50', '2019-05-19 18:03:50', '1', '讨论', '讨论', 'E:\\svnwork\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\meeting\\WEB-INF\\upload\\2019-05-19\\会议.txt', '2', '3', '0', '讨论');

-- ----------------------------
-- Table structure for `meet_room`
-- ----------------------------
DROP TABLE IF EXISTS `meet_room`;
CREATE TABLE `meet_room` (
  `pkid` int(11) NOT NULL AUTO_INCREMENT,
  `meet_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `meet_start_time` datetime DEFAULT NULL,
  `meet_end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meet_room
-- ----------------------------
INSERT INTO `meet_room` VALUES ('1', '1', '1', '2019-05-19 15:00:00', '2019-05-19 16:00:00');
INSERT INTO `meet_room` VALUES ('2', '2', '2', '2019-05-27 17:00:00', '2019-05-27 18:00:00');
INSERT INTO `meet_room` VALUES ('3', '3', '1', '2019-05-20 18:00:00', '2019-05-20 20:00:00');
INSERT INTO `meet_room` VALUES ('4', '4', '3', '2019-05-22 09:00:00', '2019-05-22 11:00:00');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `pkid` int(11) NOT NULL AUTO_INCREMENT,
  `meet_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `creat_time` datetime DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `st` varchar(2) DEFAULT NULL,
  `type` varchar(2) DEFAULT NULL,
  `reply_msg_id` int(11) DEFAULT NULL,
  `reply_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '2', '1', '2019-05-19 18:01:24', '参加会议', '1', '1', '0', '0');
INSERT INTO `message` VALUES ('2', '2', '1', '2019-05-19 18:01:36', '注意', '1', '2', '1', '1');
INSERT INTO `message` VALUES ('3', '4', '10', '2019-05-19 18:43:00', '参加会议', '1', '1', '0', '0');
INSERT INTO `message` VALUES ('4', '4', '1', '2019-05-19 18:57:58', '注意', '1', '2', '3', '10');
INSERT INTO `message` VALUES ('5', '4', '1', '2019-05-19 18:58:02', '1', '1', '1', '0', '0');
INSERT INTO `message` VALUES ('6', '4', '1', '2019-05-19 18:58:03', '2', '1', '1', '0', '0');
INSERT INTO `message` VALUES ('7', '4', '1', '2019-05-19 18:58:05', '3', '1', '1', '0', '0');
INSERT INTO `message` VALUES ('8', '4', '11', '2019-05-19 19:16:16', '好的', '1', '1', '0', '0');
INSERT INTO `message` VALUES ('9', '4', '11', '2019-05-19 19:16:24', '回复', '1', '1', '0', '0');
INSERT INTO `message` VALUES ('10', '4', '11', '2019-05-19 19:17:29', '回复留言', '1', '2', '7', '1');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `pkid` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '系统用户', '有系统管理权限');
INSERT INTO `role` VALUES ('2', '普通用户', '无系统管理权限');

-- ----------------------------
-- Table structure for `room`
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `pkid` int(11) NOT NULL AUTO_INCREMENT,
  `room_num` varchar(32) DEFAULT NULL,
  `room_name` varchar(32) DEFAULT NULL,
  `room_place` varchar(200) DEFAULT NULL,
  `room_st` varchar(2) DEFAULT NULL,
  `room_max_num` int(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', '001', '会议室一', '3楼202', '0', '5', '无');
INSERT INTO `room` VALUES ('2', '002', '会议室二', '4楼203', '0', '15', '无');
INSERT INTO `room` VALUES ('3', '003', '会议室三', '7栋506', '0', '10', 'test');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `pkid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `dept_num` varchar(32) DEFAULT NULL,
  `phone_num` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `auth_flag` varchar(2) DEFAULT NULL,
  `st` varchar(2) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '张三1', '001', '15111111112', '1600413420@qq.com', '1', '1', '1', '管理系统中用户角色的账户');
INSERT INTO `user` VALUES ('10', 'test1', '1111', '李四', '001', '15123456789', 'bo31bo@126.com', '2', '0', '1', '');
INSERT INTO `user` VALUES ('11', 'test2', '1111', '王五', '002', '18787653490', '1600413420@qq.com', '1', '0', '1', '');
INSERT INTO `user` VALUES ('12', 'test3', '1111', '赵六', '003', '13167824698', 'm18702557813@163.com', '2', '1', '1', '');
INSERT INTO `user` VALUES ('13', 'test4', '1111', '', '004', null, null, '1', '1', '0', '');

-- ----------------------------
-- Table structure for `user_auth`
-- ----------------------------
DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth` (
  `pkid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `auth_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_auth
-- ----------------------------
INSERT INTO `user_auth` VALUES ('1', '1', '1');
INSERT INTO `user_auth` VALUES ('2', '1', '2');
INSERT INTO `user_auth` VALUES ('3', '10', '1');
INSERT INTO `user_auth` VALUES ('4', '10', '2');
INSERT INTO `user_auth` VALUES ('5', '12', '1');

-- ----------------------------
-- Table structure for `user_meet`
-- ----------------------------
DROP TABLE IF EXISTS `user_meet`;
CREATE TABLE `user_meet` (
  `pkid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `meet_id` int(11) NOT NULL,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_meet
-- ----------------------------
INSERT INTO `user_meet` VALUES ('1', '10', '1');
INSERT INTO `user_meet` VALUES ('2', '11', '1');
INSERT INTO `user_meet` VALUES ('3', '1', '1');
INSERT INTO `user_meet` VALUES ('4', '1', '2');
INSERT INTO `user_meet` VALUES ('5', '12', '2');
INSERT INTO `user_meet` VALUES ('6', '10', '3');
INSERT INTO `user_meet` VALUES ('7', '11', '3');
INSERT INTO `user_meet` VALUES ('8', '1', '4');
INSERT INTO `user_meet` VALUES ('9', '10', '4');
INSERT INTO `user_meet` VALUES ('10', '11', '4');
INSERT INTO `user_meet` VALUES ('11', '12', '4');
