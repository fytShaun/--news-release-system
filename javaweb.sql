/*
 Navicat MySQL Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : javaweb

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 14/11/2023 10:09:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者/来源',
  `category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻类别',
  `cover_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻封面图片url',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻正文',
  `view_count` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '点击次数',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '发布日期',
  `updateTime` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`news_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (12, '今日任务', '123', '娱乐', 'upload/约尔.jpg', '上传桌面壁纸图片实验1', 42, '2023-05-23 19:15:10', '2023-06-13 14:26:26');
INSERT INTO `news` VALUES (15, '曹黎', '123', '生活', 'upload/IMG_20211115_205652.jpg', '曹黎付云天', 11, '2023-05-23 19:51:59', '2023-06-13 14:20:41');
INSERT INTO `news` VALUES (16, '付云天', '123', '生活', 'upload/1849302766.jpeg', '曹黎是乖乖', 5, '2023-05-23 19:53:09', '2023-05-30 13:51:27');
INSERT INTO `news` VALUES (20, '敏感词查询', '123', '生活', 'upload/IMG_20211110_174642.jpg', '****，犯罪，****，', 9, '2023-05-26 16:27:35', '2023-06-13 14:25:07');
INSERT INTO `news` VALUES (21, '王原', '123', '生活', 'upload/IMG_20220102_152630.jpg', '熊猫', 24, '2023-05-30 14:07:52', '2023-06-13 14:23:16');
INSERT INTO `news` VALUES (23, '测试测试', '123', '生活', 'upload/IMG_20211126_195143.jpg', 'text测试', 5, '2023-05-30 16:42:31', '2023-06-06 08:36:58');
INSERT INTO `news` VALUES (24, '12', NULL, '生活', 'upload/IMG_20211119_200121.jpg', '3', 0, '2023-05-30 17:10:51', NULL);
INSERT INTO `news` VALUES (25, '23', NULL, '生活', 'upload/IMG_20211110_174642.jpg', '1341421', 0, '2023-05-30 17:11:01', NULL);
INSERT INTO `news` VALUES (26, '32', NULL, '生活', 'upload/IMG_20211120_154723.jpg', '214124213', 0, '2023-05-30 17:11:10', NULL);
INSERT INTO `news` VALUES (27, '34', NULL, '生活', 'upload/IMG_20211120_154723.jpg', '43534343', 0, '2023-05-30 17:11:21', NULL);
INSERT INTO `news` VALUES (28, '45', NULL, '生活', 'upload/IMG_20211119_175021.jpg', '545454', 0, '2023-05-30 17:11:30', NULL);
INSERT INTO `news` VALUES (29, '654', NULL, '生活', 'upload/IMG_20211110_174641.jpg', '4535', 0, '2023-05-30 17:11:39', NULL);
INSERT INTO `news` VALUES (30, '9876', NULL, '生活', 'upload/IMG_20211120_163947.jpg', '56453', 0, '2023-05-30 17:11:46', NULL);
INSERT INTO `news` VALUES (31, '675432', NULL, '生活', 'upload/IMG_20211126_220015.jpg', '12346767231345', 1, '2023-05-30 17:11:54', '2023-05-30 18:38:02');
INSERT INTO `news` VALUES (32, '4324', '123', '生活', 'upload/IMG_20211110_174641', '123245321****', 1, '2023-05-30 19:17:41', '2023-06-27 17:31:10');
INSERT INTO `news` VALUES (33, '人机交互', NULL, '生活', 'upload/IMG_20211011_190442.jpg', '人机交互课', 2, '2023-05-30 19:18:31', '2023-05-30 19:20:01');
INSERT INTO `news` VALUES (34, '管理员', NULL, '生活', 'upload/IMG_20211119_200255.jpg', '管理员username', 0, '2023-05-30 19:20:24', NULL);
INSERT INTO `news` VALUES (35, '尼古拉丁真王源', '123', '生活', 'upload/IMG_20211220_191956.jpg', '对着镜子倾诉心事，这显示有些讽刺。', 3, '2023-05-30 19:25:03', '2023-06-13 14:24:38');
INSERT INTO `news` VALUES (36, '瑞克', '123', '生活', 'upload/IMG_20211127_183402.jpg', '在这么冷的天，想抽根电子烟', 0, '2023-05-30 19:25:38', NULL);
INSERT INTO `news` VALUES (37, 'php课', NULL, '生活', 'upload/IMG_20211120_164733.jpg', 'php实验', 2, '2023-06-01 16:42:25', '2023-06-01 16:43:06');
INSERT INTO `news` VALUES (38, '234354432', '123', '娱乐', 'upload/约尔.jpg', '2132421', 1, '2023-06-05 14:42:22', '2023-06-06 08:39:22');
INSERT INTO `news` VALUES (39, 'cccc', '123', '经济', 'upload/桌面壁纸.jpg', '2134521', 1, '2023-06-13 14:06:22', '2023-06-13 14:06:33');
INSERT INTO `news` VALUES (40, '2134332435', '321', '体育', 'upload/桌面壁纸.jpg', '2134365321', 0, '2023-06-13 14:20:23', NULL);
INSERT INTO `news` VALUES (41, '尼古拉丁真11111', NULL, '经济', 'upload/桌面壁纸.jpg', 'qweryt', 2, '2023-06-13 14:24:13', '2023-06-13 14:25:02');
INSERT INTO `news` VALUES (42, '1232133', NULL, '国际', 'upload/约尔.jpg', '****，213213213', 0, '2023-06-13 14:24:57', NULL);
INSERT INTO `news` VALUES (43, 'demo', NULL, '娱乐', 'upload/桌面壁纸.jpg', '213****', 1, '2023-06-13 14:25:25', '2023-06-13 14:25:29');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `gender` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `identity` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职业',
  `favor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '爱好',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '注册日期',
  `last_login_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最近登陆时间',
  `state` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '用户状态：0-禁用，1-正常',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('123', '123', NULL, 'manage', NULL, NULL, '2023-05-17 22:28:52', '2023-05-18 19:03:04', '1');
INSERT INTO `user` VALUES ('12345', '123', NULL, 'user', NULL, NULL, '2023-06-01 16:24:50', '2023-06-13 14:23:42', '0');
INSERT INTO `user` VALUES ('321', '321', NULL, 'user', NULL, NULL, '2023-05-18 08:29:20', '2023-06-13 08:43:12', '1');
INSERT INTO `user` VALUES ('cccc', '123', '男', 'user', NULL, NULL, '2023-06-13 14:05:11', NULL, '1');
INSERT INTO `user` VALUES ('fyt', '123', '女', 'user', NULL, NULL, '2023-06-13 14:22:37', NULL, '1');
INSERT INTO `user` VALUES ('啊啊啊', 'aaaa', '男', 'user', NULL, NULL, '2023-05-21 17:24:28', NULL, '1');

SET FOREIGN_KEY_CHECKS = 1;
