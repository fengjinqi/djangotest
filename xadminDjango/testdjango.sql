/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : testdjango

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-09-07 16:36:57
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
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES ('87', 'TKVQ', 'tkvq', 'ce99f8b199f9969c14b6bace156dc2cc6943c5f7', '2018-09-06 13:55:09');
INSERT INTO `captcha_captchastore` VALUES ('88', 'ZGJF', 'zgjf', '85fc3f21c6c3ab6fcbf488fdb31c3bd20d72aa3f', '2018-09-06 13:55:17');
INSERT INTO `captcha_captchastore` VALUES ('90', 'FFLM', 'fflm', '500c7593defcd87225b32a489463441563b235cd', '2018-09-06 14:15:17');
INSERT INTO `captcha_captchastore` VALUES ('91', 'NOJP', 'nojp', '2a427f28e5457e9c8f04ffa9c1f45ec6e5c733ae', '2018-09-07 09:36:17');
INSERT INTO `captcha_captchastore` VALUES ('92', 'XTGA', 'xtga', 'd58c8b0ba87cae139042a3380f59bc174cb93d42', '2018-09-07 09:36:24');
INSERT INTO `captcha_captchastore` VALUES ('93', 'XQQF', 'xqqf', '3367720e83f5d73a1e8bdc1e6461981e4d6e0b22', '2018-09-07 09:38:58');
INSERT INTO `captcha_captchastore` VALUES ('94', 'PTJJ', 'ptjj', 'fbfb9b2bcda0085e064036ead7af6c6f80fda1ee', '2018-09-07 11:43:28');
INSERT INTO `captcha_captchastore` VALUES ('95', 'NEVQ', 'nevq', '73e4f6295fdd2b58356cc6946effde3d01d7d17d', '2018-09-07 11:43:31');
INSERT INTO `captcha_captchastore` VALUES ('96', 'RYBV', 'rybv', '6ea52707b3c376db7cbe1c907d341c3b222cf615', '2018-09-07 11:43:54');

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
  `image` varchar(200) DEFAULT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `youneed_know` varchar(300) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_course_org_id_4d2c4aab_fk_organizat` (`course_org_id`),
  KEY `courses_course_teacher_id_846fa526_fk_organization_teacher_id` (`teacher_id`),
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES ('1', 'django入门', '这是一篇测试文章，用于测试', '这是一篇测试文章，用于测试', 'cj', '0', '0', '0', 'courses/2018/08/b.png', '4', '2018-08-29 10:46:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('2', 'python', 'python', 'python', 'zj', '100', '20', '10', 'courses/2018/09/1.jpg', '29', '2018-09-03 09:56:00', '1', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('3', 'test', 'test', 'test', 'cj', '100', '0', '0', 'courses/2018/09/QQ图片20170831104939.png', '1', '2018-09-03 16:20:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('4', '00', '00', '00', 'cj', '134', '0', '0', 'courses/2018/09/QQ图片20170831104939_NiilCKU.png', '1', '2018-09-03 16:21:00', '3', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('5', '76', '76', '76', 'cj', '54', '0', '0', 'courses/2018/09/1_5i5UHni.jpg', '0', '2018-09-03 16:21:00', '6', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('6', 'aiyi', 'aiyi', 'aiyi', 'zj', '65', '0', '0', 'courses/2018/09/QQ图片20170831104939_WSR8y2Q.png', '9', '2018-09-03 16:22:00', '3', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('8', 'django入门', '这是一篇测试文章，用于测试', '这是一篇测试文章，用于测试', 'cj', '0', '0', '0', 'courses/2018/08/b.png', '5', '2018-08-29 10:46:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('9', 'django入门', '这是一篇测试文章，用于测试', '这是一篇测试文章，用于测试', 'cj', '0', '0', '0', 'courses/2018/08/b.png', '0', '2018-08-29 10:46:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('10', 'django入门', '这是一篇测试文章，用于测试', '这是一篇测试文章，用于测试', 'cj', '0', '0', '0', 'courses/2018/08/b.png', '0', '2018-08-29 10:46:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('11', 'django入门', '这是一篇测试文章，用于测试', '这是一篇测试文章，用于测试', 'cj', '0', '0', '0', 'courses/2018/08/b.png', '0', '2018-08-29 10:46:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('12', 'django入门', '这是一篇测试文章，用于测试', '这是一篇测试文章，用于测试', 'cj', '0', '0', '0', 'courses/2018/08/b.png', '0', '2018-08-29 10:46:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('13', 'django入门', '这是一篇测试文章，用于测试', '这是一篇测试文章，用于测试', 'cj', '0', '0', '0', 'courses/2018/08/b.png', '0', '2018-08-29 10:46:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('14', 'django入门', '这是一篇测试文章，用于测试', '这是一篇测试文章，用于测试', 'cj', '0', '0', '0', 'courses/2018/08/b.png', '1', '2018-08-29 10:46:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('15', '测试', '测试', '这个一个关于冯金琪的个人博客,杂谈,技术论文,文章,冯金琪个人网站,python学习,前端学习,vue学习,react学习', 'zj', '120', '78', '1', 'courses/2018/09/1_pfH4TlH.jpg', '22', '2018-09-03 16:22:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('16', '测试', '测试', '这个一个关于冯金琪的个人博客,杂谈,技术论文,文章,冯金琪个人网站,python学习,前端学习,vue学习,react学习', 'zj', '120', '0', '0', 'courses/2018/09/1_TpxG56I.jpg', '2', '2018-09-03 16:22:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('17', '测试', '测试', '这个一个关于冯金琪的个人博客,杂谈,技术论文,文章,冯金琪个人网站,python学习,前端学习,vue学习,react学习', 'zj', '120', '0', '0', 'courses/2018/09/1_TpxG56I.jpg', '1', '2018-09-03 16:22:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('18', '测试', '测试', '这个一个关于冯金琪的个人博客,杂谈,技术论文,文章,冯金琪个人网站,python学习,前端学习,vue学习,react学习', 'zj', '120', '0', '0', 'courses/2018/09/1_TpxG56I.jpg', '1', '2018-09-03 16:22:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('19', '测试', '测试', '这个一个关于冯金琪的个人博客,杂谈,技术论文,文章,冯金琪个人网站,python学习,前端学习,vue学习,react学习', 'zj', '120', '0', '0', 'courses/2018/09/1_TpxG56I.jpg', '0', '2018-09-03 16:22:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('20', '测试', '测试', '这个一个关于冯金琪的个人博客,杂谈,技术论文,文章,冯金琪个人网站,python学习,前端学习,vue学习,react学习', 'zj', '120', '0', '0', 'courses/2018/09/1_TpxG56I.jpg', '0', '2018-09-03 16:22:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('21', '测试', '测试', '这个一个关于冯金琪的个人博客,杂谈,技术论文,文章,冯金琪个人网站,python学习,前端学习,vue学习,react学习', 'zj', '120', '0', '0', 'courses/2018/09/1_TpxG56I.jpg', '0', '2018-09-03 16:22:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('22', '测试', '测试', '这个一个关于冯金琪的个人博客,杂谈,技术论文,文章,冯金琪个人网站,python学习,前端学习,vue学习,react学习', 'zj', '120', '0', '0', 'courses/2018/09/1_TpxG56I.jpg', '0', '2018-09-03 16:22:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('23', '测试', '测试', '这个一个关于冯金琪的个人博客,杂谈,技术论文,文章,冯金琪个人网站,python学习,前端学习,vue学习,react学习', 'zj', '120', '0', '0', 'courses/2018/09/15101Z91639-3.jpg', '0', '2018-09-03 16:22:00', '2', '后端开发', 'python', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('24', '测试', '测试', '这个一个关于冯金琪的个人博客,杂谈,技术论文,文章,冯金琪个人网站,python学习,前端学习,vue学习,react学习', 'zj', '120', '0', '0', 'courses/2018/09/1_TpxG56I.jpg', '0', '2018-09-03 16:22:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('25', '测试', '测试', '这个一个关于冯金琪的个人博客,杂谈,技术论文,文章,冯金琪个人网站,python学习,前端学习,vue学习,react学习', 'zj', '120', '0', '0', 'courses/2018/09/1_TpxG56I.jpg', '1', '2018-09-03 16:22:00', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('26', '测试', '测试', '<p>&nbsp; &nbsp; 这个一个关于冯金琪的个人博客,杂谈,技术论文,文章,冯金琪个人网站,python学习,前端学习,vue学习,react学习</p><p><img src=\"/media/courses/ueditor/1_20180907155407_509.jpg\" title=\"\" alt=\"1.jpg\"/></p>', 'zj', '120', '0', '0', 'courses/2018/09/100950-15358541905581.jpg', '5', '2018-09-03 16:22:00', '2', '后端开发', 'python', null, '454', '54', '0');
INSERT INTO `courses_course` VALUES ('28', 'django入门', '晓晓', '晓晓', 'zj', '100', '11', '10', 'courses/2018/09/100950-15358541905581_fBknltd.jpg', '94', '2018-09-04 10:46:00', '2', '后端开发', 'python', '1', 'icontains是不区分大小写模糊匹配，查询时用 字段__icontains=值 中间是两个下划线，', 'icontains是不区分大小写模糊匹配，查询时用 字段__icontains=值 中间是两个下划线，', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_coursesresource
-- ----------------------------
INSERT INTO `courses_coursesresource` VALUES ('1', '5665', 'course/resource/2018/09/1.jpg', '2018-09-03 16:21:00', '2');
INSERT INTO `courses_coursesresource` VALUES ('2', '美女', 'course/resource/2018/09/timg.jpg', '2018-09-04 14:37:00', '28');
INSERT INTO `courses_coursesresource` VALUES ('3', '大美女', 'course/resource/2018/09/135924-15318935643369.jpg', '2018-09-04 14:37:00', '28');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES ('1', '第一节', '2018-08-29 10:48:00', '1');
INSERT INTO `courses_lesson` VALUES ('2', 'django', '2018-09-04 14:12:00', '28');
INSERT INTO `courses_lesson` VALUES ('3', 'tets', '2018-09-04 14:12:00', '28');
INSERT INTO `courses_lesson` VALUES ('4', 'admin', '2018-09-04 14:12:00', '28');

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES ('1', '哈哈', '2018-09-04 14:13:00', '2', '', '0');
INSERT INTO `courses_video` VALUES ('2', '43', '2018-09-04 14:13:00', '1', '', '0');
INSERT INTO `courses_video` VALUES ('3', '43', '2018-09-04 14:14:00', '4', '', '0');
INSERT INTO `courses_video` VALUES ('4', '34', '2018-09-04 14:14:00', '3', '', '0');

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
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

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
INSERT INTO `django_migrations` VALUES ('32', 'organization', '0005_teacher_image', '2018-09-03 10:07:41');
INSERT INTO `django_migrations` VALUES ('33', 'operations', '0002_auto_20180903_1405', '2018-09-03 14:06:05');
INSERT INTO `django_migrations` VALUES ('34', 'operations', '0003_auto_20180903_1410', '2018-09-03 14:11:00');
INSERT INTO `django_migrations` VALUES ('35', 'courses', '0004_course_category', '2018-09-04 09:55:11');
INSERT INTO `django_migrations` VALUES ('36', 'users', '0006_auto_20180904_1034', '2018-09-04 10:34:37');
INSERT INTO `django_migrations` VALUES ('37', 'courses', '0005_course_tag', '2018-09-04 11:10:08');
INSERT INTO `django_migrations` VALUES ('38', 'courses', '0006_video_url', '2018-09-04 14:15:51');
INSERT INTO `django_migrations` VALUES ('39', 'courses', '0007_video_learn_times', '2018-09-04 14:35:44');
INSERT INTO `django_migrations` VALUES ('40', 'courses', '0008_course_teacher', '2018-09-04 14:54:02');
INSERT INTO `django_migrations` VALUES ('41', 'courses', '0009_auto_20180904_1502', '2018-09-04 15:02:33');
INSERT INTO `django_migrations` VALUES ('42', 'courses', '0010_auto_20180904_1504', '2018-09-04 15:04:39');
INSERT INTO `django_migrations` VALUES ('43', 'organization', '0006_teacher_age', '2018-09-05 10:46:14');
INSERT INTO `django_migrations` VALUES ('44', 'users', '0007_auto_20180906_1458', '2018-09-06 14:58:23');
INSERT INTO `django_migrations` VALUES ('45', 'users', '0008_auto_20180906_1510', '2018-09-06 15:10:55');
INSERT INTO `django_migrations` VALUES ('46', 'courses', '0011_course_is_banner', '2018-09-07 10:24:29');
INSERT INTO `django_migrations` VALUES ('47', 'organization', '0007_courseorg_tag', '2018-09-07 10:53:58');

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
INSERT INTO `django_session` VALUES ('25aubeghps4bdhmwkx6pynk5ah6at3fg', 'ZWQzNjAzY2EwMThiZGNiOGYxYjQ3MWQyZGNjNmU1MTQyYTRkNjZhNTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijg2MTAzZmZhZmU5OGJhNzNiMDc1NzkzMGY2OTVkMWE0NjFiMzAxYTUiLCJMSVNUX1FVRVJZIjpbWyJ4YWRtaW4iLCJsb2ciXSwiIl19', '2018-09-21 16:30:26');

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
  CONSTRAINT `operations_coursecom_course_id_de0f98da_fk_courses_c` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operations_coursecom_user_id_84597521_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_coursecomments
-- ----------------------------
INSERT INTO `operations_coursecomments` VALUES ('2', '5454', '2018-09-04 15:57:00', '28', '1');
INSERT INTO `operations_coursecomments` VALUES ('3', '5454', '2018-09-04 16:00:14', '28', '1');
INSERT INTO `operations_coursecomments` VALUES ('4', '唉', '2018-09-04 16:01:04', '28', '1');

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
  CONSTRAINT `operations_usercourse_course_id_a9f30cc6_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operations_usercourse_user_id_d33454be_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_usercourse
