/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tianti_stage

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-07-05 13:00:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` varchar(32) NOT NULL,
  `audit_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `delete_flag` varchar(1) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `content` longtext,
  `cover_image_url` varchar(128) DEFAULT NULL,
  `href` varchar(128) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  `publisher` varchar(64) DEFAULT NULL,
  `source_from` varchar(64) DEFAULT NULL,
  `summary` varchar(512) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `column_info_id` varchar(32) DEFAULT NULL,
  `is_audit` bit(1) DEFAULT NULL,
  `is_top` bit(1) DEFAULT NULL,
  `view_count` int(11) DEFAULT NULL,
  `root_column_info_id` varchar(32) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bcwrpr0ji2q3en1mrahtqkjwn` (`column_info_id`),
  KEY `FK_20m4l0vy20mnqtq74gs0nd8xo` (`root_column_info_id`),
  CONSTRAINT `FK_20m4l0vy20mnqtq74gs0nd8xo` FOREIGN KEY (`root_column_info_id`) REFERENCES `cms_column_info` (`id`),
  CONSTRAINT `FK_bcwrpr0ji2q3en1mrahtqkjwn` FOREIGN KEY (`column_info_id`) REFERENCES `cms_column_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('402880e96247cb470162490401870006', null, '2018-03-21 22:43:42', '0', '2018-03-22 11:27:58', '<p>在全国两会的重要节点，北京出台相关改革举措，所展示出的执行效率，是对坚持首善标准的一种行动诠释。<br/>　　3月18日，北京市优化营商环境政策新闻发布会召开。北京市财政局等7个部门的新闻发言人进行信息发布和政策解读。而就在日前，北京市发布了《关于进一步优化营商环境深化建设项目行政审批流程改革的意见》，聚焦办理施工许可、开办登记等环节，制定出台九项主要政策和N项配套措施，为在京企业发展提供优质服务。<br/>　　“优化营商环境就是解放生产力、提高竞争力”，今年的国务院政府工作报告提出，在全国推开“证照分离”改革，重点是照后减证，进一步压缩企业开办时间，大幅缩短商标注册周期，工程建设项目审批时间再压减一半。对照这些要求，北京出台的深化建设项目审批流程改革意见，可以说就是对政府工作报告的具体回应与落实。<br/>　　这些改革重点表现在四个方面：精简环节，如在缴纳税费方面，推出办税事项“最多跑一次”和“一次不用跑”清单；精简时间，如企业工商登记所需时间从8个工作日压缩至1-3个工作日；精简费用，如为企业免费提供刻制公章服务；增加透明度，如在建设项目审批领域，15个部门和16个区全部上网，推进“一网审批”。说到底，便是以提升行政效率，换取企业活力。</p>', '/uploads/attach/84a2181b-7c90-42ad-873d-c396e7d622b1.png', '', '4', 'zzf', null, null, '企业风采4', '402880e96247cb470162490319480005', '', null, '1', '4028821e5b7a0971015b7a0a1cbf0000', '2');
INSERT INTO `cms_article` VALUES ('402880e9624b38e901624b4793f10000', null, '2018-03-22 09:16:44', '0', '2018-03-22 11:27:57', '<p></p>', '/uploads/attach/0b738df4-48be-40bd-ad57-b3a0d9e7fafd.png', '', '3', 'zzf', null, null, '企业风采3', '402880e96247cb470162490319480005', '', null, '3', '4028821e5b7a0971015b7a0a1cbf0000', '2');
INSERT INTO `cms_article` VALUES ('402880e9624b38e901624b48ccce0001', null, '2018-03-22 09:18:05', '0', '2018-03-23 18:29:46', '<p></p>', '/uploads/attach/62181e0a-cd70-4976-8bf8-ed50bc7547dd.png', '', '2', 'zzf', null, null, '企业风采2', '402880e96247cb470162490319480005', '', null, '4', '4028821e5b7a0971015b7a0a1cbf0000', '2');
INSERT INTO `cms_article` VALUES ('402880e9624b38e901624b4925340002', null, '2018-03-22 09:18:27', '0', '2018-03-22 18:40:14', '<p></p>', '/uploads/attach/be5f2a3b-656e-44db-b1ad-8afcad59beac.png', '', '1', 'zzf', null, null, '企业风采1', '402880e96247cb470162490319480005', '', null, '1', '4028821e5b7a0971015b7a0a1cbf0000', '2');

