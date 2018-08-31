/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : testdjango

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-08-31 17:39:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 用户信息', '6', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 用户信息', '6', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 用户信息', '6', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 轮播图', '7', 'add_banner');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 轮播图', '7', 'change_banner');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 轮播图', '7', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 邮箱验证码', '8', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 邮箱验证码', '8', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 邮箱验证码', '8', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 视频', '9', 'add_video');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 视频', '9', 'change_video');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 视频', '9', 'delete_video');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 课程', '10', 'add_course');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 课程', '10', 'change_course');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 课程', '10', 'delete_course');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 章节', '11', 'add_lesson');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 章节', '11', 'change_lesson');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 章节', '11', 'delete_lesson');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 课程资源', '12', 'add_coursesresource');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 课程资源', '12', 'change_coursesresource');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 课程资源', '12', 'delete_coursesresource');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 城市', '13', 'add_citydict');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 城市', '13', 'change_citydict');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 城市', '13', 'delete_citydict');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 课程机构', '14', 'add_courseorg');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 课程机构', '14', 'change_courseorg');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 课程机构', '14', 'delete_courseorg');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 教师', '15', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 教师', '15', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 教师', '15', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 用户咨询', '16', 'add_userask');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 用户咨询', '16', 'change_userask');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 用户咨询', '16', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 课程评论', '17', 'add_coursecomments');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 课程评论', '17', 'change_coursecomments');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 课程评论', '17', 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 用户课程', '18', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 用户课程', '18', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 用户课程', '18', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 用户收藏', '19', 'add_userfavorite');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 用户收藏', '19', 'change_userfavorite');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 用户收藏', '19', 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES ('58', 'Can add 用户消息', '20', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('59', 'Can change 用户消息', '20', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete 用户消息', '20', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('61', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('62', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('63', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('64', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('65', 'Can view 课程', '10', 'view_course');
INSERT INTO `auth_permission` VALUES ('66', 'Can view 课程资源', '12', 'view_coursesresource');
INSERT INTO `auth_permission` VALUES ('67', 'Can view 章节', '11', 'view_lesson');
INSERT INTO `auth_permission` VALUES ('68', 'Can view 视频', '9', 'view_video');
INSERT INTO `auth_permission` VALUES ('69', 'Can view 课程评论', '17', 'view_coursecomments');
INSERT INTO `auth_permission` VALUES ('70', 'Can view 用户咨询', '16', 'view_userask');
INSERT INTO `auth_permission` VALUES ('71', 'Can view 用户课程', '18', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 用户收藏', '19', 'view_userfavorite');
INSERT INTO `auth_permission` VALUES ('73', 'Can view 用户消息', '20', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('74', 'Can view 城市', '13', 'view_citydict');
INSERT INTO `auth_permission` VALUES ('75', 'Can view 课程机构', '14', 'view_courseorg');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 教师', '15', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('77', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('78', 'Can view 轮播图', '7', 'view_banner');
INSERT INTO `auth_permission` VALUES ('79', 'Can view 邮箱验证码', '8', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('80', 'Can view 用户信息', '6', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('81', 'Can add Bookmark', '21', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('82', 'Can change Bookmark', '21', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete Bookmark', '21', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('84', 'Can add User Setting', '22', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('85', 'Can change User Setting', '22', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('86', 'Can delete User Setting', '22', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('87', 'Can add User Widget', '23', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('88', 'Can change User Widget', '23', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('89', 'Can delete User Widget', '23', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('90', 'Can add log entry', '24', 'add_log');
INSERT INTO `auth_permission` VALUES ('91', 'Can change log entry', '24', 'change_log');
INSERT INTO `auth_permission` VALUES ('92', 'Can delete log entry', '24', 'delete_log');
INSERT INTO `auth_permission` VALUES ('93', 'Can view Bookmark', '21', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('94', 'Can view log entry', '24', 'view_log');
INSERT INTO `auth_permission` VALUES ('95', 'Can view User Setting', '22', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('96', 'Can view User Widget', '23', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('97', 'Can add captcha store', '25', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('98', 'Can change captcha store', '25', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete captcha store', '25', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('100', 'Can view captcha store', '25', 'view_captchastore');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES ('85', 'EXMW', 'exmw', '13530bffec6e1b8f1d8c48dac59c0062bffbbc9c', '2018-08-30 14:34:14');
INSERT INTO `captcha_captchastore` VALUES ('86', 'VGBR', 'vgbr', '9d4bafab0c63b6a199833632b7275b637bf053a6', '2018-08-30 14:34:29');

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(10) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_course_org_id_4d2c4aab_fk_organizat` (`course_org_id`),
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES ('1', 'django入门', '这是一篇测试文章，用于测试', '这是一篇测试文章，用于测试', 'cj', '0', '0', '0', 'courses/2018/08/b.png', '0', '2018-08-29 10:46:00', '2');

-- ----------------------------
-- Table structure for courses_coursesresource
-- ----------------------------
DROP TABLE IF EXISTS `courses_coursesresource`;
CREATE TABLE `courses_coursesresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_coursesresource_lesson_id_95fb6e85_fk_courses_course_id` (`lesson_id`),
  CONSTRAINT `courses_coursesresource_lesson_id_95fb6e85_fk_courses_course_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_coursesresource
-- ----------------------------

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES ('1', '第一节', '2018-08-29 10:48:00', '1');

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_video
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('25', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('10', 'courses', 'course');
INSERT INTO `django_content_type` VALUES ('12', 'courses', 'coursesresource');
INSERT INTO `django_content_type` VALUES ('11', 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES ('9', 'courses', 'video');
INSERT INTO `django_content_type` VALUES ('17', 'operations', 'coursecomments');
INSERT INTO `django_content_type` VALUES ('16', 'operations', 'userask');
INSERT INTO `django_content_type` VALUES ('18', 'operations', 'usercourse');
INSERT INTO `django_content_type` VALUES ('19', 'operations', 'userfavorite');
INSERT INTO `django_content_type` VALUES ('20', 'operations', 'usermessage');
INSERT INTO `django_content_type` VALUES ('13', 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES ('14', 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES ('15', 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'banner');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('21', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('24', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-08-27 03:36:10');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-08-27 03:36:11');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-08-27 03:36:12');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-08-27 03:36:12');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-08-27 03:36:12');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-08-27 03:36:12');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-08-27 03:36:12');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-08-27 03:36:12');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-08-27 03:36:12');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2018-08-27 03:36:12');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2018-08-27 03:36:13');
INSERT INTO `django_migrations` VALUES ('12', 'users', '0001_initial', '2018-08-27 03:36:14');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0001_initial', '2018-08-27 03:36:15');
INSERT INTO `django_migrations` VALUES ('14', 'admin', '0002_logentry_remove_auto_add', '2018-08-27 03:36:15');
INSERT INTO `django_migrations` VALUES ('15', 'sessions', '0001_initial', '2018-08-27 03:36:15');
INSERT INTO `django_migrations` VALUES ('16', 'courses', '0001_initial', '2018-08-27 07:22:12');
INSERT INTO `django_migrations` VALUES ('17', 'operations', '0001_initial', '2018-08-27 07:22:13');
INSERT INTO `django_migrations` VALUES ('18', 'organization', '0001_initial', '2018-08-27 07:22:14');
INSERT INTO `django_migrations` VALUES ('19', 'users', '0002_banner_emailverifyrecord', '2018-08-27 07:22:14');
INSERT INTO `django_migrations` VALUES ('20', 'users', '0003_auto_20180828_1656', '2018-08-28 16:56:52');
INSERT INTO `django_migrations` VALUES ('21', 'xadmin', '0001_initial', '2018-08-28 17:15:24');
INSERT INTO `django_migrations` VALUES ('22', 'xadmin', '0002_log', '2018-08-28 17:15:25');
INSERT INTO `django_migrations` VALUES ('23', 'xadmin', '0003_auto_20160715_0100', '2018-08-28 17:15:25');
INSERT INTO `django_migrations` VALUES ('24', 'courses', '0002_auto_20180829_1145', '2018-08-29 11:45:59');
INSERT INTO `django_migrations` VALUES ('25', 'users', '0004_auto_20180829_1145', '2018-08-29 11:45:59');
INSERT INTO `django_migrations` VALUES ('26', 'captcha', '0001_initial', '2018-08-29 17:10:20');
INSERT INTO `django_migrations` VALUES ('27', 'organization', '0002_auto_20180831_0944', '2018-08-31 09:44:29');
INSERT INTO `django_migrations` VALUES ('28', 'users', '0005_auto_20180831_0944', '2018-08-31 09:44:29');
INSERT INTO `django_migrations` VALUES ('29', 'organization', '0003_courseorg_catgory', '2018-08-31 09:52:03');
INSERT INTO `django_migrations` VALUES ('30', 'organization', '0004_auto_20180831_1130', '2018-08-31 11:30:57');
INSERT INTO `django_migrations` VALUES ('31', 'courses', '0003_course_course_org', '2018-08-31 16:19:04');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('l14swdecs4mrxtqft9vnc17ljbk3gpq1', 'YjA1ZTM2NzM3YWVjMTcwMjhiOGZiYjc0NTk0OGNlNjQzNGUzYmIxNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjkwNGU0ODc4MWM0MTgyYWQxMTFjYThmMjc1ZTYyODY4NDE5OTU1Y2QiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==', '2018-09-14 17:35:57');

-- ----------------------------
-- Table structure for operations_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operations_coursecomments`;
CREATE TABLE `operations_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_coursecom_course_id_de0f98da_fk_courses_c` (`course_id`),
  KEY `operations_coursecom_user_id_84597521_fk_users_use` (`user_id`),
  CONSTRAINT `operations_coursecom_user_id_84597521_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operations_coursecom_course_id_de0f98da_fk_courses_c` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_coursecomments
-- ----------------------------

-- ----------------------------
-- Table structure for operations_userask
-- ----------------------------
DROP TABLE IF EXISTS `operations_userask`;
CREATE TABLE `operations_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_userask
-- ----------------------------
INSERT INTO `operations_userask` VALUES ('1', 'django', '1838153236', '测试', '2018-08-31 15:08:02');
INSERT INTO `operations_userask` VALUES ('2', 'django', '1838153236', '测试', '2018-08-31 15:08:11');
INSERT INTO `operations_userask` VALUES ('3', '晓晓', '1838153236', 'django', '2018-08-31 15:09:17');

-- ----------------------------
-- Table structure for operations_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operations_usercourse`;
CREATE TABLE `operations_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_usercourse_course_id_a9f30cc6_fk_courses_course_id` (`course_id`),
  KEY `operations_usercourse_user_id_d33454be_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operations_usercourse_user_id_d33454be_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operations_usercourse_course_id_a9f30cc6_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_usercourse
-- ----------------------------

-- ----------------------------
-- Table structure for operations_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operations_userfavorite`;
CREATE TABLE `operations_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fay_type` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_userfavorite_user_id_092d3821_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operations_userfavorite_user_id_092d3821_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_userfavorite
-- ----------------------------

-- ----------------------------
-- Table structure for operations_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operations_usermessage`;
CREATE TABLE `operations_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_usermessage
-- ----------------------------

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES ('1', '北京市', '北京市', '2018-08-31 09:38:00');
INSERT INTO `organization_citydict` VALUES ('2', '上海市', '上海市', '2018-08-31 09:38:00');
INSERT INTO `organization_citydict` VALUES ('3', '广州市', '广州市', '2018-08-31 09:38:00');
INSERT INTO `organization_citydict` VALUES ('4', '深圳市', '深圳市', '2018-08-31 09:38:00');
INSERT INTO `organization_citydict` VALUES ('5', '成都', '成都', '2018-08-31 09:39:00');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `address` varchar(1250) NOT NULL,
  `add_time` datetime NOT NULL,
  `city_id` int(11) NOT NULL,
  `catgory` varchar(24) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES ('1', '慕课网', '慕课网(IMOOC)是IT技能学习平台。慕课网(IMOOC)提供了丰富的移动端开发、php开发、web前端、android开发以及html5等视频教程资源公开课。并且富有交互性及趣味性,你...', '0', '0', 'org/2018/08/3.jpg', '北京市', '2018-08-31 09:43:00', '1', 'pxjg', '7', '0');
INSERT INTO `organization_courseorg` VALUES ('2', '晓晓', '这个一个关于冯金琪的个人博客,杂谈,技术论文,文章,冯金琪个人网站,python学习,前端学习,vue学习,react学习', '0', '0', 'org/2018/08/6666.png', '成都', '2018-08-31 09:46:00', '5', 'gx', '0', '1');
INSERT INTO `organization_courseorg` VALUES ('3', '极客', '极客学院作为中国专业IT职业在线教育平台,拥有海量高清IT职业课程,涵盖30+个技术领域,如Android,iOS ,Flash,Java,Python,HTML5,Swift,Cocos2dx等视频教程.根据IT在线...', '0', '0', 'org/2018/08/下载.png', '上海市', '2018-08-31 09:46:00', '2', 'pxjg', '0', '5');
INSERT INTO `organization_courseorg` VALUES ('4', '传智', '传智播客专注IT培训,Java培训,人工智能培训,Python培训,PHP培训,C++培训,大数据培训,UI设计培训,移动开发培训,网络营销培训,web前端培训,全栈工程师培训,产品经理...', '0', '0', 'org/2018/08/3_vtRU0WW.jpg', '广州', '2018-08-31 09:47:00', '3', 'gr', '9', '0');
INSERT INTO `organization_courseorg` VALUES ('5', '哈哈', '传智', '0', '0', 'org/2018/08/6666_kvLR0qi.png', '深圳', '2018-08-31 09:48:00', '4', 'pxjg', '0', '3');
INSERT INTO `organization_courseorg` VALUES ('6', '实验楼', '实验楼是国内领先的IT在线编程及在线实训学习平台,专业导师提供精选的实践项目,创新的技术使得学习者无需配置繁琐的本地环境,随时在线流畅使用。以就业为导向,提供...', '0', '0', 'org/2018/08/b.png', '成都', '2018-08-31 09:49:00', '5', 'pxjg', '0', '0');

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES ('1', '晓晓', '19', 'xx', 'xx', 'xx', '0', '0', '2018-08-31 16:14:00', '2');
INSERT INTO `organization_teacher` VALUES ('2', '465', '23', '324', '12', '34', '0', '0', '2018-08-31 16:14:00', '3');
INSERT INTO `organization_teacher` VALUES ('3', 'xx', '12', '43', '12', '34', '34', '0', '2018-08-31 16:15:00', '1');
INSERT INTO `organization_teacher` VALUES ('4', '3232', '12', '34', '43', '45', '0', '0', '2018-08-31 16:15:00', '6');

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_banner
-- ----------------------------

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(10) NOT NULL,
  `send_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES ('1', '1234', 'admin@qq.com', 'register', '2018-08-28 17:38:00');
INSERT INTO `users_emailverifyrecord` VALUES ('2', 'cNaFmmac2jdlITtX', '1218525402@qq.com', 'register', '2018-08-30 09:35:12');
INSERT INTO `users_emailverifyrecord` VALUES ('3', 'w0yY0e8YegqBIMbe', '1218525402@qq.com', 'register', '2018-08-30 09:39:50');
INSERT INTO `users_emailverifyrecord` VALUES ('4', 'xwJux8rySfstNrDc', '1218525402@qq.com', 'register', '2018-08-30 10:03:46');
INSERT INTO `users_emailverifyrecord` VALUES ('5', '9PpX2F7UJnUV6lOI', '1218525402@qq.com', 'register', '2018-08-30 10:07:30');
INSERT INTO `users_emailverifyrecord` VALUES ('6', 'NFm5fqyVQ8KQDw1f', '1218525402@qq.com', 'register', '2018-08-30 14:03:32');
INSERT INTO `users_emailverifyrecord` VALUES ('7', 'KEXlXk5YluFKwUD9', '1218525402@qq.com', 'forget', '2018-08-30 14:04:59');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$100000$iOTdnyHqAZjT$Aqb/o86MOOMQRoyPuqWddEoPeAZE+eU1JprdF5gjRP8=', '2018-08-31 09:38:02', '1', 'admin', '', '', 'admin@126.com', '1', '1', '2018-08-28 08:43:55', '', null, 'femal', '', null, 'image/defalut');
INSERT INTO `users_userprofile` VALUES ('5', 'pbkdf2_sha256$100000$zCwbZzhKsrui$XjAEGNnwPw9JEe89UVeZPTUFrz/hyiHqllQbd8jw9Hs=', '2018-08-30 14:46:01', '0', '1218525402@qq.com', '', '', '1218525402@qq.com', '0', '1', '2018-08-30 10:07:29', '', null, 'female', '', null, 'image/defalut');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-08-28 17:38:46', '127.0.0.1', '1', 'EmailVerifyRecord object (1)', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2018-08-29 10:47:30', '127.0.0.1', '1', 'Course object (1)', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2018-08-29 10:49:32', '127.0.0.1', '1', 'Lesson object (1)', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2018-08-29 11:46:47', '127.0.0.1', '1', 'django入门', 'change', '修改 image', '10', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2018-08-31 09:38:29', '127.0.0.1', '1', '北京市', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2018-08-31 09:38:44', '127.0.0.1', '2', '上海市', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2018-08-31 09:38:51', '127.0.0.1', '3', '广州市', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2018-08-31 09:39:00', '127.0.0.1', '4', '深圳市', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2018-08-31 09:39:09', '127.0.0.1', '5', '成都', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2018-08-31 09:43:39', '127.0.0.1', '1', '慕课网', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2018-08-31 09:44:47', '127.0.0.1', '1', '慕课网', 'change', '修改 image', '14', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2018-08-31 09:46:51', '127.0.0.1', '2', '晓晓', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2018-08-31 09:47:42', '127.0.0.1', '3', '极客', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2018-08-31 09:48:16', '127.0.0.1', '4', '传智', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2018-08-31 09:49:00', '127.0.0.1', '5', '哈哈', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2018-08-31 09:49:25', '127.0.0.1', '6', '实验楼', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2018-08-31 16:14:46', '127.0.0.1', '1', '晓晓', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2018-08-31 16:15:01', '127.0.0.1', '2', '465', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2018-08-31 16:15:13', '127.0.0.1', '3', 'xx', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2018-08-31 16:15:26', '127.0.0.1', '4', '3232', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2018-08-31 17:35:54', '127.0.0.1', '1', 'django入门', 'change', '修改 course_org 和 image', '10', '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