-- ----------------------------
INSERT INTO `operations_usercourse` VALUES ('1', '2018-09-04 10:38:00', '28', '1');
INSERT INTO `operations_usercourse` VALUES ('7', '2018-09-04 10:45:00', '28', '5');
INSERT INTO `operations_usercourse` VALUES ('8', '2018-09-04 16:34:54', '15', '1');
INSERT INTO `operations_usercourse` VALUES ('9', '2018-09-04 16:35:15', '16', '1');
INSERT INTO `operations_usercourse` VALUES ('10', '2018-09-04 16:37:09', '18', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_userfavorite
-- ----------------------------
INSERT INTO `operations_userfavorite` VALUES ('14', '28', '1', '2018-09-04 11:30:35', '1');
INSERT INTO `operations_userfavorite` VALUES ('20', '2', '2', '2018-09-05 15:12:15', '1');
INSERT INTO `operations_userfavorite` VALUES ('24', '1', '3', '2018-09-06 16:52:39', '1');
INSERT INTO `operations_userfavorite` VALUES ('26', '3', '2', '2018-09-07 09:57:44', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_usermessage
-- ----------------------------
INSERT INTO `operations_usermessage` VALUES ('2', '1', '3244', '1', '2018-09-06 17:36:00');

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
  `tag` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES ('1', '慕课网', '慕课网(IMOOC)是IT技能学习平台。慕课网(IMOOC)提供了丰富的移动端开发、php开发、web前端、android开发以及html5等视频教程资源公开课。并且富有交互性及趣味性,你...', '0', '0', 'org/2018/08/3.jpg', '北京市', '2018-08-31 09:43:00', '1', 'pxjg', '7', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('2', '晓晓', '这个一个关于冯金琪的个人博客,杂谈,技术论文,文章,冯金琪个人网站,python学习,前端学习,vue学习,react学习', '0', '0', 'org/2018/09/1_42T8d9G.jpg', '成都', '2018-08-31 09:46:00', '5', 'gx', '10', '1', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('3', '极客', '极客学院作为中国专业IT职业在线教育平台,拥有海量高清IT职业课程,涵盖30+个技术领域,如Android,iOS ,Flash,Java,Python,HTML5,Swift,Cocos2dx等视频教程.根据IT在线...', '0', '0', 'org/2018/08/下载.png', '上海市', '2018-08-31 09:46:00', '2', 'pxjg', '0', '5', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('4', '传智', '传智播客专注IT培训,Java培训,人工智能培训,Python培训,PHP培训,C++培训,大数据培训,UI设计培训,移动开发培训,网络营销培训,web前端培训,全栈工程师培训,产品经理...', '0', '0', 'org/2018/08/3_vtRU0WW.jpg', '广州', '2018-08-31 09:47:00', '3', 'gr', '9', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('5', '哈哈', '传智', '0', '0', 'org/2018/08/6666_kvLR0qi.png', '深圳', '2018-08-31 09:48:00', '4', 'pxjg', '0', '3', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('6', '实验楼', '实验楼是国内领先的IT在线编程及在线实训学习平台,专业导师提供精选的实践项目,创新的技术使得学习者无需配置繁琐的本地环境,随时在线流畅使用。以就业为导向,提供...', '0', '0', 'org/2018/08/b.png', '成都', '2018-08-31 09:49:00', '5', 'pxjg', '0', '0', '全国知名');

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
  `image` varchar(200) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES ('1', '晓晓', '19', 'xx', 'xx', 'xx', '7', '0', '2018-08-31 16:14:00', '2', 'teacher/2018/09/1.jpg', '0');
INSERT INTO `organization_teacher` VALUES ('2', '465', '23', '324', '12', '34', '9', '0', '2018-08-31 16:14:00', '3', 'teacher/2018/09/1_0QJ7DaY.jpg', '0');
INSERT INTO `organization_teacher` VALUES ('3', 'xx', '12', '43', '12', '34', '40', '0', '2018-08-31 16:15:00', '1', 'teacher/2018/09/1_8D5TZDq.jpg', '0');
INSERT INTO `organization_teacher` VALUES ('4', '3232', '12', '34', '43', '45', '0', '0', '2018-08-31 16:15:00', '6', 'teacher/2018/09/1_x18KIOa.jpg', '0');
INSERT INTO `organization_teacher` VALUES ('5', 'admin', '2', '32', '23', '23', '1', '1', '2018-09-03 11:09:00', '1', 'teacher/2018/09/1_7V9qtD1.jpg', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_banner
-- ----------------------------
INSERT INTO `users_banner` VALUES ('1', '测试', 'banner/2018/09/20161013163832_vE4P3.thumb.700_0.jpeg', 'http://www.fengjinqi.com', '1', '2018-09-07 10:29:00');
INSERT INTO `users_banner` VALUES ('2', 'test', 'banner/2018/09/1.jpg', 'http://www.fengjinqi.com', '2', '2018-09-07 10:29:00');
INSERT INTO `users_banner` VALUES ('3', '3', 'banner/2018/09/timg.jpg', 'http://www.fengjinqi.com', '3', '2018-09-07 10:30:00');

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(30) NOT NULL,
  `send_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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
INSERT INTO `users_emailverifyrecord` VALUES ('8', 'hHQGcNKuzjkZaysU', '1218525402@qq.com', 'forget', '2018-09-06 13:51:19');
INSERT INTO `users_emailverifyrecord` VALUES ('9', 'qnv68KGMS882jQFQ', 'admin@163.com', 'update_ema', '2018-09-06 14:58:30');

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
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$100000$PQQwyvaYjRAE$LYr6AMnCfUKIaOxvaf3/9Pv5IYSV3aMBgNQSDiKs9+I=', '2018-09-07 16:29:40', '1', 'admin', '', '', 'admin@126.com', '1', '1', '2018-08-28 08:43:00', '管理员', '2018-09-06', 'male', '成都', '110', 'image/2018/09/u508846882869419168fm26gp0.jpg');
INSERT INTO `users_userprofile` VALUES ('5', 'pbkdf2_sha256$100000$zCwbZzhKsrui$XjAEGNnwPw9JEe89UVeZPTUFrz/hyiHqllQbd8jw9Hs=', '2018-09-07 16:30:23', '0', '1218525402@qq.com', '', '', '1218525402@qq.com', '1', '1', '2018-08-30 10:07:00', 'xx', null, 'female', 'as', null, 'image/2018/09/135924-15318935643369_MIPNvd8.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------
INSERT INTO `users_userprofile_user_permissions` VALUES ('4', '5', '61');
INSERT INTO `users_userprofile_user_permissions` VALUES ('1', '5', '65');
INSERT INTO `users_userprofile_user_permissions` VALUES ('2', '5', '66');
INSERT INTO `users_userprofile_user_permissions` VALUES ('3', '5', '67');
INSERT INTO `users_userprofile_user_permissions` VALUES ('5', '5', '94');

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
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

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
INSERT INTO `xadmin_log` VALUES ('22', '2018-09-03 09:56:44', '127.0.0.1', '2', 'python', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2018-09-03 10:08:06', '127.0.0.1', '1', '晓晓', 'change', '修改 image', '15', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2018-09-03 10:08:13', '127.0.0.1', '2', '465', 'change', '修改 image', '15', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2018-09-03 10:08:21', '127.0.0.1', '4', '3232', 'change', '修改 image', '15', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2018-09-03 10:08:30', '127.0.0.1', '3', 'xx', 'change', '修改 image', '15', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2018-09-03 11:09:36', '127.0.0.1', '5', 'admin', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2018-09-03 12:25:56', '127.0.0.1', '5', 'admin', 'change', '修改 click_nums，fav_nums 和 image', '15', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2018-09-03 16:21:03', '127.0.0.1', '3', 'test', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2018-09-03 16:21:18', '127.0.0.1', '4', '00', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2018-09-03 16:21:41', '127.0.0.1', '5', '76', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2018-09-03 16:22:00', '127.0.0.1', '1', '5665', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2018-09-03 16:22:31', '127.0.0.1', '6', 'aiyi', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2018-09-03 16:25:36', '127.0.0.1', '15', '测试', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2018-09-03 17:20:07', '127.0.0.1', '27', '测试', 'change', '修改 students，fav_nums，image 和 click_nums', '10', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2018-09-03 17:22:58', '127.0.0.1', '15', '测试', 'change', '修改 students，fav_nums，image 和 click_nums', '10', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2018-09-04 09:24:38', '127.0.0.1', '26', '测试', 'change', '修改 image', '10', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2018-09-04 10:31:24', '127.0.0.1', '1', 'admin', 'change', '修改 last_login，nick_name，gender，address 和 image', '6', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2018-09-04 10:35:25', '127.0.0.1', '1', 'admin', 'change', '修改 image', '6', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2018-09-04 10:35:50', '127.0.0.1', '5', '1218525402@qq.com', 'change', '修改 last_login，nick_name，address 和 image', '6', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2018-09-04 10:36:07', '127.0.0.1', '1', 'admin', 'change', '修改 address 和 image', '6', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2018-09-04 10:45:33', '127.0.0.1', '1', 'admin', 'change', '没有字段被修改。', '18', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2018-09-04 10:45:50', '127.0.0.1', '7', '1218525402@qq.com', 'create', '已添加。', '18', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2018-09-04 10:46:41', '127.0.0.1', '28', '晓晓', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2018-09-04 10:46:53', '127.0.0.1', '1', 'admin', 'change', '修改 course', '18', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2018-09-04 10:46:59', '127.0.0.1', '7', '1218525402@qq.com', 'change', '修改 course', '18', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2018-09-04 10:56:39', '127.0.0.1', '2', '晓晓', 'change', '修改 image', '14', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2018-09-04 10:57:46', '127.0.0.1', '2', '晓晓', 'change', '修改 image 和 course_nums', '14', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2018-09-04 11:17:20', '127.0.0.1', '28', '晓晓', 'change', '修改 image 和 tag', '10', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2018-09-04 11:17:36', '127.0.0.1', '23', '测试', 'change', '修改 image 和 tag', '10', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2018-09-04 14:12:51', '127.0.0.1', '2', 'django', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2018-09-04 14:12:59', '127.0.0.1', '3', 'tets', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2018-09-04 14:13:07', '127.0.0.1', '4', 'admin', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2018-09-04 14:13:58', '127.0.0.1', '1', '哈哈', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('55', '2018-09-04 14:14:02', '127.0.0.1', '2', '43', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('56', '2018-09-04 14:14:05', '127.0.0.1', '3', '43', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('57', '2018-09-04 14:14:08', '127.0.0.1', '4', '34', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('58', '2018-09-04 14:37:47', '127.0.0.1', '2', '美女', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('59', '2018-09-04 14:38:00', '127.0.0.1', '3', '大美女', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('60', '2018-09-04 14:54:35', '127.0.0.1', '28', '晓晓', 'change', '修改 teacher 和 image', '10', '1');
INSERT INTO `xadmin_log` VALUES ('61', '2018-09-04 15:03:15', '127.0.0.1', '28', '晓晓', 'change', '修改 image，youneed_know 和 teacher_tell', '10', '1');
INSERT INTO `xadmin_log` VALUES ('62', '2018-09-04 15:04:48', '127.0.0.1', '28', '晓晓', 'change', '没有字段被修改。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('63', '2018-09-04 15:57:42', '127.0.0.1', '2', '晓晓', 'create', '已添加。', '17', '1');
INSERT INTO `xadmin_log` VALUES ('64', '2018-09-04 16:16:32', '127.0.0.1', '28', 'django入门', 'change', '修改 name', '10', '1');
INSERT INTO `xadmin_log` VALUES ('65', '2018-09-05 08:43:46', '127.0.0.1', '1', 'admin chart widget', 'delete', '', '23', '1');
INSERT INTO `xadmin_log` VALUES ('66', '2018-09-06 11:20:33', '127.0.0.1', '1', 'admin', 'change', '修改 last_login 和 image', '6', '1');
INSERT INTO `xadmin_log` VALUES ('67', '2018-09-06 11:24:48', '127.0.0.1', '1', 'admin', 'change', '修改 birday 和 image', '6', '1');
INSERT INTO `xadmin_log` VALUES ('68', '2018-09-06 17:37:52', '127.0.0.1', '2', '3244', 'create', '已添加。', '20', '1');
INSERT INTO `xadmin_log` VALUES ('69', '2018-09-07 10:29:53', '127.0.0.1', '1', 'Banner object (1)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('70', '2018-09-07 10:30:33', '127.0.0.1', '2', 'Banner object (2)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('71', '2018-09-07 10:30:45', '127.0.0.1', '3', 'Banner object (3)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('72', '2018-09-07 15:52:41', '127.0.0.1', '26', '测试', 'change', '修改 detail，tag，youneed_know 和 teacher_tell', '10', '1');
INSERT INTO `xadmin_log` VALUES ('73', '2018-09-07 15:54:10', '127.0.0.1', '26', '测试', 'change', '修改 detail', '10', '1');
INSERT INTO `xadmin_log` VALUES ('74', '2018-09-07 16:28:50', '127.0.0.1', '5', '1218525402@qq.com', 'change', '修改 user_permissions，is_staff 和 image', '6', '1');
INSERT INTO `xadmin_log` VALUES ('75', '2018-09-07 16:30:15', '127.0.0.1', '5', '1218525402@qq.com', 'change', '修改 last_login，user_permissions 和 image', '6', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'dashboard:home:pos', '', '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
