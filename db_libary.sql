/*
 Navicat Premium Data Transfer

 Source Server         : Java
 Source Server Type    : MySQL
 Source Server Version : 50149
 Source Host           : localhost:3306
 Source Schema         : db_libary

 Target Server Type    : MySQL
 Target Server Version : 50149
 File Encoding         : 65001

 Date: 09/03/2025 19:12:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `createtime` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_key`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '13086112233', 'erica2024@126.com', '2024-03-12 22:58:56', '2024-03-12 22:59:10', '81dc9bdb52d04dc20036dbd8313ed055', 1);
INSERT INTO `admin` VALUES (2, 'admin11', '18022334455', 'admin11@163.com', '2024-03-12 22:59:43', '2024-03-14 21:57:43', '81dc9bdb52d04dc20036dbd8313ed055', 0);

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `publish_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出版日期',
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '作者',
  `publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出版社',
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类',
  `book_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标准码',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '封面',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '数据挖掘', '从大量数据中挖掘知识', '2020-06-01', '张文祥', '清华大学出版社', '3', 'DSF:10001', 'https://img14.360buyimg.com/n0/jfs/t2554/167/928308693/253478/f67cc8a/56710412Na9eab184.jpg.avif', '2024-03-15 23:27:29', '2024-03-16 23:24:34');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `createtime` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '临床医学', '医学类', NULL, '2024-03-15 12:30:35', '2024-03-15 20:41:53');
INSERT INTO `category` VALUES (2, '外科学', '临床医学类', 1, '2024-03-15 20:56:48', NULL);
INSERT INTO `category` VALUES (3, '内科学', '临床医学类', 1, '2024-03-15 20:56:49', NULL);
INSERT INTO `category` VALUES (4, '口腔科', '临床医学类', 1, '2024-03-15 21:42:32', '2024-03-15 21:42:49');
INSERT INTO `category` VALUES (5, '计算机', '工学', NULL, '2024-03-15 21:46:12', NULL);
INSERT INTO `category` VALUES (6, '数据挖掘与模式识别', '计算机类', 5, '2024-03-15 22:02:15', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `createtime` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '陈文钦', 'cwq', 21, '男', '13599616147', '福建龙岩', '2024-03-08 10:40:03', '2024-03-08 10:40:07');
INSERT INTO `user` VALUES (2, '张三', 'zs', 23, '男', '10086111111', '福建福州', '2024-03-05 10:40:07', '2024-03-08 10:40:52');
INSERT INTO `user` VALUES (3, '王雯', 'ww', 19, '女', '18190000000', '浙江杭州', '2024-03-06 10:40:09', '2024-03-08 10:40:12');
INSERT INTO `user` VALUES (4, '罗萍', 'lp', 18, '女', '15159011111', '福建漳州', '2024-03-08 10:40:12', '2024-03-08 10:40:58');
INSERT INTO `user` VALUES (5, '张三', 'zs', 30, '男', '1000111111', '广东广州', '2024-02-07 10:40:22', '2024-03-08 10:40:40');
INSERT INTO `user` VALUES (6, '张三', 'zs', 30, '男', '1000111111', '广东广州', '2024-02-07 10:40:22', '2024-03-08 10:40:39');
INSERT INTO `user` VALUES (8, '张三', 'zs', 45, '男', '1000111111', '广东广州', '2024-02-07 10:40:26', '2024-03-08 10:40:31');
INSERT INTO `user` VALUES (10, '丽莎', 'zs', 30, '女', '1000111111', '广东广州', '2024-02-07 10:40:22', '2024-03-08 10:40:41');
INSERT INTO `user` VALUES (11, '张三', 'zs', 44, '男', '1000111111', '广东广州', '2024-02-07 10:40:22', '2024-03-08 10:40:42');
INSERT INTO `user` VALUES (12, '陈伟', 'zs', 23, '男', '1008611111', '广东深圳', '2024-02-07 10:40:22', '2024-03-08 10:40:45');
INSERT INTO `user` VALUES (14, '林赐', 'lc', 13, '女', '12345678900', '福建厦门', '2024-03-08 12:02:24', '2024-03-08 12:33:25');
INSERT INTO `user` VALUES (15, '小红', '202403086770688275', 15, '女', '12312312311', '北京海定', '2024-03-08 12:53:55', '2024-03-08 14:42:42');
INSERT INTO `user` VALUES (20, '崇文', '202403087834234123', 90, '男', '12345678901', '福建福州', '2024-03-08 13:13:24', '2024-03-12 22:10:35');
INSERT INTO `user` VALUES (21, '林云', '202403091878556215', 12, '女', '13113113113', '安徽合肥', '2024-03-09 21:54:44', '2024-03-09 21:54:56');

SET FOREIGN_KEY_CHECKS = 1;