-- ----------------------------
-- Table structure for cms_column_info
-- ----------------------------
DROP TABLE IF EXISTS `cms_column_info`;
CREATE TABLE `cms_column_info` (
  `id` varchar(32) NOT NULL,
  `audit_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `delete_flag` varchar(1) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  `path` varchar(512) DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  `icon` varchar(128) DEFAULT NULL,
  `channel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8pcbm05c14nhwr1bu0ui96d85` (`parent_id`),
  CONSTRAINT `FK_8pcbm05c14nhwr1bu0ui96d85` FOREIGN KEY (`parent_id`) REFERENCES `cms_column_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_column_info
-- ----------------------------
INSERT INTO `cms_column_info` VALUES ('40288010615f546601615f8776c90000', null, '2018-02-04 14:36:08', '1', '2018-03-22 17:10:33', 'test', '0', 'APP下载', '8', '40288010615f546601615f8776c90000', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('40288010615f546601615f8922fb0001', null, '2018-02-04 14:37:58', '1', '2018-03-22 17:10:28', 'yunzhangfang', '1', '北京云账房', '1', '40288010615f546601615f8776c90000/40288010615f546601615f8922fb0001', '40288010615f546601615f8776c90000', null, '0');
INSERT INTO `cms_column_info` VALUES ('4028801f6246a924016246ae15770000', null, '2018-03-21 11:50:36', '1', '2018-03-21 11:51:15', '登录', '0', '登录', '1', '4028801f6246a924016246ae15770000', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('4028801f6246a924016246af08240001', null, '2018-03-21 11:51:38', '1', '2018-03-21 12:32:35', '登录', '0', '登录', '9', '4028801f6246a924016246af08240001', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('4028801f6246a924016246b630da0002', null, '2018-03-21 11:59:27', '1', '2018-03-21 12:08:24', 'loginyzf', '1', '登录云账房', '1', '4028801f6246a924016246af08240001/4028801f6246a924016246b630da0002', '4028801f6246a924016246af08240001', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e96247cb470162485c3d1e0001', null, '2018-03-21 19:40:27', '1', '2018-03-21 19:41:59', '12', '0', '财税专家', '2', '402880e96247cb470162485c3d1e0001', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e96247cb4701624863112f0002', null, '2018-03-21 19:47:54', '1', '2018-03-22 17:07:18', '24', '1', '初级会计师', '4', '8a2a08425b7aa230015b7ab29b7e000f/402880e96247cb4701624863112f0002', '8a2a08425b7aa230015b7ab29b7e000f', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e96247cb47016248636cd80003', null, '2018-03-21 19:48:18', '1', '2018-03-22 17:07:15', '25', '1', '基金从业', '5', '8a2a08425b7aa230015b7ab29b7e000f/402880e96247cb47016248636cd80003', '8a2a08425b7aa230015b7ab29b7e000f', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e96247cb4701624863a2e00004', null, '2018-03-21 19:48:32', '1', '2018-03-22 17:07:07', '26', '1', '证券从业', '6', '8a2a08425b7aa230015b7ab29b7e000f/402880e96247cb4701624863a2e00004', '8a2a08425b7aa230015b7ab29b7e000f', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e96247cb470162490319480005', null, '2018-03-21 22:42:42', '0', '2018-03-22 09:22:21', '14', '1', '企业风采', '1', '4028821e5b7a0971015b7a0a1cbf0000/402880e96247cb470162490319480005', '4028821e5b7a0971015b7a0a1cbf0000', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e9624c8d4c01624cfa3e3b0000', null, '2018-03-22 17:11:31', '1', '2018-03-22 17:18:47', '19', '0', '登录', '9', '402880e9624c8d4c01624cfa3e3b0000', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e9624c8d4c01624cffe8b10001', null, '2018-03-22 17:17:42', '1', '2018-03-22 17:18:44', '91', '1', '登录', '1', '402880e9624c8d4c01624cfa3e3b0000/402880e9624c8d4c01624cffe8b10001', '402880e9624c8d4c01624cfa3e3b0000', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e9624c8d4c01624d0190e40002', null, '2018-03-22 17:19:31', '1', '2018-03-22 17:20:59', '91', '0', '登录', '1', '402880e9624c8d4c01624d0190e40002', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e9624c8d4c01624d0366060003', null, '2018-03-22 17:21:31', '1', '2018-03-22 17:21:44', '19', '0', '登录', '9', '402880e9624c8d4c01624d0366060003', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e9624dbb2101624e0543c90000', null, '2018-03-22 22:03:10', '1', '2018-06-27 17:06:17', '83', '1', '土地增值税', '3', '8a2a08425b7aa230015b7ab7f0ae001d/402880e9624dbb2101624e0543c90000', '8a2a08425b7aa230015b7ab7f0ae001d', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e9625c48cc01625cc94be80000', null, '2018-03-25 18:51:58', '1', '2018-06-27 17:06:11', '73', '1', '法律法规', '3', '8a2a08425b7aa230015b7ab5bb7d0017/402880e9625c48cc01625cc94be80000', '8a2a08425b7aa230015b7ab5bb7d0017', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e962b4ade80162b4d1036d0000', null, '2018-04-11 21:06:59', '1', '2018-06-27 17:06:17', 'cswhjs', '1', '城市维护建设税', '4', '8a2a08425b7aa230015b7ab7f0ae001d/402880e962b4ade80162b4d1036d0000', '8a2a08425b7aa230015b7ab7f0ae001d', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e962b4ade80162b4d15fb80001', null, '2018-04-11 21:07:23', '1', '2018-06-27 17:06:17', 'cztdsy', '1', '城镇土地使用税', '5', '8a2a08425b7aa230015b7ab7f0ae001d/402880e962b4ade80162b4d15fb80001', '8a2a08425b7aa230015b7ab7f0ae001d', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e962b4ade80162b4d1b4a80002', null, '2018-04-11 21:07:44', '1', '2018-06-27 17:06:17', 'fcs', '1', '房产税', '6', '8a2a08425b7aa230015b7ab7f0ae001d/402880e962b4ade80162b4d1b4a80002', '8a2a08425b7aa230015b7ab7f0ae001d', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e962b4ade80162b4d2238d0003', null, '2018-04-11 21:08:13', '1', '2018-06-27 17:06:17', 'ccs', '1', '车船税', '7', '8a2a08425b7aa230015b7ab7f0ae001d/402880e962b4ade80162b4d2238d0003', '8a2a08425b7aa230015b7ab7f0ae001d', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e962b4ade80162b4d2a11e0004', null, '2018-04-11 21:08:45', '1', '2018-06-27 17:06:17', 'zzs', '1', '增值税', '8', '8a2a08425b7aa230015b7ab7f0ae001d/402880e962b4ade80162b4d2a11e0004', '8a2a08425b7aa230015b7ab7f0ae001d', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e962b4ade80162b4d309f10005', null, '2018-04-11 21:09:12', '1', '2018-06-27 17:06:17', 'xfs', '1', '消费税', '9', '8a2a08425b7aa230015b7ab7f0ae001d/402880e962b4ade80162b4d309f10005', '8a2a08425b7aa230015b7ab7f0ae001d', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e962b4ade80162b4d33f1f0006', null, '2018-04-11 21:09:25', '1', '2018-06-27 17:06:17', 'yhs', '1', '印花税', '10', '8a2a08425b7aa230015b7ab7f0ae001d/402880e962b4ade80162b4d33f1f0006', '8a2a08425b7aa230015b7ab7f0ae001d', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e962b4ade80162b4d397d60007', null, '2018-04-11 21:09:48', '1', '2018-06-27 17:06:17', 'yys', '1', '营业税', '11', '8a2a08425b7aa230015b7ab7f0ae001d/402880e962b4ade80162b4d397d60007', '8a2a08425b7aa230015b7ab7f0ae001d', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e962b4ade80162b4d3e5a50008', null, '2018-04-11 21:10:08', '1', '2018-06-27 17:06:17', 'zys', '1', '资源税', '12', '8a2a08425b7aa230015b7ab7f0ae001d/402880e962b4ade80162b4d3e5a50008', '8a2a08425b7aa230015b7ab7f0ae001d', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e962b4ade80162b4d77e800009', null, '2018-04-11 21:14:04', '1', '2018-06-27 17:06:12', 'whgl', '1', '外汇管理', '4', '8a2a08425b7aa230015b7ab5bb7d0017/402880e962b4ade80162b4d77e800009', '8a2a08425b7aa230015b7ab5bb7d0017', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e962b4ade80162b4d80a8f000a', null, '2018-04-11 21:14:40', '1', '2018-06-27 17:06:12', 'pinggu', '1', '评估估价', '5', '8a2a08425b7aa230015b7ab5bb7d0017/402880e962b4ade80162b4d80a8f000a', '8a2a08425b7aa230015b7ab5bb7d0017', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e962b4ade80162b4d873be000b', null, '2018-04-11 21:15:07', '1', '2018-06-27 17:06:12', 'gongshang', '1', '工商行政管理', '6', '8a2a08425b7aa230015b7ab5bb7d0017/402880e962b4ade80162b4d873be000b', '8a2a08425b7aa230015b7ab5bb7d0017', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e962b4ade80162b4d8b835000c', null, '2018-04-11 21:15:24', '1', '2018-06-27 17:06:12', 'haiguan', '1', '海关', '7', '8a2a08425b7aa230015b7ab5bb7d0017/402880e962b4ade80162b4d8b835000c', '8a2a08425b7aa230015b7ab5bb7d0017', null, '0');
INSERT INTO `cms_column_info` VALUES ('402880e962b4fc680162b505aa56092e', null, '2018-04-11 22:04:30', '1', '2018-06-27 17:06:12', 'feizhi', '1', '文件废止公告', '8', '8a2a08425b7aa230015b7ab5bb7d0017/402880e962b4fc680162b505aa56092e', '8a2a08425b7aa230015b7ab5bb7d0017', null, '0');
INSERT INTO `cms_column_info` VALUES ('4028821e5b7a0971015b7a0a1cbf0000', null, '2017-04-17 11:52:14', '0', '2017-04-17 11:52:18', 'shouye', '0', '首页', '1', '4028821e5b7a0971015b7a0a1cbf0000', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('4028821e5b7a9cbf015b7a9f79e00000', null, '2017-04-17 14:35:23', '1', '2018-06-27 17:05:47', 'jiaoxuejiaoyan', '0', '财税专家', '3', '4028821e5b7a9cbf015b7a9f79e00000', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7a0b7b015b7a0cf4440000', null, '2017-04-17 11:55:21', '0', '2018-03-22 10:38:40', 'sy_xydt_ad', '1', '企业管理平台', '2', '4028821e5b7a0971015b7a0a1cbf0000/8a2a08425b7a0b7b015b7a0cf4440000', '4028821e5b7a0971015b7a0a1cbf0000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7a0b7b015b7a0ddd780001', null, '2017-04-17 11:56:20', '0', '2018-03-22 10:38:35', 'sy_xydt_right', '1', '代理记账平台', '3', '4028821e5b7a0971015b7a0a1cbf0000/8a2a08425b7a0b7b015b7a0ddd780001', '4028821e5b7a0971015b7a0a1cbf0000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7a0b7b015b7a0f32450002', null, '2017-04-17 11:57:47', '0', '2018-03-22 10:38:30', 'sy_xzjy', '1', '在线会计', '4', '4028821e5b7a0971015b7a0a1cbf0000/8a2a08425b7a0b7b015b7a0f32450002', '4028821e5b7a0971015b7a0a1cbf0000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7a0b7b015b7a105a640003', null, '2017-04-17 11:59:03', '1', '2018-03-22 10:39:45', 'sy_tzgg', '1', '通知公告', '14', '4028821e5b7a0971015b7a0a1cbf0000/8a2a08425b7a0b7b015b7a105a640003', '4028821e5b7a0971015b7a0a1cbf0000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7a0b7b015b7a10d9120004', null, '2017-04-17 11:59:36', '1', '2018-03-22 10:39:48', 'sy_zsks', '1', '招生考试', '15', '4028821e5b7a0971015b7a0a1cbf0000/8a2a08425b7a0b7b015b7a10d9120004', '4028821e5b7a0971015b7a0a1cbf0000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7a0b7b015b7a2a82ab0005', null, '2017-04-17 12:27:38', '1', '2018-06-27 17:05:39', 'xuexiaogaikuang', '0', '智能财税', '2', '8a2a08425b7a0b7b015b7a2a82ab0005', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7a0b7b015b7a2b0f060006', null, '2017-04-17 12:28:13', '1', '2018-03-22 10:38:10', 'sy_ad', '1', '在线会计', '2', '4028821e5b7a0971015b7a0a1cbf0000/8a2a08425b7a0b7b015b7a2b0f060006', '4028821e5b7a0971015b7a0a1cbf0000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7a0b7b015b7a9d0b2e000a', null, '2017-04-17 14:32:44', '1', '2018-06-27 17:05:39', 'xxgk_xxjj', '1', '在线会计', '1', '8a2a08425b7a0b7b015b7a2a82ab0005/8a2a08425b7a0b7b015b7a9d0b2e000a', '8a2a08425b7a0b7b015b7a2a82ab0005', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7a0b7b015b7a9fdd47000b', null, '2017-04-17 14:35:48', '1', '2018-06-27 17:05:39', 'xxgk_xxld', '1', '管理平台', '2', '8a2a08425b7a0b7b015b7a2a82ab0005/8a2a08425b7a0b7b015b7a9fdd47000b', '8a2a08425b7a0b7b015b7a2a82ab0005', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7a0b7b015b7aa0b065000c', null, '2017-04-17 14:36:42', '1', '2018-06-27 17:05:39', 'xxgk_xzjy', '1', '代理平台', '3', '8a2a08425b7a0b7b015b7a2a82ab0005/8a2a08425b7a0b7b015b7aa0b065000c', '8a2a08425b7a0b7b015b7a2a82ab0005', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7a0b7b015b7aa1330f000d', null, '2017-04-17 14:37:16', '1', '2018-03-21 22:45:27', 'xxgk_zzjg', '1', '组织机构', '4', '8a2a08425b7a0b7b015b7a2a82ab0005/8a2a08425b7a0b7b015b7aa1330f000d', '8a2a08425b7a0b7b015b7a2a82ab0005', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7a0b7b015b7aa19a60000e', null, '2017-04-17 14:37:42', '1', '2018-03-21 22:45:25', 'xxgk_bxcj', '1', '办学成就', '5', '8a2a08425b7a0b7b015b7a2a82ab0005/8a2a08425b7a0b7b015b7aa19a60000e', '8a2a08425b7a0b7b015b7a2a82ab0005', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7aa35b130000', null, '2017-04-17 14:39:37', '1', '2017-04-17 14:45:37', 'xxgk_ldgh', '1', '领导关怀', '6', '8a2a08425b7aa230015b7aa35b130000', '4028821e5b7a9cbf015b7a9f79e00000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7aa3b3eb0001', null, '2017-04-17 14:40:00', '1', '2017-04-19 22:54:14', 'ceshi', '1', '测试', '20', '8a2a08425b7aa230015b7aa3b3eb0001', '4028821e5b7a9cbf015b7a9f79e00000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7aa6740b0002', null, '2017-04-17 14:43:00', '1', '2018-03-21 22:45:22', 'xxgk_ldgh', '1', '领导关怀', '6', '8a2a08425b7a0b7b015b7a2a82ab0005/8a2a08425b7aa230015b7aa6740b0002', '8a2a08425b7a0b7b015b7a2a82ab0005', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7aa6c3ec0003', null, '2017-04-17 14:43:21', '1', '2018-03-21 22:45:19', 'xxgk_xyfg', '1', '校园风光', '7', '8a2a08425b7a0b7b015b7a2a82ab0005/8a2a08425b7aa230015b7aa6c3ec0003', '8a2a08425b7a0b7b015b7a2a82ab0005', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7aa9a1ad0004', null, '2017-04-17 14:46:29', '1', '2018-06-27 17:05:47', 'jxjy_jxyt', '1', '在线专家', '1', '4028821e5b7a9cbf015b7a9f79e00000/8a2a08425b7aa230015b7aa9a1ad0004', '4028821e5b7a9cbf015b7a9f79e00000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7aa9f49d0005', null, '2017-04-17 14:46:50', '1', '2018-06-27 17:05:47', 'jxjy_jxzx', '1', '专家问答', '2', '4028821e5b7a9cbf015b7a9f79e00000/8a2a08425b7aa230015b7aa9f49d0005', '4028821e5b7a9cbf015b7a9f79e00000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7aaa576d0006', null, '2017-04-17 14:47:15', '1', '2018-03-22 10:17:56', 'jxjy_szdw', '1', '师资队伍', '3', '4028821e5b7a9cbf015b7a9f79e00000/8a2a08425b7aa230015b7aaa576d0006', '4028821e5b7a9cbf015b7a9f79e00000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7aaa9ca10007', null, '2017-04-17 14:47:33', '1', '2018-03-22 10:17:36', 'jxjy_msfc', '1', '名师风采', '4', '4028821e5b7a9cbf015b7a9f79e00000/8a2a08425b7aa230015b7aaa9ca10007', '4028821e5b7a9cbf015b7a9f79e00000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7aaaebf50008', null, '2017-04-17 14:47:53', '1', '2018-03-22 10:17:34', 'jxjy_xkjs', '1', '学科建设', '5', '4028821e5b7a9cbf015b7a9f79e00000/8a2a08425b7aa230015b7aaaebf50008', '4028821e5b7a9cbf015b7a9f79e00000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7aaf09900009', null, '2017-04-17 14:52:23', '1', '2018-06-27 17:05:55', 'tsjy', '0', '财税培训', '4', '8a2a08425b7aa230015b7aaf09900009', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7aaf5b94000a', null, '2017-04-17 14:52:44', '1', '2018-06-27 17:05:55', 'tsjy_gfb', '1', '选课中心 	', '1', '8a2a08425b7aa230015b7aaf09900009/8a2a08425b7aa230015b7aaf5b94000a', '8a2a08425b7aa230015b7aaf09900009', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7aaf99fc000b', null, '2017-04-17 14:53:00', '1', '2018-06-27 17:05:55', 'tsjy_dly', '1', '云账房书店 	', '2', '8a2a08425b7aa230015b7aaf09900009/8a2a08425b7aa230015b7aaf99fc000b', '8a2a08425b7aa230015b7aaf09900009', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7aafd6f8000c', null, '2017-04-17 14:53:15', '1', '2018-06-27 17:05:55', 'tsjy_xly', '1', '云账房TV 	', '3', '8a2a08425b7aa230015b7aaf09900009/8a2a08425b7aa230015b7aafd6f8000c', '8a2a08425b7aa230015b7aaf09900009', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab025c5000d', null, '2017-04-17 14:53:36', '1', '2018-03-21 19:47:16', 'tsjy_xsjx', '1', '新生军训', '4', '8a2a08425b7aa230015b7aaf09900009/8a2a08425b7aa230015b7ab025c5000d', '8a2a08425b7aa230015b7aaf09900009', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab178b2000e', null, '2017-04-17 14:55:02', '1', '2018-03-21 19:47:18', 'tsjy_tywhj', '1', '体育文化节', '5', '8a2a08425b7aa230015b7aaf09900009/8a2a08425b7aa230015b7ab178b2000e', '8a2a08425b7aa230015b7aaf09900009', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab29b7e000f', null, '2017-04-17 14:56:17', '1', '2018-06-27 17:06:01', 'dyzx', '0', '财经数据', '5', '8a2a08425b7aa230015b7ab29b7e000f', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab30a3b0010', null, '2017-04-17 14:56:45', '1', '2018-06-27 17:06:01', 'dyzx_dyln', '1', '要闻', '1', '8a2a08425b7aa230015b7ab29b7e000f/8a2a08425b7aa230015b7ab30a3b0010', '8a2a08425b7aa230015b7ab29b7e000f', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab381580011', null, '2017-04-17 14:57:16', '1', '2018-06-27 17:06:01', 'dyzx_dyhd', '1', '行情', '2', '8a2a08425b7aa230015b7ab29b7e000f/8a2a08425b7aa230015b7ab381580011', '8a2a08425b7aa230015b7ab29b7e000f', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab3d8580012', null, '2017-04-17 14:57:38', '1', '2018-06-27 17:06:01', 'dyzx_jzxx', '1', '分析', '3', '8a2a08425b7aa230015b7ab29b7e000f/8a2a08425b7aa230015b7ab3d8580012', '8a2a08425b7aa230015b7ab29b7e000f', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab44ea90013', null, '2017-04-17 14:58:08', '1', '2018-06-27 17:06:06', 'xstd', '0', '实训中心', '6', '8a2a08425b7aa230015b7ab44ea90013', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab4ab360014', null, '2017-04-17 14:58:32', '1', '2018-06-27 17:06:06', 'xstd_xshd', '1', '实务课堂 	', '1', '8a2a08425b7aa230015b7ab44ea90013/8a2a08425b7aa230015b7ab4ab360014', '8a2a08425b7aa230015b7ab44ea90013', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab5134b0015', null, '2017-04-17 14:58:59', '1', '2018-06-27 17:06:06', 'xstd_ xsfc', '1', '继续深造 	', '2', '8a2a08425b7aa230015b7ab44ea90013/8a2a08425b7aa230015b7ab5134b0015', '8a2a08425b7aa230015b7ab44ea90013', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab544ef0016', null, '2017-04-17 14:59:11', '1', '2018-03-21 19:49:01', 'xstd_xshj', '1', '学生获奖', '3', '8a2a08425b7aa230015b7ab44ea90013/8a2a08425b7aa230015b7ab544ef0016', '8a2a08425b7aa230015b7ab44ea90013', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab5bb7d0017', null, '2017-04-17 14:59:42', '1', '2018-06-27 17:06:11', 'zsks', '0', '行业法规', '7', '8a2a08425b7aa230015b7ab5bb7d0017', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab61fcb0018', null, '2017-04-17 15:00:07', '1', '2018-06-27 17:06:11', 'zsks_zsjz', '1', '会计制度', '1', '8a2a08425b7aa230015b7ab5bb7d0017/8a2a08425b7aa230015b7ab61fcb0018', '8a2a08425b7aa230015b7ab5bb7d0017', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab648660019', null, '2017-04-17 15:00:18', '1', '2018-06-27 17:06:11', 'zsks_jxj', '1', '会计准则', '2', '8a2a08425b7aa230015b7ab5bb7d0017/8a2a08425b7aa230015b7ab648660019', '8a2a08425b7aa230015b7ab5bb7d0017', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab6a12d001a', null, '2017-04-17 15:00:40', '1', '2018-03-22 11:50:16', 'zsks_zszx', '1', '招生咨询', '3', '8a2a08425b7aa230015b7ab5bb7d0017/8a2a08425b7aa230015b7ab6a12d001a', '8a2a08425b7aa230015b7ab5bb7d0017', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab6e46b001b', null, '2017-04-17 15:00:58', '1', '2018-03-22 11:50:13', 'zsks_zxbm', '1', '在线报名', '4', '8a2a08425b7aa230015b7ab5bb7d0017/8a2a08425b7aa230015b7ab6e46b001b', '8a2a08425b7aa230015b7ab5bb7d0017', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab72967001c', null, '2017-04-17 15:01:15', '1', '2018-03-22 11:50:11', 'zsks_gkzx', '1', '高考资讯', '5', '8a2a08425b7aa230015b7ab5bb7d0017/8a2a08425b7aa230015b7ab72967001c', '8a2a08425b7aa230015b7ab5bb7d0017', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab7f0ae001d', null, '2017-04-17 15:02:06', '1', '2018-06-27 17:06:16', 'lxwm', '0', '税收', '8', '8a2a08425b7aa230015b7ab7f0ae001d', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab849e6001e', null, '2017-04-17 15:02:29', '1', '2018-06-27 17:06:16', 'lxwm_lxwm', '1', '企业所得税', '1', '8a2a08425b7aa230015b7ab7f0ae001d/8a2a08425b7aa230015b7ab849e6001e', '8a2a08425b7aa230015b7ab7f0ae001d', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab88685001f', null, '2017-04-17 15:02:45', '1', '2018-06-27 17:06:16', 'lxwm_xzxx', '1', '个人所得税', '2', '8a2a08425b7aa230015b7ab7f0ae001d/8a2a08425b7aa230015b7ab88685001f', '8a2a08425b7aa230015b7ab7f0ae001d', null, '0');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseID` int(11) NOT NULL,
  `courseName` varchar(200) NOT NULL COMMENT '课程名称',
  `courseDetail` varchar(200) DEFAULT NULL COMMENT '课程类型',
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'Python', 'Python');
INSERT INTO `course` VALUES ('2', 'Python入门', 'Python入门');
INSERT INTO `course` VALUES ('3', '1024设计', '1024设计');
INSERT INTO `course` VALUES ('4', 'Python爬虫', 'Python爬虫技巧');
INSERT INTO `course` VALUES ('5', 'java', 'java');
INSERT INTO `course` VALUES ('6', 'Python爬虫2', 'Python爬虫2');
INSERT INTO `course` VALUES ('7', 'mysql', '数据库');
INSERT INTO `course` VALUES ('8', 'c++', '吕鑫 c++');

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `course_name` varchar(16) DEFAULT NULL COMMENT '课程名称',
  `course_info` varchar(1024) DEFAULT NULL COMMENT '课程祥情/简介',
  `catalog` varchar(4000) DEFAULT NULL COMMENT '课程目录',
  `photo_url` varchar(256) DEFAULT NULL COMMENT '图片url',
  `thum_photo_url` varchar(256) DEFAULT NULL COMMENT '封面缩略图url',
  `lecturer` varchar(16) DEFAULT NULL COMMENT '讲师',
  `lecturer_portrait_url` varchar(128) DEFAULT NULL COMMENT '讲师头像url',
  `period` varchar(16) DEFAULT NULL COMMENT '课程周期 ',
  `price` varchar(11) DEFAULT NULL COMMENT '课程单价',
  `free` char(1) DEFAULT NULL COMMENT '是否免费（1：是 0：否）',
  `status` char(1) DEFAULT NULL COMMENT '上架/下架 （1：上架   0：已下架）',
  `sales_volume` int(11) DEFAULT NULL COMMENT '销售量',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_person` varchar(8) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='课程表';

-- ----------------------------
-- Records of edu_course
-- ----------------------------
INSERT INTO `edu_course` VALUES ('1', '会计基础', '<p><br><span style=\"font-size: 18px;\"><strong>适用人群</strong></span><strong><br></strong><br>初入会计职场，没有会计工作经验的同学。</p><p><br></p><p><span style=\"font-size: 18px;\"><strong>课程概述</strong></span></p><p><span style=\"font-size: 18px;\"><strong></strong></span><br>会计真账实操&lt;国地税申报&gt;是针对已取得会计从业资格，却苦于没有实际的会计经验，又不敢去面试的同学，如：财会专业的同学，大学里学了四年，毕业后也不知会计怎么做。有人问有没有可能在短时间速成会计？这不再是梦想，有多年教学经验和实践经验的贾永红老师就能帮助你实现这一愿望，让你在两个月左右学会会计工作的全过程，可以使你增加一到二年的工作经验。贾永红老师是少有的双师型人才，她在教学过程中，用启发示的教学方法，生动形象的语言，将枯燥的会计理论演变成学生易懂的会计方法，教学语言精练，课堂情绪饱满，极大提高了学员的学习热情和学习效果。</p><p><br></p><p>会计真账实操&lt;国地税申报&gt;，会带领你走进会计行业，也许不远的将来，会计领军人才就是你。<br></p>', '课程目录', '/photo/0000001.png', '/photo/0000001.png', '王连胜', null, '44课时', '88.00', '1', '1', '86', '2018-06-29 14:54:12', 'admin');
INSERT INTO `edu_course` VALUES ('2', '会计实操', '<p><br><span style=\"font-size: 18px;\"><strong>适用人群</strong></span><strong><br></strong><br>初入会计职场，没有会计工作经验的同学。</p><p><br></p><p><span style=\"font-size: 18px;\"><strong>课程概述</strong></span></p><p><span style=\"font-size: 18px;\"><strong></strong></span><br>会计真账实操&lt;国地税申报&gt;是针对已取得会计从业资格，却苦于没有实际的会计经验，又不敢去面试的同学，如：财会专业的同学，大学里学了四年，毕业后也不知会计怎么做。有人问有没有可能在短时间速成会计？这不再是梦想，有多年教学经验和实践经验的贾永红老师就能帮助你实现这一愿望，让你在两个月左右学会会计工作的全过程，可以使你增加一到二年的工作经验。贾永红老师是少有的双师型人才，她在教学过程中，用启发示的教学方法，生动形象的语言，将枯燥的会计理论演变成学生易懂的会计方法，教学语言精练，课堂情绪饱满，极大提高了学员的学习热情和学习效果。</p><p><br></p><p>会计真账实操&lt;国地税申报&gt;，会带领你走进会计行业，也许不远的将来，会计领军人才就是你。<br></p>', '课程目录', '/photo/0000002.jpg', '/photo/0000002.jpg', '张智方', null, '6课时', '0.01', '0', '1', '106', '2018-06-29 17:09:13', 'admin');

-- ----------------------------
-- Table structure for edu_section
-- ----------------------------
DROP TABLE IF EXISTS `edu_section`;
CREATE TABLE `edu_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `course_id` int(11) NOT NULL COMMENT '课程id',
  `section_name` varchar(64) DEFAULT NULL COMMENT '章节名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edu_section
-- ----------------------------
INSERT INTO `edu_section` VALUES ('17', '1', '章节1 前言');
INSERT INTO `edu_section` VALUES ('18', '1', '章节2 第一章 总论');
INSERT INTO `edu_section` VALUES ('19', '1', '章节3 第二章 会计要素与会计科目');
INSERT INTO `edu_section` VALUES ('20', '1', '章节4 第三章 会计等式与复式记账');
INSERT INTO `edu_section` VALUES ('21', '1', '章节5 第四章 会计凭证');
INSERT INTO `edu_section` VALUES ('22', '1', '章节6 第五章 会计账簿');
INSERT INTO `edu_section` VALUES ('23', '1', '章节7 第六章 账务处理程序');
INSERT INTO `edu_section` VALUES ('24', '1', '章节8 第七章 财产清查');
INSERT INTO `edu_section` VALUES ('25', '1', '章节9 第八章 财务会计报告');
INSERT INTO `edu_section` VALUES ('26', '1', '章节10 第九章 会计档案');
INSERT INTO `edu_section` VALUES ('27', '1', '章节11 第十章 主要经济业务事项账务处理');
INSERT INTO `edu_section` VALUES ('28', '2', '章节1 会计实操');

-- ----------------------------
-- Table structure for edu_video
-- ----------------------------
DROP TABLE IF EXISTS `edu_video`;
CREATE TABLE `edu_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) DEFAULT NULL COMMENT '章节id',
  `video_name` varchar(64) DEFAULT NULL COMMENT '视频名称',
  `video_url` varchar(128) DEFAULT NULL COMMENT '视频url',
  `cover_url` varchar(128) DEFAULT NULL COMMENT '视频截图url',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edu_video
-- ----------------------------
INSERT INTO `edu_video` VALUES ('32', '17', '课时1 前言', '/course/0000001/01.mp4', null, '2018-06-29 15:16:44');
INSERT INTO `edu_video` VALUES ('33', '18', '课时2 会计概述', '/course/0000001/02.mp4', null, '2018-06-29 15:19:14');
INSERT INTO `edu_video` VALUES ('34', '18', '课时3 会计基本假设', '/course/0000001/03.mp4', null, '2018-06-29 15:19:17');
INSERT INTO `edu_video` VALUES ('35', '18', '课时4 会计基础（理解、应用）', '/course/0000001/04.mp4', null, '2018-06-29 15:19:19');
INSERT INTO `edu_video` VALUES ('36', '19', '课时5 会计要素（上）', '/course/0000001/05.mp4', null, '2018-06-29 15:19:27');
INSERT INTO `edu_video` VALUES ('37', '19', '课时6 会计要素（中）', '/course/0000001/06.mp4', null, '2018-06-29 15:19:27');
INSERT INTO `edu_video` VALUES ('38', '19', '课时7 会计要素（下）', '/course/0000001/07.mp4', null, '2018-06-29 15:19:27');
INSERT INTO `edu_video` VALUES ('39', '19', '课时8 会计科目', '/course/0000001/08.mp4', null, '2018-06-29 15:19:36');
INSERT INTO `edu_video` VALUES ('40', '20', '课时9 会计等式（上）', '/course/0000001/09.mp4', '/photo/0000001.png', '2018-06-29 15:19:36');
INSERT INTO `edu_video` VALUES ('41', '20', '课时10 会计等式（下）', '/course/0000001/10.mp4', '/photo/0000001.png', '2018-06-29 15:19:36');
INSERT INTO `edu_video` VALUES ('42', '20', '课时11 复式记账（上）', '/course/0000001/11.mp4', '/photo/0000001.png', '2018-06-29 15:21:02');
INSERT INTO `edu_video` VALUES ('43', '20', '课时12 复式记账（中）', '/course/0000001/12.mp4', '/photo/0000001.png', '2018-06-29 15:21:02');
INSERT INTO `edu_video` VALUES ('44', '20', '课时13 复式记账（下）', '/course/0000001/13.mp4', '/photo/0000001.png', '2018-06-29 15:21:22');
INSERT INTO `edu_video` VALUES ('45', '21', '课时14 记账凭证处理程序', '/course/0000001/14.mp4', '/photo/0000001.png', '2018-06-29 15:21:22');
INSERT INTO `edu_video` VALUES ('46', '21', '课时15 原始凭证', '/course/0000001/15.mp4', '/photo/0000001.png', '2018-06-29 15:21:23');
INSERT INTO `edu_video` VALUES ('47', '21', '课时16 记账凭证（上）', '/course/0000001/16.mp4', '/photo/0000001.png', '2018-06-29 15:21:23');
INSERT INTO `edu_video` VALUES ('48', '21', '课时17 记账凭证（中）', '/course/0000001/17.mp4', '/photo/0000001.png', '2018-06-29 15:21:23');
INSERT INTO `edu_video` VALUES ('49', '21', '课时18 记账凭证（下）', '/course/0000001/18.mp4', '/photo/0000001.png', '2018-06-29 15:22:14');
INSERT INTO `edu_video` VALUES ('50', '21', '课时19 会计账簿概述', '/course/0000001/19.mp4', '/photo/0000001.png', '2018-06-29 15:22:23');
INSERT INTO `edu_video` VALUES ('51', '22', '课时20 会计账簿的内容、启用与登记规则', '/course/0000001/20.mp4', '/photo/0000001.png', '2018-06-29 15:22:27');
INSERT INTO `edu_video` VALUES ('52', '22', '课时21 会计账簿的格式和登记方法', '/course/0000001/21.mp4', '/photo/0000001.png', '2018-06-29 15:22:27');
INSERT INTO `edu_video` VALUES ('53', '22', '课时22 对账', '/course/0000001/22.mp4', '/photo/0000001.png', '2018-06-29 15:22:27');
INSERT INTO `edu_video` VALUES ('54', '22', '课时23 错账更正方法、结账', '/course/0000001/23.mp4', '/photo/0000001.png', '2018-06-29 15:22:27');
INSERT INTO `edu_video` VALUES ('55', '22', '课时24 会计账簿的更换与保管 ', '/course/0000001/24.mp4', '/photo/0000001.png', '2018-06-29 15:22:27');
INSERT INTO `edu_video` VALUES ('56', '22', '课时25 记账凭证处理程序', '/course/0000001/25.mp4', '/photo/0000001.png', '2018-06-29 15:22:52');
INSERT INTO `edu_video` VALUES ('57', '23', '课时26 汇总记账凭证账务处理程序', '/course/0000001/26.mp4', '/photo/0000001.png', '2018-06-29 15:22:52');
INSERT INTO `edu_video` VALUES ('58', '23', '课时27 科目汇总表账务处理程序', '/course/0000001/27.mp4', '/photo/0000001.png', '2018-06-29 15:22:52');
INSERT INTO `edu_video` VALUES ('59', '23', '课时28 财产清查概述', '/course/0000001/28.mp4', '/photo/0000001.png', '2018-06-29 15:22:53');
INSERT INTO `edu_video` VALUES ('60', '24', '课时29 财产清查的方法（上）', '/course/0000001/29.mp4', '/photo/0000001.png', '2018-06-29 15:22:53');
INSERT INTO `edu_video` VALUES ('61', '24', '课时30 财产清查的方法（下）', '/course/0000001/30.mp4', '/photo/0000001.png', '2018-06-29 15:22:53');
INSERT INTO `edu_video` VALUES ('62', '24', '课时31 财产清查结果的处理', '/course/0000001/31.mp4', '/photo/0000001.png', '2018-06-29 15:22:57');
INSERT INTO `edu_video` VALUES ('63', '24', '课时32 财务会计报告概述', '/course/0000001/32.mp4', '/photo/0000001.png', '2018-06-29 15:22:57');
INSERT INTO `edu_video` VALUES ('64', '24', '课时33 资产负债表', '/course/0000001/33.mp4', '/photo/0000001.png', '2018-06-29 15:22:58');
INSERT INTO `edu_video` VALUES ('65', '25', '课时34 利润表', '/course/0000001/34.mp4', '/photo/0000001.png', '2018-06-29 15:22:58');
INSERT INTO `edu_video` VALUES ('66', '25', '课时35 会计档案概述', '/course/0000001/35.mp4', '/photo/0000001.png', '2018-06-29 15:22:58');
INSERT INTO `edu_video` VALUES ('67', '25', '课时36 会计档案保管', '/course/0000001/36.mp4', '/photo/0000001.png', '2018-06-29 15:22:58');
INSERT INTO `edu_video` VALUES ('68', '25', '课时37 款项和有价证券的收付', '/course/0000001/37.mp4', '/photo/0000001.png', '2018-06-29 15:22:58');
INSERT INTO `edu_video` VALUES ('69', '26', '课时38 财产物资的收发、增减和使用（上）', '/course/0000001/38.mp4', '/photo/0000001.png', '2018-06-29 15:22:58');
INSERT INTO `edu_video` VALUES ('70', '26', '课时39 财产物资的收发、增减和使用（下）', '/course/0000001/39.mp4', '/photo/0000001.png', '2018-06-29 15:22:59');
INSERT INTO `edu_video` VALUES ('71', '26', '课时40 债权、债务的发生和结算（上）', '/course/0000001/40.mp4', '/photo/0000001.png', '2018-06-29 15:22:59');
INSERT INTO `edu_video` VALUES ('72', '27', '课时41 债权、债务的发生和结算（下）', '/course/0000001/41.mp4', '/photo/0000001.png', '2018-06-29 15:22:59');
INSERT INTO `edu_video` VALUES ('73', '27', '课时42 资本的增减', '/course/0000001/42.mp4', '/photo/0000001.png', '2018-06-29 15:22:59');
INSERT INTO `edu_video` VALUES ('74', '27', '课时43 收入、成本和费用', '/course/0000001/43.mp4', '/photo/0000001.png', '2018-06-29 15:22:59');
INSERT INTO `edu_video` VALUES ('75', '27', '课时44 财务成果的计算', '/course/0000001/44.mp4', '/photo/0000001.png', '2018-06-29 15:24:06');
INSERT INTO `edu_video` VALUES ('84', '28', '课时01 文化事业建设费申报', '/course/0000002/01.mp4', '/photo/0000002.jpg', '2018-06-29 17:16:52');
INSERT INTO `edu_video` VALUES ('85', '28', '课时02 资源税申报', '/course/0000002/02.mp4', '/photo/0000002.jpg', '2018-06-29 17:16:52');
INSERT INTO `edu_video` VALUES ('86', '28', '课时03 小汽车消费税申报', '/course/0000002/03.mp4', '/photo/0000002.jpg', '2018-06-29 17:16:52');
INSERT INTO `edu_video` VALUES ('87', '28', '课时04 烟类消费税申报', '/course/0000002/04.mp4', '/photo/0000002.jpg', '2018-06-29 17:16:53');
INSERT INTO `edu_video` VALUES ('88', '28', '课时05 增值税小规模纳税人申报', '/course/0000002/05.mp4', '/photo/0000002.jpg', '2018-06-29 17:16:53');
INSERT INTO `edu_video` VALUES ('89', '28', '课时06 原油天然气增值申报', '/course/0000002/06.mp4', '/photo/0000002.jpg', '2018-06-29 17:17:33');

-- ----------------------------
-- Table structure for edu_video_src
-- ----------------------------
DROP TABLE IF EXISTS `edu_video_src`;
CREATE TABLE `edu_video_src` (
  `id` int(11) NOT NULL,
  `video_name` varchar(64) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频url',
  `cover_url` varchar(255) DEFAULT NULL COMMENT '视频截图url',
  `video_duration` varchar(8) DEFAULT NULL COMMENT '时长:例“00:36:37”',
  `video_size` varchar(255) DEFAULT NULL COMMENT '大小(M)：例：29.7 ',
  `media_type` varchar(8) DEFAULT NULL COMMENT '媒体类型 例：mp4',
  `comment` varchar(256) DEFAULT NULL COMMENT '备注',
  `insert_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_person` varchar(16) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频资源表';

-- ----------------------------
-- Records of edu_video_src
-- ----------------------------

-- ----------------------------
-- Table structure for ins_institution
-- ----------------------------
DROP TABLE IF EXISTS `ins_institution`;
CREATE TABLE `ins_institution` (
  `id` varchar(32) NOT NULL,
  `audit_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `delete_flag` varchar(1) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `contact` varchar(64) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `ins_type` int(11) DEFAULT NULL,
  `introduction` longtext,
  `logo` varchar(128) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `website` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ins_institution
-- ----------------------------

-- ----------------------------
-- Table structure for order_table
-- ----------------------------
DROP TABLE IF EXISTS `order_table`;
CREATE TABLE `order_table` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `course_id` int(10) NOT NULL COMMENT '课程ID',
  `order_name` varchar(255) DEFAULT NULL COMMENT '订单名称',
  `order_code` varchar(255) DEFAULT NULL COMMENT '订单号',
  `money` varchar(50) DEFAULT NULL COMMENT '金额',
  `pay_method` int(4) DEFAULT NULL COMMENT '支付方式：1、支付宝   2、微信',
  `goods_description` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付表';

-- ----------------------------
-- Records of order_table
-- ----------------------------

-- ----------------------------
-- Table structure for org_resource
-- ----------------------------
DROP TABLE IF EXISTS `org_resource`;
CREATE TABLE `org_resource` (
  `id` varchar(32) NOT NULL,
  `audit_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `delete_flag` varchar(1) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `icon` varchar(512) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2qoscu42yxypno5iv9w9raj2n` (`parent_id`),
  CONSTRAINT `FK_2qoscu42yxypno5iv9w9raj2n` FOREIGN KEY (`parent_id`) REFERENCES `org_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_resource
-- ----------------------------
INSERT INTO `org_resource` VALUES ('2c9025ab5adb1eef015adb2e74b90000', null, '2017-03-17 15:32:19', '0', '2017-03-17 15:32:19', '', '修改密码', '90', 'module', '/user/update_pwd', null);
INSERT INTO `org_resource` VALUES ('2c9025ab5adb1eef015adb32ffb90001', null, '2017-03-17 15:37:16', '0', '2017-03-17 15:37:16', '', '内容管理', '30', 'module', '', null);
INSERT INTO `org_resource` VALUES ('2c9025ab5adb1eef015adb36bac60002', null, '2017-03-17 15:41:21', '0', '2017-03-17 16:17:12', '', '栏目列表', '31', 'page', '/cms/column/list', '2c9025ab5adb1eef015adb32ffb90001');
INSERT INTO `org_resource` VALUES ('2c9025ab5adb1eef015adb37ccd50003', null, '2017-03-17 15:42:31', '0', '2017-03-17 16:17:21', '', '文章列表', '32', 'page', '/cms/article/list', '2c9025ab5adb1eef015adb32ffb90001');
INSERT INTO `org_resource` VALUES ('2c9025ab5b140c22015b140fbbd30000', null, '2017-03-28 16:37:07', '0', '2017-03-28 16:37:07', '', '换肤管理', '20', 'module', '/user/skin/list', null);
INSERT INTO `org_resource` VALUES ('70', null, '2016-08-17 17:06:19', '0', '2016-10-28 17:02:57', '', '权限管理', '10', 'module', '/user/list', null);
INSERT INTO `org_resource` VALUES ('71', null, '2016-09-07 15:15:58', '0', '2016-10-28 17:03:06', '', '用户列表', '11', 'page', '/user/list', '70');
INSERT INTO `org_resource` VALUES ('72', null, '2016-09-07 15:17:37', '0', '2016-10-28 17:03:13', '', '角色列表', '12', 'page', '/user/role_list', '70');
INSERT INTO `org_resource` VALUES ('73', null, '2016-09-18 16:34:14', '0', '2016-10-28 17:03:19', '', '菜单列表', '13', 'page', '/user/menu_list', '70');

-- ----------------------------
-- Table structure for org_role
-- ----------------------------
DROP TABLE IF EXISTS `org_role`;
CREATE TABLE `org_role` (
  `id` varchar(32) NOT NULL,
  `audit_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `delete_flag` varchar(1) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `code` varchar(128) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `role_name` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_role
-- ----------------------------
INSERT INTO `org_role` VALUES ('2c9025ab5a6f2b85015a6f2cef950000', null, '2017-02-24 16:11:40', '0', '2017-02-24 16:11:40', null, '可以分配后台用户', '权限管理员', null, '', null);
INSERT INTO `org_role` VALUES ('402881e457f075530157f0791e2f0000', null, '2016-10-23 15:37:31', '0', '2017-02-24 16:11:20', null, '拥有所有的权限', '超级管理员', null, 'role_admin', null);

-- ----------------------------
-- Table structure for org_role_resource_rel
-- ----------------------------
DROP TABLE IF EXISTS `org_role_resource_rel`;
CREATE TABLE `org_role_resource_rel` (
  `role_id` varchar(32) NOT NULL,
  `resources_id` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`,`resources_id`),
  KEY `FK_hpsdqtxbypycwcdrw23na40bp` (`resources_id`),
  CONSTRAINT `FK_ew2x71wsjwd939pdgqdsvnnsd` FOREIGN KEY (`role_id`) REFERENCES `org_role` (`id`),
  CONSTRAINT `FK_hpsdqtxbypycwcdrw23na40bp` FOREIGN KEY (`resources_id`) REFERENCES `org_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_role_resource_rel
-- ----------------------------
INSERT INTO `org_role_resource_rel` VALUES ('2c9025ab5a6f2b85015a6f2cef950000', '2c9025ab5adb1eef015adb2e74b90000');
INSERT INTO `org_role_resource_rel` VALUES ('2c9025ab5ada5755015ada59461d0000', '2c9025ab5adb1eef015adb2e74b90000');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '2c9025ab5adb1eef015adb2e74b90000');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '2c9025ab5adb1eef015adb32ffb90001');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '2c9025ab5adb1eef015adb36bac60002');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '2c9025ab5adb1eef015adb37ccd50003');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '2c9025ab5b140c22015b140fbbd30000');
INSERT INTO `org_role_resource_rel` VALUES ('2c9025ab5a6f2b85015a6f2cef950000', '70');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '70');
INSERT INTO `org_role_resource_rel` VALUES ('2c9025ab5a6f2b85015a6f2cef950000', '71');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '71');
INSERT INTO `org_role_resource_rel` VALUES ('2c9025ab5a6f2b85015a6f2cef950000', '72');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '72');
INSERT INTO `org_role_resource_rel` VALUES ('2c9025ab5a6f2b85015a6f2cef950000', '73');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '73');

