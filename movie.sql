/*
Navicat MySQL Data Transfer

Source Server         : chen
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : movie

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-05-10 21:41:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `is_super` smallint(6) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `role_id` (`role_id`),
  KEY `ix_admin_addtime` (`addtime`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('2', 'chen', 'pbkdf2:sha256:50000$XYzDp6D0$619607e05ed85a4a8115a3eeba154da1b0ec84cd1c4488934c7e239578c067df', '0', '1', '2018-01-26 22:30:00');
INSERT INTO `admin` VALUES ('3', 'chen1', 'pbkdf2:sha256:50000$c41gdXsd$66e826bf5c84df04a3466b41e9eff15f12de322da8ba8244aba3e1ec181a3488', '1', '5', '2018-05-10 11:42:14');
INSERT INTO `admin` VALUES ('4', 'chen2', 'pbkdf2:sha256:50000$3oCwOHtc$92fc9188a6cf16c02f82bf3079aef6e483efe78cb0ea5eb61a2b14551ef340d0', '1', '2', '2018-05-10 11:53:52');

-- ----------------------------
-- Table structure for `adminlog`
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_adminlog_addtime` (`addtime`),
  CONSTRAINT `adminlog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminlog
-- ----------------------------
INSERT INTO `adminlog` VALUES ('1', '2', '127.0.0.1', '2018-02-07 11:51:59');
INSERT INTO `adminlog` VALUES ('2', '2', '127.0.0.1', '2018-02-07 14:34:38');
INSERT INTO `adminlog` VALUES ('3', '2', '127.0.0.1', '2018-02-07 14:49:11');
INSERT INTO `adminlog` VALUES ('4', '2', '127.0.0.1', '2018-02-08 09:58:00');
INSERT INTO `adminlog` VALUES ('5', '2', '127.0.0.1', '2018-02-08 10:06:22');
INSERT INTO `adminlog` VALUES ('6', '2', '127.0.0.1', '2018-02-24 13:01:58');
INSERT INTO `adminlog` VALUES ('7', '2', '127.0.0.1', '2018-03-01 15:05:41');
INSERT INTO `adminlog` VALUES ('8', '2', '127.0.0.1', '2018-03-01 16:32:22');
INSERT INTO `adminlog` VALUES ('9', '2', '127.0.0.1', '2018-05-07 18:05:46');
INSERT INTO `adminlog` VALUES ('10', '2', '127.0.0.1', '2018-05-09 14:13:55');
INSERT INTO `adminlog` VALUES ('11', '2', '127.0.0.1', '2018-05-10 10:35:42');
INSERT INTO `adminlog` VALUES ('12', '2', '127.0.0.1', '2018-05-10 10:35:59');
INSERT INTO `adminlog` VALUES ('13', '2', '127.0.0.1', '2018-05-10 10:36:33');
INSERT INTO `adminlog` VALUES ('14', '2', '127.0.0.1', '2018-05-10 10:36:54');
INSERT INTO `adminlog` VALUES ('15', '2', '127.0.0.1', '2018-05-10 11:52:08');
INSERT INTO `adminlog` VALUES ('16', '3', '127.0.0.1', '2018-05-10 11:52:43');
INSERT INTO `adminlog` VALUES ('17', '4', '127.0.0.1', '2018-05-10 11:54:23');
INSERT INTO `adminlog` VALUES ('18', '2', '127.0.0.1', '2018-05-10 11:56:46');
INSERT INTO `adminlog` VALUES ('19', '3', '127.0.0.1', '2018-05-10 12:07:55');
INSERT INTO `adminlog` VALUES ('20', '4', '127.0.0.1', '2018-05-10 12:08:08');
INSERT INTO `adminlog` VALUES ('21', '2', '127.0.0.1', '2018-05-10 12:08:20');
INSERT INTO `adminlog` VALUES ('22', '2', '127.0.0.1', '2018-05-10 15:41:11');

-- ----------------------------
-- Table structure for `auth`
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `url` (`url`),
  KEY `ix_auth_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth
-- ----------------------------
INSERT INTO `auth` VALUES ('1', '添加标签', '/admin/tag/add/', '2018-01-29 17:05:14');
INSERT INTO `auth` VALUES ('2', '标签列表', '/admin/tag/list/<int:page>/', '2018-01-29 17:06:03');
INSERT INTO `auth` VALUES ('3', '删除标签', '/admin/tag/del/<int:id>/', '2018-01-29 17:06:34');
INSERT INTO `auth` VALUES ('4', '标签编辑', '/admin/tag/edit/<int:id>/', '2018-01-29 17:06:51');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_comment_addtime` (`addtime`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('8', '<p>很好看<br/></p>', '21', '8', '2018-02-08 15:10:33');
INSERT INTO `comment` VALUES ('9', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/></p>', '21', '8', '2018-02-08 15:11:43');
INSERT INTO `comment` VALUES ('10', '<p>还不错</p>', '21', '8', '2018-02-08 15:16:11');
INSERT INTO `comment` VALUES ('11', '<p>还是挺不错的嘛!</p>', '21', '9', '2018-02-08 15:22:53');
INSERT INTO `comment` VALUES ('14', '<p>很好玩</p>', '23', '8', '2018-05-10 18:54:13');
INSERT INTO `comment` VALUES ('15', '<p>非常好看</p>', '21', '8', '2018-05-10 19:28:26');
INSERT INTO `comment` VALUES ('16', '<p>好看哇</p>', '21', '8', '2018-05-10 19:52:29');

-- ----------------------------
-- Table structure for `movie`
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `info` text,
  `logo` varchar(255) DEFAULT NULL,
  `star` smallint(6) DEFAULT NULL,
  `playnum` bigint(20) DEFAULT NULL,
  `commentnum` bigint(20) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `release_time` date DEFAULT NULL,
  `length` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `logo` (`logo`),
  KEY `tag_id` (`tag_id`),
  KEY `ix_movie_addtime` (`addtime`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('21', '英雄本色2018', '201803011635263b7931e3760a4aa5bc440992dec15f1a.mp4', '英雄本色2018\r\n精彩无限!', '20180208100155355dae8d75cf4019877587835d8f685b.jpg', '5', '73', '10', '36', '香港', '2018-02-04', '150', '2018-02-08 10:01:55');
INSERT INTO `movie` VALUES ('22', '唐人街探案2', '20180301163514defef28ba4fa4ae589b0018cb02f6769.mp4', '唐人街探案2,爆笑来袭!', '201802081007330e2357fe2c904b1db4275a8a7ccb3aa4.jpg', '5', '7', '0', '34', '中国', '2018-02-16', '130', '2018-02-08 10:07:33');
INSERT INTO `movie` VALUES ('23', '熊出没之变形记', '20180301163500faff9b0460fe4b12af5a2849787799e7.mp4', '好看,过瘾!', '20180208100903b673604c1d144190850eedaac27c7380.jpg', '4', '9', '1', '39', '中国', '2018-02-15', '120', '2018-02-08 10:09:04');
INSERT INTO `movie` VALUES ('24', '南极之恋', '201803011634310d9677af4c8043b19e05af5ce4d12573.mp4', '恋爱!', '20180208100955d4cbafbd99fd4af19503cbf541f02245.jpg', '5', '11', '0', '34', '韩国', '2018-02-17', '140', '2018-02-08 10:09:55');
INSERT INTO `movie` VALUES ('25', '马戏之王', '201803011634201aabbc3874854c84b361597197340a4c.mp4', '马戏团来临!', '20180208101049ef0f9144c94c4f1f8458efa4e7c6ac6d.jpg', '4', '4', '0', '34', '英国', '2018-02-21', '180', '2018-02-08 10:10:49');
INSERT INTO `movie` VALUES ('26', '第七子降魔之战', '20180301163407cd5653425e11482fabaab4e151c844e2.mp4', '第七子降魔之战', '201802081012101991317dd4b9425c8f87028e3e2abbf1.jpg', '4', '2', '0', '36', '美国', '2018-02-16', '140', '2018-02-08 10:12:11');
INSERT INTO `movie` VALUES ('27', '泡芙小姐', '20180301163357431a1dfda19f4ad798c787784c88e4e5.mp4', '小姐你好!', '20180208101501162898ccd77a4886a0cab2a2a79575bb.jpg', '5', '3', '0', '39', '中国', '2018-02-17', '120', '2018-02-08 10:15:01');
INSERT INTO `movie` VALUES ('28', '碟中谍', '201803011633450ea7724002b24c6a8392881aab546eee.mp4', '激情!', '201802081015350383b10e14bf43d2a972abff623f8518.jpg', '4', '2', '0', '36', '美国', '2018-02-28', '130', '2018-02-08 10:15:36');
INSERT INTO `movie` VALUES ('29', '摩天营救', '2018030116333298dc5dd1fc23461a81b443198660895b.mp4', '惊险刺激!', '201802081016301874efdf8cd447f299aa418230ccf83a.jpg', '5', '1', '0', '36', '美国', '2018-02-02', '120', '2018-02-08 10:16:30');
INSERT INTO `movie` VALUES ('30', '蚁人2', '201803011633206993d8df4b1c456685b1ce28f462e8c5.mp4', '蚂蚁!', '20180208101721c43b56abc9224b358e375a857dbda02b.jpg', '5', '1', '0', '39', '美国', '2018-02-08', '140', '2018-02-08 10:17:21');
INSERT INTO `movie` VALUES ('31', '重返20岁', '201803011636003ff7b620296840af84a1c5a5bd61c8bf.mp4', '年轻!', '201802081018131e53c59115b047fd8014f0f59e94136a.jpg', '5', '6', '0', '38', '台湾', '2018-02-09', '130', '2018-02-08 10:18:14');
INSERT INTO `movie` VALUES ('32', '勇敢者游戏', '2018030116330898907b1d8fa74cfe96a8a4fdefdb41bb.mp4', '勇敢的心', '2018020810192276b2357bd41a49059895f9db290e1cf3.jpg', '5', '1', '0', '36', '美国', '2018-02-11', '150', '2018-02-08 10:19:23');
INSERT INTO `movie` VALUES ('33', '祖宗十九代', '2018030116324811df6acacf0b4198898a847c3493fbc3.mp4', '十九代', '20180208102523a810daedbcf046aa91a15c3d12e060c0', '5', '4', '0', '34', '中国', '2018-02-14', '130', '2018-02-08 10:25:24');

-- ----------------------------
-- Table structure for `moviecol`
-- ----------------------------
DROP TABLE IF EXISTS `moviecol`;
CREATE TABLE `moviecol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_moviecol_addtime` (`addtime`),
  CONSTRAINT `moviecol_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `moviecol_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of moviecol
-- ----------------------------
INSERT INTO `moviecol` VALUES ('6', '23', '8', '2018-05-10 18:54:18');
INSERT INTO `moviecol` VALUES ('7', '31', '8', '2018-05-10 20:02:20');
INSERT INTO `moviecol` VALUES ('8', '22', '8', '2018-05-10 20:03:21');
INSERT INTO `moviecol` VALUES ('11', '21', '8', '2018-05-10 20:25:38');
INSERT INTO `moviecol` VALUES ('12', '21', null, '2018-05-10 20:44:52');

-- ----------------------------
-- Table structure for `oplog`
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `reason` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_oplog_addtime` (`addtime`),
  CONSTRAINT `oplog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oplog
-- ----------------------------
INSERT INTO `oplog` VALUES ('1', '2', '127.0.0.1', '添加标签纪录片', '2018-02-07 11:49:19');
INSERT INTO `oplog` VALUES ('2', '2', '127.0.0.1', '修改标签纪录片为探险', '2018-02-07 11:50:01');
INSERT INTO `oplog` VALUES ('3', '2', '127.0.0.1', '删除标签探险', '2018-02-07 11:50:15');
INSERT INTO `oplog` VALUES ('4', '2', '127.0.0.1', '添加标签动画', '2018-03-01 15:13:25');
INSERT INTO `oplog` VALUES ('5', '2', '127.0.0.1', '添加标签冒险', '2018-03-01 15:13:36');
INSERT INTO `oplog` VALUES ('6', '2', '127.0.0.1', '添加标签惊悚', '2018-03-01 15:13:51');
INSERT INTO `oplog` VALUES ('7', '2', '127.0.0.1', '添加标签科幻', '2018-03-01 15:14:14');
INSERT INTO `oplog` VALUES ('8', '2', '127.0.0.1', '添加标签犯罪', '2018-03-01 15:14:20');
INSERT INTO `oplog` VALUES ('9', '2', '127.0.0.1', '添加标签纪录片', '2018-03-01 15:14:32');
INSERT INTO `oplog` VALUES ('10', '2', '127.0.0.1', '添加标签运动', '2018-05-10 10:37:16');
INSERT INTO `oplog` VALUES ('11', '2', '127.0.0.1', '删除标签运动', '2018-05-10 10:37:20');
INSERT INTO `oplog` VALUES ('12', '2', '127.0.0.1', '添加标签体育', '2018-05-10 10:37:30');
INSERT INTO `oplog` VALUES ('13', '2', '127.0.0.1', '修改标签体育为游戏', '2018-05-10 10:37:42');

-- ----------------------------
-- Table structure for `preview`
-- ----------------------------
DROP TABLE IF EXISTS `preview`;
CREATE TABLE `preview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `logo` (`logo`),
  KEY `ix_preview_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of preview
-- ----------------------------
INSERT INTO `preview` VALUES ('1', '马戏之王', '2018030117034308b4b05abab043cb9c9222dedc27c868.jpg', '2018-03-01 16:56:53');
INSERT INTO `preview` VALUES ('2', '南极之恋', '20180301170357ef3cbaa3fa1244f5b3a08c65d1b33539.jpg', '2018-03-01 16:57:12');
INSERT INTO `preview` VALUES ('3', '唐人街探案2', '20180301170547cb102b0b845c4c0ea166355aef91bff0.jpg', '2018-03-01 16:57:28');
INSERT INTO `preview` VALUES ('4', '第七子', '20180301170420997dcf3d214b48db856ef285480b7ecd.jpg', '2018-03-01 16:57:47');
INSERT INTO `preview` VALUES ('5', '泡芙小姐', '20180301170145329c64acd00e40c8b29b8df5ec09e4a6.jpg', '2018-03-01 16:59:33');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `auths` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_role_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '', '2018-01-23 23:26:26');
INSERT INTO `role` VALUES ('2', '标签管理员1', '1,2,3,4', '2018-01-29 17:54:07');
INSERT INTO `role` VALUES ('5', '标签管理员2', '1,3', '2018-01-29 18:05:09');
INSERT INTO `role` VALUES ('7', '标签管理员3', '1', '2018-02-07 12:28:17');

-- ----------------------------
-- Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_tag_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('34', '喜剧', '2018-02-06 16:27:27');
INSERT INTO `tag` VALUES ('36', '动作', '2018-02-06 16:27:39');
INSERT INTO `tag` VALUES ('38', '爱情', '2018-02-06 17:13:31');
INSERT INTO `tag` VALUES ('39', '剧情', '2018-02-06 17:13:35');
INSERT INTO `tag` VALUES ('40', '动画', '2018-03-01 15:13:24');
INSERT INTO `tag` VALUES ('41', '冒险', '2018-03-01 15:13:35');
INSERT INTO `tag` VALUES ('42', '惊悚', '2018-03-01 15:13:50');
INSERT INTO `tag` VALUES ('43', '科幻', '2018-03-01 15:14:13');
INSERT INTO `tag` VALUES ('44', '犯罪', '2018-03-01 15:14:19');
INSERT INTO `tag` VALUES ('45', '纪录片', '2018-03-01 15:14:32');
INSERT INTO `tag` VALUES ('47', '游戏', '2018-05-10 10:37:29');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `info` text,
  `face` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `face` (`face`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `ix_user_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('8', 'test', 'pbkdf2:sha256:50000$us6Pqo4o$af3c25f6a9281f76645ddcf38ae8ad47bf052e13da1ce6b8620b45616619ab89', 'test@test.com', '13645678977', '天真的我哈', '2018020815315079861601eb69449d84f56a0d3aa0dc6c.png', '2018-02-07 17:09:27', '4d7fe99cee32456293b47cd4ef16af35');
INSERT INTO `user` VALUES ('9', 'test1', 'pbkdf2:sha256:50000$UzfGnzs4$d5fbd2e18aa89f5756298e360571b09839f96400ec5ac23de793c286a6ce41a1', 'test1@1.com', '13645678921', '喜欢电影的我!', '201802081522042d43eb44ab97429296c50b9e1dc5bcde.png', '2018-02-08 15:21:19', '6aabcd79d0bd4925a088a8d437a5e255');
INSERT INTO `user` VALUES ('10', 'test2', 'pbkdf2:sha256:50000$BrXOaRUd$6a736c41421fd9479410f00604627c9663f01060ed2d5802857843eb92dfe0b1', 'test2@2.com', '13645678925', '天天看电影,!天天开心', '2018020815295394800c77f98c4f49b715c2628a51f06d.png', '2018-02-08 15:24:07', '80286a984538420b88d97e0080ce7c8f');

-- ----------------------------
-- Table structure for `userlog`
-- ----------------------------
DROP TABLE IF EXISTS `userlog`;
CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ix_userlog_addtime` (`addtime`),
  CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlog
-- ----------------------------
INSERT INTO `userlog` VALUES ('1', null, '127.0.0.1', '2018-02-07 11:54:33');
INSERT INTO `userlog` VALUES ('2', '8', '127.0.0.1', '2018-02-07 17:09:38');
INSERT INTO `userlog` VALUES ('3', '8', '127.0.0.1', '2018-02-07 17:47:48');
INSERT INTO `userlog` VALUES ('4', '8', '127.0.0.1', '2018-02-07 20:11:03');
INSERT INTO `userlog` VALUES ('5', '8', '127.0.0.1', '2018-02-08 09:58:10');
INSERT INTO `userlog` VALUES ('6', '8', '127.0.0.1', '2018-02-08 10:00:20');
INSERT INTO `userlog` VALUES ('7', '8', '127.0.0.1', '2018-02-08 10:05:39');
INSERT INTO `userlog` VALUES ('8', '8', '127.0.0.1', '2018-02-08 14:17:18');
INSERT INTO `userlog` VALUES ('9', '9', '127.0.0.1', '2018-02-08 15:21:24');
INSERT INTO `userlog` VALUES ('10', '8', '127.0.0.1', '2018-02-08 15:23:19');
INSERT INTO `userlog` VALUES ('11', '10', '127.0.0.1', '2018-02-08 15:24:22');
INSERT INTO `userlog` VALUES ('12', null, '127.0.0.1', '2018-02-08 15:30:39');
INSERT INTO `userlog` VALUES ('13', '8', '127.0.0.1', '2018-02-08 15:31:44');
INSERT INTO `userlog` VALUES ('14', null, '127.0.0.1', '2018-02-08 15:46:10');
INSERT INTO `userlog` VALUES ('15', '8', '127.0.0.1', '2018-03-01 13:19:13');
INSERT INTO `userlog` VALUES ('16', '8', '127.0.0.1', '2018-03-01 15:04:40');
INSERT INTO `userlog` VALUES ('17', '8', '127.0.0.1', '2018-03-01 17:10:30');
INSERT INTO `userlog` VALUES ('18', '8', '127.0.0.1', '2018-05-07 15:33:15');
INSERT INTO `userlog` VALUES ('19', '8', '127.0.0.1', '2018-05-07 18:04:06');
INSERT INTO `userlog` VALUES ('20', '8', '127.0.0.1', '2018-05-07 18:04:16');
INSERT INTO `userlog` VALUES ('21', null, '127.0.0.1', '2018-05-10 15:16:52');
INSERT INTO `userlog` VALUES ('22', null, '127.0.0.1', '2018-05-10 15:54:15');
INSERT INTO `userlog` VALUES ('23', '8', '127.0.0.1', '2018-05-10 15:55:34');
INSERT INTO `userlog` VALUES ('24', '8', '127.0.0.1', '2018-05-10 19:29:37');
INSERT INTO `userlog` VALUES ('25', null, '127.0.0.1', '2018-05-10 20:44:22');
INSERT INTO `userlog` VALUES ('26', '8', '127.0.0.1', '2018-05-10 20:52:45');