-- ----------------------------
-- Table structure for org_user
-- ----------------------------
DROP TABLE IF EXISTS `org_user`;
CREATE TABLE `org_user` (
  `id` varchar(32) NOT NULL,
  `audit_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `delete_flag` varchar(1) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `real_name` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `current_skin` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_user
-- ----------------------------
INSERT INTO `org_user` VALUES ('2c9025ab5a6f14c2015a6f17caee0000', null, '2017-02-24 15:48:34', '0', '2017-03-27 15:01:12', null, '13202044010', '21218CCA77804D2BA1922C33E0151105', 'xujeff', '1', 'xujeff', '0', null);
INSERT INTO `org_user` VALUES ('4028821e5b7a6947015b7a6ebacf0000', null, '2016-08-17 15:17:02', '0', '2018-02-04 14:14:16', null, '13202044010', 'E10ADC3949BA59ABBE56E057F20F883E', '超级管理员', '1', 'admin', '0', 'skin_blue');

-- ----------------------------
-- Table structure for org_user_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `org_user_role_rel`;
CREATE TABLE `org_user_role_rel` (
  `user_id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_ikyyd9vv4u7y3m3yqvqo1vwdd` (`role_id`),
  CONSTRAINT `FK_92837trmh851io1pb73qjakvf` FOREIGN KEY (`user_id`) REFERENCES `org_user` (`id`),
  CONSTRAINT `FK_ikyyd9vv4u7y3m3yqvqo1vwdd` FOREIGN KEY (`role_id`) REFERENCES `org_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_user_role_rel
-- ----------------------------
INSERT INTO `org_user_role_rel` VALUES ('2c9025ab5a6f14c2015a6f17caee0000', '2c9025ab5a6f2b85015a6f2cef950000');
INSERT INTO `org_user_role_rel` VALUES ('4028821e5b7a6947015b7a6ebacf0000', '402881e457f075530157f0791e2f0000');

-- ----------------------------
-- Table structure for selectedcourse
-- ----------------------------
DROP TABLE IF EXISTS `selectedcourse`;
CREATE TABLE `selectedcourse` (
  `courseID` int(11) NOT NULL COMMENT '课程表id',
  `userID` int(11) NOT NULL COMMENT '用户id',
  KEY `courseID` (`courseID`),
  KEY `studentID` (`userID`),
  CONSTRAINT `selectedcourse_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `edu_course` (`id`),
  CONSTRAINT `selectedcourse_user_fk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户课程关系表';

-- ----------------------------
-- Records of selectedcourse
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `birth` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123', '2016-12-26', 'male', '34343@qw.com');
INSERT INTO `user` VALUES ('2', '123', '123', '2017-03-21', 'male', '2132@123');
INSERT INTO `user` VALUES ('3', '123232', '123', '2017-03-06', 'male', 'trytyt@wqew');
INSERT INTO `user` VALUES ('4', 's', 's', '2017-10-03', 'Female', '1220489@qq.com');
INSERT INTO `user` VALUES ('5', 'ss', '5s', '2016-10-03', 'Male', '1220489@qq.com');
INSERT INTO `user` VALUES ('6', 'sss', 'sss', '2017-10-03', 'Female', '1220489@qq.com');
INSERT INTO `user` VALUES ('7', '少时诵诗书', 's', '2017-10-02', 'Female', '1220489@qq.com');
INSERT INTO `user` VALUES ('10', 'ssssss', 'sssssss', '2017-10-31', 'Female', '1220489@qq.com');
