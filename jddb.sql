/*
 Navicat Premium Data Transfer

 Source Server         : jddb
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : jddb

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 20/08/2019 15:24:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for brand_info
-- ----------------------------
DROP TABLE IF EXISTS `brand_info`;
CREATE TABLE `brand_info`  (
  `brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `brand_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌名称',
  `brand_web` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌网址',
  `brand_logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌logo URL',
  `brand_desc` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌描述',
  PRIMARY KEY (`brand_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of brand_info
-- ----------------------------
INSERT INTO `brand_info` VALUES (1, '飘柔', '飘柔', '暂无', NULL);
INSERT INTO `brand_info` VALUES (2, '清扬', '清扬', '暂无', NULL);
INSERT INTO `brand_info` VALUES (3, '250牌', '250', '暂无', NULL);
INSERT INTO `brand_info` VALUES (13, '黑人', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (14, '戴森', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (15, '博朗', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (16, '曼秀雷敦', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (18, '床', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (19, '桌子', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (20, '衣柜', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (21, '沙发', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (22, '鞋柜', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (23, '花间集', '花间集', '暂无', NULL);
INSERT INTO `brand_info` VALUES (24, '春秋琉璃', '春秋琉璃', '暂无', NULL);
INSERT INTO `brand_info` VALUES (25, '竹青月季', '竹青月季', '暂无', NULL);
INSERT INTO `brand_info` VALUES (26, '上善若水', '上善若水', '暂无', NULL);
INSERT INTO `brand_info` VALUES (27, '铜福瑞', '铜福瑞', '暂无', NULL);
INSERT INTO `brand_info` VALUES (28, '枕头', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (29, '枕套', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (30, '床垫', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (31, '床单', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (32, '被子', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (33, '卡乐比', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (34, '费列罗', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (35, '梅府茗家', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (36, '雀巢（Nestle）', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (37, '金龙鱼', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (38, '苹果', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (39, '华为', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (40, '小米', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (41, 'OPPO ', NULL, NULL, NULL);
INSERT INTO `brand_info` VALUES (42, 'vivo', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for carrier
-- ----------------------------
DROP TABLE IF EXISTS `carrier`;
CREATE TABLE `carrier`  (
  `carrier_id` int(11) NOT NULL,
  `carrier_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`carrier_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of carrier
-- ----------------------------
INSERT INTO `carrier` VALUES (1, '京东快递');

-- ----------------------------
-- Table structure for customer_address
-- ----------------------------
DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE `customer_address`  (
  `customer_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `zip` smallint(50) NOT NULL,
  `province` smallint(50) NOT NULL,
  `city` smallint(50) NOT NULL,
  `detail` smallint(50) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`customer_address_id`) USING BTREE,
  INDEX `c_info_id`(`cid`) USING BTREE,
  CONSTRAINT `c_info_id` FOREIGN KEY (`cid`) REFERENCES `customer_info` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_balance
-- ----------------------------
DROP TABLE IF EXISTS `customer_balance`;
CREATE TABLE `customer_balance`  (
  `customer_balance_id` int(11) NOT NULL,
  `balance_money` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cid` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  PRIMARY KEY (`customer_balance_id`) USING BTREE,
  INDEX `c_b_id`(`cid`) USING BTREE,
  INDEX `c_b2_id`(`oid`) USING BTREE,
  CONSTRAINT `c_b2_id` FOREIGN KEY (`oid`) REFERENCES `order` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `c_b_id` FOREIGN KEY (`cid`) REFERENCES `customer_info` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_info
-- ----------------------------
DROP TABLE IF EXISTS `customer_info`;
CREATE TABLE `customer_info`  (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` decimal(15, 0) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `integral` int(5) NOT NULL DEFAULT 0,
  `balance` int(10) NOT NULL DEFAULT 0,
  `login_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`customer_id`) USING BTREE,
  INDEX `login_id`(`login_id`) USING BTREE,
  INDEX `level_id`(`level_id`) USING BTREE,
  CONSTRAINT `level_id` FOREIGN KEY (`level_id`) REFERENCES `customer_level` (`customer_level_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `login_id` FOREIGN KEY (`login_id`) REFERENCES `customer_login` (`customer_login_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer_info
-- ----------------------------
INSERT INTO `customer_info` VALUES (8, '驰骋天下', '男', 17806234955, '2226062736@qq.com', 0, 0, 21, 1);
INSERT INTO `customer_info` VALUES (9, '超哥无敌', '男', 15566668888, '123456@qq.com', 0, 0, 22, 1);
INSERT INTO `customer_info` VALUES (10, '打打', '女', 12344447777, '2226062736@qq.com', 0, 0, 23, 1);
INSERT INTO `customer_info` VALUES (11, '韩明细', '男', 12345678911, '1023355785@qq.com', 0, 0, 24, 1);
INSERT INTO `customer_info` VALUES (12, '韩明细', '男', 12345678944, '1023355789@qq.com', 0, 0, 25, 1);
INSERT INTO `customer_info` VALUES (13, '王平', '男', 18904326666, '1597788556@qq.com', 0, 0, 26, 1);
INSERT INTO `customer_info` VALUES (14, '陈三大', '男', 17855554444, '2222606@qq.com', 0, 0, 27, 1);
INSERT INTO `customer_info` VALUES (15, '就好', '男', 12345678945, '1023355889@qq.com', 0, 0, 28, 1);
INSERT INTO `customer_info` VALUES (16, '韩明熹', '男', 12378945678, '1023355789@qq.com', 0, 0, 29, 1);

-- ----------------------------
-- Table structure for customer_level
-- ----------------------------
DROP TABLE IF EXISTS `customer_level`;
CREATE TABLE `customer_level`  (
  `customer_level_id` int(11) NOT NULL,
  `level_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `min_point` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `max_point` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`customer_level_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer_level
-- ----------------------------
INSERT INTO `customer_level` VALUES (1, '会员', '111', '111');

-- ----------------------------
-- Table structure for customer_login
-- ----------------------------
DROP TABLE IF EXISTS `customer_login`;
CREATE TABLE `customer_login`  (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_login_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer_login
-- ----------------------------
INSERT INTO `customer_login` VALUES (21, 'cccc', '123456', '2019-08-19 18:56:37');
INSERT INTO `customer_login` VALUES (22, 'emily318', '123456', '2019-08-19 23:31:59');
INSERT INTO `customer_login` VALUES (23, 'vv123', '123456', '2019-08-20 08:45:14');
INSERT INTO `customer_login` VALUES (24, '123456', '123456', '2019-08-20 08:53:58');
INSERT INTO `customer_login` VALUES (25, '456789', '123456', '2019-08-20 09:02:50');
INSERT INTO `customer_login` VALUES (26, '777777', '123456', '2019-08-20 09:52:20');
INSERT INTO `customer_login` VALUES (27, 'ccccc', '123456', '2019-08-20 10:40:51');
INSERT INTO `customer_login` VALUES (28, '123123', '123456', '2019-08-20 14:41:01');
INSERT INTO `customer_login` VALUES (29, '123445', '123456', '2019-08-20 15:07:34');

-- ----------------------------
-- Table structure for distribution_mode
-- ----------------------------
DROP TABLE IF EXISTS `distribution_mode`;
CREATE TABLE `distribution_mode`  (
  `distribution_id` int(11) NOT NULL,
  `distribution_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`distribution_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of distribution_mode
-- ----------------------------
INSERT INTO `distribution_mode` VALUES (1, '送货上门');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(11) NOT NULL,
  `ship_id` int(11) NOT NULL,
  `pay_msg_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `fk_o_s_info`(`ship_id`) USING BTREE,
  INDEX `fk_o_p_info`(`pay_msg_id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `fk_o_p_info` FOREIGN KEY (`pay_msg_id`) REFERENCES `payment_info` (`pay_msg_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_o_s_info` FOREIGN KEY (`ship_id`) REFERENCES `shipping_info` (`ship_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (172481875, 1, 1, 8, '2019-08-20 14:46:52');
INSERT INTO `order` VALUES (242693870, 1, 1, 10, '2019-08-20 08:50:32');
INSERT INTO `order` VALUES (631624006, 1, 1, 11, '2019-08-20 10:10:59');
INSERT INTO `order` VALUES (699059103, 1, 1, 8, '2019-08-20 14:47:00');

-- ----------------------------
-- Table structure for order_cart
-- ----------------------------
DROP TABLE IF EXISTS `order_cart`;
CREATE TABLE `order_cart`  (
  `cart_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `customer_id` int(10) NOT NULL COMMENT '用户ID',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `product_amount` int(11) NOT NULL COMMENT '加入购物车商品数量',
  `price` decimal(8, 2) NOT NULL COMMENT '商品价格',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入购物车时间',
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `fk_p_info_o_cart`(`product_id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `fk_p_info_o_cart` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order_cart
-- ----------------------------
INSERT INTO `order_cart` VALUES (32, 9, 45, 4, 1399.00, '2019-08-20 00:20:20');
INSERT INTO `order_cart` VALUES (33, 10, 160, 30, 16999.00, '2019-08-20 08:49:57');
INSERT INTO `order_cart` VALUES (34, 10, 1, 4, 24.90, '2019-08-20 08:50:18');
INSERT INTO `order_cart` VALUES (41, 13, 151, 4, 2999.00, '2019-08-20 09:54:01');
INSERT INTO `order_cart` VALUES (43, 11, 153, 2, 3999.00, '2019-08-20 10:10:42');
INSERT INTO `order_cart` VALUES (45, 8, 159, 10, 5099.00, '2019-08-20 14:42:45');
INSERT INTO `order_cart` VALUES (47, 16, 1, 15, 24.90, '2019-08-20 15:11:18');
INSERT INTO `order_cart` VALUES (48, 8, 3, 4, 29.80, '2019-08-20 15:20:28');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_amount` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`order_detail_id`) USING BTREE,
  INDEX `fk_o_id_o`(`order_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `fk_o_id_o` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (95, 242693870, 160, 30);
INSERT INTO `order_detail` VALUES (96, 242693870, 1, 4);
INSERT INTO `order_detail` VALUES (105, 631624006, 153, 2);
INSERT INTO `order_detail` VALUES (107, 172481875, 159, 10);
INSERT INTO `order_detail` VALUES (108, 699059103, 159, 10);

-- ----------------------------
-- Table structure for payment_info
-- ----------------------------
DROP TABLE IF EXISTS `payment_info`;
CREATE TABLE `payment_info`  (
  `pay_msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_id` int(11) NOT NULL,
  `pay_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pay_msg_id`) USING BTREE,
  INDEX `fk_p_info_p_method`(`pay_id`) USING BTREE,
  CONSTRAINT `fk_p_info_p_method` FOREIGN KEY (`pay_id`) REFERENCES `payment_method` (`pay_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of payment_info
-- ----------------------------
INSERT INTO `payment_info` VALUES (1, 1, '2019-08-19 23:35:17');

-- ----------------------------
-- Table structure for payment_method
-- ----------------------------
DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE `payment_method`  (
  `pay_id` int(11) NOT NULL,
  `pay_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pay_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of payment_method
-- ----------------------------
INSERT INTO `payment_method` VALUES (1, '微信支付');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `category_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `parent_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父分类ID',
  `category_level` tinyint(4) NOT NULL DEFAULT 1 COMMENT '分类层级',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (1, '生活必备', 0, 1);
INSERT INTO `product_category` VALUES (2, '文体娱乐', 0, 1);
INSERT INTO `product_category` VALUES (3, '家庭影音', 0, 1);
INSERT INTO `product_category` VALUES (4, '电脑数码', 0, 1);
INSERT INTO `product_category` VALUES (5, '手机通讯', 0, 1);
INSERT INTO `product_category` VALUES (6, '生活用品', 1, 2);
INSERT INTO `product_category` VALUES (7, '家具', 1, 2);
INSERT INTO `product_category` VALUES (8, '室内装饰', 1, 2);
INSERT INTO `product_category` VALUES (9, '床上用品', 1, 2);
INSERT INTO `product_category` VALUES (10, '食品饮料', 1, 2);
INSERT INTO `product_category` VALUES (11, '智能手机', 5, 2);
INSERT INTO `product_category` VALUES (12, '家庭护理', 1, 2);
INSERT INTO `product_category` VALUES (13, '牙刷', 6, 3);
INSERT INTO `product_category` VALUES (14, '牙膏', 6, 3);
INSERT INTO `product_category` VALUES (15, '吹风机', 6, 3);
INSERT INTO `product_category` VALUES (16, '剃须刀', 6, 3);
INSERT INTO `product_category` VALUES (17, '洗面奶', 6, 3);
INSERT INTO `product_category` VALUES (18, '床', 7, 3);
INSERT INTO `product_category` VALUES (19, '桌子', 7, 3);
INSERT INTO `product_category` VALUES (20, '衣柜', 7, 3);
INSERT INTO `product_category` VALUES (21, '沙发', 7, 3);
INSERT INTO `product_category` VALUES (22, '鞋柜', 7, 3);
INSERT INTO `product_category` VALUES (23, '家居装饰', 8, 3);
INSERT INTO `product_category` VALUES (24, '桌面摆件', 8, 3);
INSERT INTO `product_category` VALUES (25, '落地摆件', 8, 3);
INSERT INTO `product_category` VALUES (26, '婚庆摆件', 8, 3);
INSERT INTO `product_category` VALUES (27, '车挂摆件', 8, 3);
INSERT INTO `product_category` VALUES (28, '枕头', 9, 3);
INSERT INTO `product_category` VALUES (29, '枕套', 9, 3);
INSERT INTO `product_category` VALUES (30, '床垫', 9, 3);
INSERT INTO `product_category` VALUES (31, '床单', 9, 3);
INSERT INTO `product_category` VALUES (32, '被子', 9, 3);
INSERT INTO `product_category` VALUES (33, '进口食品', 10, 3);
INSERT INTO `product_category` VALUES (34, '休闲食品', 10, 3);
INSERT INTO `product_category` VALUES (35, '茗茶', 10, 3);
INSERT INTO `product_category` VALUES (36, '饮料冲调', 10, 3);
INSERT INTO `product_category` VALUES (37, '粮油调味', 10, 3);
INSERT INTO `product_category` VALUES (38, '苹果手机', 11, 3);
INSERT INTO `product_category` VALUES (39, '华为手机', 11, 3);
INSERT INTO `product_category` VALUES (40, '小米手机', 11, 3);
INSERT INTO `product_category` VALUES (41, 'OPPO ', 11, 3);
INSERT INTO `product_category` VALUES (42, 'vivo', 11, 3);
INSERT INTO `product_category` VALUES (43, '不智能手机', 5, 2);
INSERT INTO `product_category` VALUES (44, '小灵通', 5, 2);
INSERT INTO `product_category` VALUES (45, '大哥大', 5, 2);
INSERT INTO `product_category` VALUES (46, '传呼机', 5, 2);

-- ----------------------------
-- Table structure for product_comment
-- ----------------------------
DROP TABLE IF EXISTS `product_comment`;
CREATE TABLE `product_comment`  (
  `comment_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '商品ID',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单ID',
  `customer_id` int(11) NOT NULL COMMENT '用户ID',
  `content` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `audit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `fk_p_comment_info`(`product_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `product_comment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_comment_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_comment_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评论表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_comment
-- ----------------------------
INSERT INTO `product_comment` VALUES (1, 1, NULL, 8, '很棒的一次购买体验，以后还会再来的！', '2019-08-20 00:25:38');
INSERT INTO `product_comment` VALUES (2, 1, NULL, 9, '黑人牙刷！用过都说好！！', '2019-08-20 00:27:16');

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info`  (
  `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `product_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `brand_id` int(10) UNSIGNED NOT NULL COMMENT '品牌表的ID',
  `one_category_id` smallint(5) UNSIGNED NOT NULL COMMENT '一级分类ID',
  `two_category_id` smallint(5) UNSIGNED NOT NULL COMMENT '二级分类ID',
  `three_category_id` smallint(5) UNSIGNED NOT NULL COMMENT '三级分类ID',
  `price` decimal(8, 2) NOT NULL COMMENT '商品销售价格',
  `descript` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品描述',
  `sales_volume` int(10) NOT NULL DEFAULT 0 COMMENT '销量',
  `advertising_fees` int(10) NOT NULL DEFAULT 0 COMMENT '广告费',
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `fk_p_info_b_info`(`brand_id`) USING BTREE,
  INDEX `fk_p_info1_p_category`(`one_category_id`) USING BTREE,
  INDEX `fk_p_info2_p_category`(`two_category_id`) USING BTREE,
  INDEX `fk_p_info3_p_category`(`three_category_id`) USING BTREE,
  CONSTRAINT `fk_p_info1_p_category` FOREIGN KEY (`one_category_id`) REFERENCES `product_category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_p_info2_p_category` FOREIGN KEY (`two_category_id`) REFERENCES `product_category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_p_info3_p_category` FOREIGN KEY (`three_category_id`) REFERENCES `product_category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_p_info_b_info` FOREIGN KEY (`brand_id`) REFERENCES `brand_info` (`brand_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES (1, '黑人牙刷', 13, 1, 6, 13, 24.90, '黑人（DARLIE）炭丝高密软毛成人牙刷*4 柔软刷毛', 10, 200000);
INSERT INTO `product_info` VALUES (2, '高露洁牙刷', 13, 1, 6, 13, 9.90, '高露洁（Colgate） 适齿炭牙刷 软毛 4支 （炫彩刷柄 软毛深洁）（新', 20, 0);
INSERT INTO `product_info` VALUES (3, '佳洁士牙刷', 13, 1, 6, 13, 29.80, 'UPURITY 成人超细软毛简装牙刷 防出血小头日系牙刷6只装ORISIMP系', 30, 0);
INSERT INTO `product_info` VALUES (4, '小米电动牙刷', 13, 1, 6, 13, 179.00, '米家 （MIJIA ）小米声波电动牙刷成人充电式磁悬浮声波震动马达 可替换刷头 智', 22, 0);
INSERT INTO `product_info` VALUES (5, '黑人牙刷', 13, 1, 6, 13, 9.90, '黑人（DARLIE）炭丝深洁牙刷2支 细软刷毛 备长炭刷毛 深入洁净 呵护', 33, 0);
INSERT INTO `product_info` VALUES (6, '黑人炭丝深洁牙刷', 13, 1, 6, 13, 16.90, '黑人（DARLIE）炭丝深洁（标准刷头）牙刷4支 软毛牙刷 减少牙菌斑 ', 55, 0);
INSERT INTO `product_info` VALUES (7, '黑人美白牙膏', 13, 1, 6, 14, 38.90, '黑人（DARLIE）超白美白牙膏套装 亮白牙齿深层清洁（竹炭深洁120g*4+炭丝深', 0, 0);
INSERT INTO `product_info` VALUES (8, '云南白药牙膏', 13, 1, 6, 14, 28.30, '云南白药 牙膏 180g （留兰香型）新老包装随机发货 呵护夏日,年轻不', 0, 0);
INSERT INTO `product_info` VALUES (9, '狮王牙膏', 13, 1, 6, 14, 39.00, '狮王(Lion)White&white美白牙膏150g×3(日本原装进口) 呵护夏日,年轻', 66, 0);
INSERT INTO `product_info` VALUES (10, '黑人牙膏', 13, 1, 6, 14, 15.90, '黑人（DARLIE）双重薄荷清新口气牙膏225g 防蛀固齿防口气 (新老包装', 0, 0);
INSERT INTO `product_info` VALUES (11, '云南白药环保牙膏', 13, 1, 6, 14, 69.00, '云南白药 环保牙膏4支装 益生菌 (晨露100g×2+益优冰柠105g+益优薄', 0, 0);
INSERT INTO `product_info` VALUES (12, '云南白药套装', 13, 1, 6, 14, 89.00, '云南白药 人气3+2牙膏套装 (留兰香180g+薄荷清爽185g+冬青香', 0, 0);
INSERT INTO `product_info` VALUES (13, '戴森吹风机', 14, 1, 6, 15, 2990.00, '戴森(Dyson) 吹风机【升级版上市!】Dyson Supersonic 电吹风 进口家', 0, 0);
INSERT INTO `product_info` VALUES (14, '飞科吹风机', 14, 1, 6, 15, 49.90, '飞科(FLYCO)电吹风机家用FH6232大功率吹风筒 2000W 【疯抢价49.9元，改变秀', 0, 0);
INSERT INTO `product_info` VALUES (15, '京东吹风机', 14, 1, 6, 15, 299.00, '京东京造 智能负离子电吹风太空灰 高压负离子大风量快干 冷热恒温风', 0, 0);
INSERT INTO `product_info` VALUES (16, '戴森吹风机', 14, 1, 6, 15, 2950.00, '戴森(Dyson) 吹风机 Dyson Supersonic 电吹风 进口家用 HD01 紫红色【官方正', 0, 0);
INSERT INTO `product_info` VALUES (17, '飞科吹风机', 14, 1, 6, 15, 69.90, '飞科(FLYCO)电吹风机家用FH6218大功率吹风筒负离子 2000W 【优惠价69.9元，', 0, 0);
INSERT INTO `product_info` VALUES (18, '小米吹风机', 14, 1, 6, 15, 179.00, '小米生态链 直白吹风机家用 负离子恒温护发大功率速干 【直白京东自营！网红推', 0, 0);
INSERT INTO `product_info` VALUES (19, '博朗剃须刀', 15, 1, 6, 16, 299.00, '博朗（BRAUN）电动剃须刀全身水洗往复式刮胡刀德国进口三刀头3系3000s温和剃', 0, 0);
INSERT INTO `product_info` VALUES (20, '飞利浦剃须刀', 15, 1, 6, 16, 219.00, '飞利浦（PHILIPS）男士电动剃须刀全身水洗干湿双剃剃胡刀胡须刀刮胡', 0, 0);
INSERT INTO `product_info` VALUES (21, '飞科剃须刀', 15, 1, 6, 16, 99.00, '飞科(FLYCO) 男士电动剃须刀 三刀头全身水洗干湿双剃刮胡刀 FS372 【惊爆价，', 0, 0);
INSERT INTO `product_info` VALUES (22, '博朗剃须刀', 15, 1, 6, 16, 1199.00, '博朗（BRAUN）电动剃须刀7系7840S德国进口全身水洗刮胡须刀（智', 0, 0);
INSERT INTO `product_info` VALUES (23, '米家剃须刀', 15, 1, 6, 16, 179.00, '米家（MIJIA）小米 米家电动剃须刀 全身可水洗 快速充电 三刀头多向浮动 双层剃', 0, 0);
INSERT INTO `product_info` VALUES (24, '飞利浦剃须刀', 15, 1, 6, 16, 579.00, '飞利浦（PHILIPS）男士电动剃须刀多功能理容剃胡刀胡须刀刮胡刀礼盒装（配胡', 0, 0);
INSERT INTO `product_info` VALUES (25, '曼秀雷敦洗面奶', 16, 1, 6, 17, 29.90, '曼秀雷敦男士控油抗痘洁面乳150ml 男士洗面奶（去黑头去油祛痘 淡化痘印美白护', 0, 0);
INSERT INTO `product_info` VALUES (26, '欧莱雅洗面奶', 16, 1, 6, 17, 65.00, '欧莱雅LOREAL 男士控油炭爽抗黑头洁面套装（洁面膏100mlx2+洁面50mlx2）', 0, 0);
INSERT INTO `product_info` VALUES (27, '芙丽芳丝', 16, 1, 6, 17, 150.00, '芙丽芳丝（freeplus）净润洗颜泡沫150ml（洗面奶 氨基酸系 丰富泡沫 ', 0, 0);
INSERT INTO `product_info` VALUES (28, '资生堂洗面奶', 16, 1, 6, 17, 51.00, '资生堂珊珂（SENKA）绵润泡沫洁面乳120g（日本进口洗面奶 深层清', 0, 0);
INSERT INTO `product_info` VALUES (29, '芙丽芳丝洗面奶', 16, 1, 6, 17, 150.00, '芙丽芳丝（freeplus）净润洗面霜100g（洗面奶洁面乳 男女适用 氨基酸系 ', 0, 0);
INSERT INTO `product_info` VALUES (30, '马丁洗面奶', 16, 1, 6, 17, 49.80, '马丁男士古龙香氛洗面奶男士竹炭控油去黑头洁面乳150ml 【抢149减100神券，', 0, 0);
INSERT INTO `product_info` VALUES (31, '温斯丹尼床', 18, 1, 7, 18, 2430.00, '布艺床 北欧床现代简约实木双人床高箱储物床卧室家具婚床全拆洗床1.8M 2109 单床(进口仿羊绒棉麻面料) 1800*2000(框架款 标准版)\r\n北欧床现代简约实木双人床高箱储物床卧', 0, 0);
INSERT INTO `product_info` VALUES (32, '北欧实木床', 18, 1, 7, 18, 499.00, '北欧实木床1.8米双人床1.5米单人床1.2米1.35米床', 0, 0);
INSERT INTO `product_info` VALUES (33, '和谐家园实木床', 18, 1, 7, 18, 4780.00, '北欧轻奢新中式实木卧室家具婚床双人床1.8储物高箱床1.5米', 0, 0);
INSERT INTO `product_info` VALUES (34, '布雷格床', 18, 1, 7, 18, 2399.00, '简约北欧双人床高箱储物板式床带皮质软靠带抽屉大婚床', 0, 0);
INSERT INTO `product_info` VALUES (35, '鲁菲特床', 18, 1, 7, 18, 3899.00, '现代中式1.5米实木床1.8米实木双人大婚床', 0, 0);
INSERT INTO `product_info` VALUES (36, '梦美斯宣美式床', 18, 1, 7, 18, 8160.00, '真皮床 1.8m双人床 简美卧室家具田园乡村婚床', 0, 0);
INSERT INTO `product_info` VALUES (37, '迈亚家具桌', 19, 1, 7, 19, 65.00, '折叠桌办公桌会议桌培训桌长条桌子折叠餐桌学习电脑桌子', 0, 0);
INSERT INTO `product_info` VALUES (38, '家乐铭品桌', 19, 1, 7, 19, 159.00, '电脑桌书桌 钢木办公桌1.2米加宽加大加固', 0, 0);
INSERT INTO `product_info` VALUES (39, '蔓斯菲尔桌', 19, 1, 7, 19, 138.00, '电脑桌台式家用简约现代笔记本简易书桌办公桌子', 0, 0);
INSERT INTO `product_info` VALUES (40, '简易餐桌', 19, 1, 7, 19, 223.00, '现代小户型家用简易餐桌椅吃饭桌', 0, 0);
INSERT INTO `product_info` VALUES (41, '床上电脑桌', 19, 1, 7, 19, 65.00, '学生宿舍神器懒人床上桌可折叠', 0, 0);
INSERT INTO `product_info` VALUES (42, '恬梦桌', 19, 1, 7, 19, 100.00, '北欧实木电脑桌现代简约办公桌', 0, 0);
INSERT INTO `product_info` VALUES (43, '巧依衣柜', 20, 1, 7, 20, 438.00, '简约2门现代衣橱木质两门实用型移门衣柜卧室储物柜子', 0, 0);
INSERT INTO `product_info` VALUES (44, '尚品宅配 定制衣柜', 20, 1, 7, 20, 1000.00, '现代简约百叶大衣柜 推拉门衣柜', 0, 0);
INSERT INTO `product_info` VALUES (45, '木月家具衣柜', 20, 1, 7, 20, 1399.00, '拉门衣柜组合 木质衣橱卧室整体衣柜', 0, 0);
INSERT INTO `product_info` VALUES (46, '智慧多衣柜', 20, 1, 7, 20, 169.00, '带抽屉布艺衣柜加粗钢管大容量宿舍加固防尘双人简易衣橱', 0, 0);
INSERT INTO `product_info` VALUES (47, '丽维家 衣柜', 20, 1, 7, 20, 1000.00, '定制衣柜 卧室整体衣帽间', 0, 0);
INSERT INTO `product_info` VALUES (48, '满屋星 衣柜', 20, 1, 7, 20, 198.00, '钢管简易衣柜加固双人铁艺折叠牛津布组合衣柜', 0, 0);
INSERT INTO `product_info` VALUES (49, '和谐家园 沙发', 21, 1, 7, 21, 3840.00, '实木沙发新中式北欧客厅家具布艺沙发转角组合', 0, 0);
INSERT INTO `product_info` VALUES (50, '栢菲莱斯 沙发', 21, 1, 7, 21, 7250.00, '美式真皮沙发客厅整装组合家具', 0, 0);
INSERT INTO `product_info` VALUES (51, '帝吉尼沙发', 21, 1, 7, 21, 7972.00, '美式复古雕花简约实木别墅家具', 0, 0);
INSERT INTO `product_info` VALUES (52, '梦美斯宣 欧式沙发', 21, 1, 7, 21, 7220.00, '头层黄牛皮实木沙发雕花 别墅客厅皮艺沙发', 0, 0);
INSERT INTO `product_info` VALUES (53, '欧蒂家居 沙发', 21, 1, 7, 21, 4999.00, '布艺沙发床可拆洗现代简约实木组合', 0, 0);
INSERT INTO `product_info` VALUES (54, '精冠沙发', 21, 1, 7, 21, 1500.00, '现代简约美式布艺沙发床', 0, 0);
INSERT INTO `product_info` VALUES (55, '雅美乐 鞋柜', 22, 1, 7, 22, 250.00, '大容量超薄简易简约 鞋架', 0, 0);
INSERT INTO `product_info` VALUES (56, '亿家达 鞋架', 22, 1, 7, 22, 99.00, '多层简易鞋柜 防尘鞋架子', 0, 0);
INSERT INTO `product_info` VALUES (57, '满屋星 鞋柜', 22, 1, 7, 22, 128.00, '牛津布鞋架创意多层玄关大容量鞋架', 0, 0);
INSERT INTO `product_info` VALUES (58, '蔻丝鞋柜', 22, 1, 7, 22, 99.00, '组合简易鞋柜现代简约塑料防尘鞋架', 0, 0);
INSERT INTO `product_info` VALUES (59, '日本鞋子收纳架', 22, 1, 7, 22, 14.00, ' 家用双层塑料鞋托', 0, 0);
INSERT INTO `product_info` VALUES (60, '耐家鞋架', 22, 1, 7, 22, 86.00, '多层鞋架家用简易门口鞋柜收纳经济型省空间简约现代防尘小鞋架', 0, 0);
INSERT INTO `product_info` VALUES (61, '金色母子大象装饰', 23, 1, 8, 23, 333.00, '琉璃马摆件马到成功飞马风水客厅家居装饰礼品创意工艺品 小号含底座(彩色)', 0, 0);
INSERT INTO `product_info` VALUES (62, '琉璃飞马装饰', 23, 1, 8, 23, 89.00, '花间集 大象工艺品摆件家居装饰品客厅玄关摆件乔迁礼物送朋友送领导 金色母子大象HS16B02G', 0, 0);
INSERT INTO `product_info` VALUES (63, '斗战胜佛摆件装饰', 23, 1, 8, 23, 198.00, '斗战胜圣佛汽车摆件孙悟空齐天大圣摆件创意个性汽车孙悟空车载摆件齐天大圣车内装饰家居装饰品 ', 0, 0);
INSERT INTO `product_info` VALUES (64, '纯铜牛摆件装饰', 23, 1, 8, 23, 298.00, '纯铜牛摆件招财金牛华尔街牛转乾坤家居装饰客厅办公室桌面店铺开业风水牛工艺礼品摆设 ', 0, 0);
INSERT INTO `product_info` VALUES (65, '纯铜聚宝盆摆件装饰', 23, 1, 8, 23, 658.00, '纯铜聚宝盆摆件 实心黄铜元宝如意聚宝盆家居装饰品摆设 工艺品聚宝盆存钱罐 四号直径18厘米 ', 0, 0);
INSERT INTO `product_info` VALUES (66, '黄铜公鸡摆件装饰', 23, 1, 8, 23, 59.00, '黄铜公鸡摆件铜鸡家居摆设生肖鸡家居装饰品铜工艺品 中号福字鸡高约20cm', 0, 0);
INSERT INTO `product_info` VALUES (67, '木制帆船装饰', 24, 1, 8, 24, 59.00, '木制帆船33cm深蓝色2050 客厅酒柜电视柜摆件家居装饰品手工艺品 海洋创意小摆件办公室帆船模型 ', 0, 0);
INSERT INTO `product_info` VALUES (68, '香薰精油小摆件装饰', 24, 1, 8, 24, 59.00, '卧室装饰无火无烟香薰室内客厅电视柜摆设居家香薰精油小摆件套装 绿色款 ', 0, 0);
INSERT INTO `product_info` VALUES (69, '仿真迎客松盆景装饰', 24, 1, 8, 24, 950.00, '新中式仿真迎客松盆景植物室内客厅软装装饰品绿植桌面摆件 绿色', 0, 0);
INSERT INTO `product_info` VALUES (70, '哮天将艺术品装饰', 24, 1, 8, 24, 3888.00, '行走的斑马都岩哮天将艺术品别墅装饰大摆件现代室内软装雕塑 ', 0, 0);
INSERT INTO `product_info` VALUES (71, '沙漏计时器装饰', 24, 1, 8, 24, 29.90, '沙漏计时器儿童防摔时间30分钟摆件创意家居装饰个性生日礼物漏沙流沙 水果沙漏西瓜红 ', 0, 0);
INSERT INTO `product_info` VALUES (72, '陶瓷天鹅装饰', 24, 1, 8, 24, 950.00, '欧式摆件陶瓷天鹅家居装饰品客厅电视柜红酒架酒柜博古架摆设 ', 0, 0);
INSERT INTO `product_info` VALUES (73, '斑马回眸装饰', 25, 1, 8, 25, 99999.00, '斑马回眸限量定制刻字增值收藏雕塑室内软装艺术礼品 白色 ', 0, 0);
INSERT INTO `product_info` VALUES (74, '阳台假山鱼池装饰', 25, 1, 8, 25, 2769.00, '阳台假山鱼池风水轮客厅室内流水喷泉鱼缸装饰造景大摆件落地 R01-1小号假山 ', 0, 0);
INSERT INTO `product_info` VALUES (75, '发财树仿真植物盆栽装饰', 25, 1, 8, 25, 394.50, '假树发财树仿真植物盆栽室内装饰塑料花摆件客厅大型绿植落地盆景 1.8米发财+盆', 0, 0);
INSERT INTO `product_info` VALUES (76, ' 日式庭院石雕小和尚装饰', 25, 1, 8, 25, 1422.00, '日式庭院石雕小和尚摆件户外石佛像禅意小沙弥枯山水造景室内装饰 祈祷和尚（平安祝福）', 0, 0);
INSERT INTO `product_info` VALUES (77, '招财禅意流水摆件装饰', 25, 1, 8, 25, 2439.00, '锦庐 办公室内客厅摆件工艺品乔迁新家居装饰开业摆件 招财禅意流水摆件 青蓝色 ', 0, 0);
INSERT INTO `product_info` VALUES (78, '中式流水喷泉装饰', 25, 1, 8, 25, 1398.00, '风水轮摆件假山中式流水喷泉招财客厅加湿器金鱼池开业礼品聚宝盆店铺会所装饰品摆设室内玄关创意 聚宝盆整套55*55*150 ', 0, 0);
INSERT INTO `product_info` VALUES (79, '百年好合装饰', 26, 1, 8, 26, 59.00, '新婚摆件家居装饰品 百年好合 喜庆环保树脂工艺品摆件婚庆娃娃结婚摆件新婚贺礼结婚礼物', 0, 0);
INSERT INTO `product_info` VALUES (80, '牡丹花盘摆件装饰', 26, 1, 8, 26, 3588.00, '枫岚情新婚礼物牡丹花盘摆件绒沙金工艺品风水摆设办公室客厅创意家居装饰乔迁礼品 花开富贵 ', 0, 0);
INSERT INTO `product_info` VALUES (81, '牡丹龙凤红盘装饰', 26, 1, 8, 26, 800.00, '牡丹龙凤红盘新中式厦门漆线雕陶瓷工艺品摆件客厅摆设家居装饰品送朋友送闺蜜结婚高档礼物 8吋（20厘米）', 0, 0);
INSERT INTO `product_info` VALUES (82, '鱼水情装饰', 26, 1, 8, 26, 3158.00, '送朋友新婚礼物鱼水情婚庆摆件礼品玉石雕刻工艺品结婚送礼家居装饰婚房摆设 YSY天然白玉鱼水情', 0, 0);
INSERT INTO `product_info` VALUES (83, '白头偕老装饰', 26, 1, 8, 26, 1888.00, '绒沙金摆件白头偕老创意金婚纪念日礼物家居装饰工艺品黄金摆设', 0, 0);
INSERT INTO `product_info` VALUES (84, '心心相印装饰', 26, 1, 8, 26, 5088.00, '高档结婚礼物心心相印欧式家居装饰送闺蜜立体金箔画结婚礼品摆件 心心相印', 0, 0);
INSERT INTO `product_info` VALUES (85, '琉璃一桶金装饰', 27, 1, 8, 27, 128.00, '汽车挂件琉璃一桶金车挂挂饰室内挂件挂件车内吊坠饰品摆件吊饰聚宝盆', 0, 0);
INSERT INTO `product_info` VALUES (86, '原木古香挂件', 27, 1, 8, 27, 128.00, '黄杨木莲花崖柏珠原木古香挂件汽车挂件符车载装饰品吊饰男女吊饰挂饰室内车内后视镜莲花摆件', 0, 0);
INSERT INTO `product_info` VALUES (87, '铜钱葫芦装饰', 27, 1, 8, 27, 68.80, '五帝钱六帝钱十帝钱铜钱葫芦汽车挂件家居装饰品风水摆件工艺礼品 五帝钱', 0, 0);
INSERT INTO `product_info` VALUES (88, '紫铜貔貅装饰', 27, 1, 8, 27, 389.00, '紫铜貔貅镇纸家居装饰品客厅办公室摆设把玩件工艺品汽车挂件小摆件 创意礼品把玩件 ', 0, 0);
INSERT INTO `product_info` VALUES (89, '铜铃铛 装饰', 27, 1, 8, 27, 36.00, '铜铃铛 风铃挂件风水摆件家居装饰工艺礼品茶马驼铃民族风门铃窗台凉亭复古家具装品', 0, 0);
INSERT INTO `product_info` VALUES (90, '斗战胜佛装饰', 27, 1, 8, 27, 126.00, '斗战胜佛紫砂孙悟空齐天大圣中式禅意工艺品鱼缸摆件客厅家居装饰品 自在齐天大圣 ', 0, 0);
INSERT INTO `product_info` VALUES (91, '泰国乳胶枕头', 28, 1, 9, 28, 139.00, '睡眠博士（AiSleep）泰国进口天然乳胶枕波浪乳胶枕头 夏季透气枕芯 健康颈椎枕 泰国直采', 20000, 500);
INSERT INTO `product_info` VALUES (92, '丝绒枕头', 28, 1, 9, 28, 29.90, '南极人（NanJiren）枕芯 高弹丝绒安睡枕头 单个装 灰色', 15000, 200);
INSERT INTO `product_info` VALUES (93, '竹炭枕头', 28, 1, 9, 28, 49.90, '南极人（NanJiren）竹炭记忆枕头枕芯 慢回弹太空记忆棉成人颈椎睡眠学', 20000, 600);
INSERT INTO `product_info` VALUES (94, '高弹枕头', 28, 1, 9, 28, 23.90, '雅鹿 枕头 高弹羽丝绒枕头枕芯 酒店安睡枕 小金鱼 45*70cm（一只装）', 25000, 250);
INSERT INTO `product_info` VALUES (95, '成人枕头', 28, 1, 9, 28, 159.00, '富安娜家纺 枕头芯颈椎枕决明子草本枕芯 成人枕头套装 决明子健康舒睡枕芯一对装 74*48cm 白色', 30000, 400);
INSERT INTO `product_info` VALUES (96, '保健枕头', 28, 1, 9, 28, 679.00, 'JAHVERY嘉唯枕头记忆枕颈椎枕 高低悬浮工学护颈枕 颈椎支撑深度睡眠呵护枕芯 高低双向枕 II系 高度9/7cm', 10000, 900);
INSERT INTO `product_info` VALUES (97, '月亮枕套', 29, 1, 9, 29, 19.90, '艾薇（AVIVI）全棉枕套40支纯棉斜纹印花枕头套1个装48 74迷离夜色', 50000, 200);
INSERT INTO `product_info` VALUES (98, '条纹枕套', 29, 1, 9, 29, 29.90, '九洲鹿家纺 全棉枕套 高支高密斜纹枕头套枕芯套 悠闲时光 一对装(2个) 48x74cm', 60000, 150);
INSERT INTO `product_info` VALUES (99, '小鲸鱼枕套', 29, 1, 9, 29, 39.90, '南极人（NanJiren）枕套 纯棉枕芯套全棉枕头套 一对装 小鲸鱼 48*74cm', 55000, 650);
INSERT INTO `product_info` VALUES (100, '梅花枕套', 29, 1, 9, 29, 36.00, '艾薇 枕套家纺 全棉枕套 40支纯棉斜纹印花枕头套 一对装 漫花语梦 48*74cm', 40000, 700);
INSERT INTO `product_info` VALUES (101, '小三角枕套', 29, 1, 9, 29, 17.90, '九洲鹿 枕套家纺 全棉枕套 纯棉斜纹枕头套枕芯套 思绪 48*74cm', 35000, 230);
INSERT INTO `product_info` VALUES (102, '蚕丝枕套', 29, 1, 9, 29, 198.00, '百年六合 双面真丝枕套 100%桑蚕丝枕套 单人提花丝绸枕头套 尺寸可定做 单只装 寒心香暗 48*74cm', 12000, 980);
INSERT INTO `product_info` VALUES (103, '椰棕乳胶床垫', 30, 1, 9, 30, 446.00, '法瑞思 椰棕床垫 偏硬护脊床垫棕垫定做 乳胶棕榈薄榻榻米床垫定制1.2/1.35/1.5/1.8米 6CM厚（棉针织面料+3CM环保椰棕） 0.8米*2米', 5000, 450);
INSERT INTO `product_info` VALUES (104, '静音床垫', 30, 1, 9, 30, 2599.00, '喜临门床垫 进口乳胶椰棕床垫 独立袋装弹簧软硬两用美姿静音床垫 蝶梦 1800*2000', 8000, 1200);
INSERT INTO `product_info` VALUES (105, '弹簧床垫', 30, 1, 9, 30, 799.00, '宜眠坊（ESF）床垫 席梦思弹簧床垫 软硬适中 J01 1.8*2.0*0.2米', 9000, 400);
INSERT INTO `product_info` VALUES (106, '双人床垫', 30, 1, 9, 30, 4399.00, '慕思（de RUCCI） 床垫 独立筒袋装弹簧乳胶床垫 双人弹簧床垫 1800*2000（邂逅款）', 13000, 580);
INSERT INTO `product_info` VALUES (107, '3D床垫', 30, 1, 9, 30, 1799.00, '喜临门 3D椰棕床垫 邦尼尔弹簧床垫 席梦思床垫 极光白 1800*2000', 6000, 100);
INSERT INTO `product_info` VALUES (108, '亚麻床垫', 30, 1, 9, 30, 558.00, '菲欧丽 椰棕床垫棕垫1.2/1.35/1.5/1.8米 天然乳胶床垫定制折叠榻榻米薄棕榈硬床垫 6CM厚(亚麻面料+3CM环保椰棕) 0.8米*2米', 8000, 230);
INSERT INTO `product_info` VALUES (109, '寝室床单', 31, 1, 9, 31, 27.00, '喜寝来宿舍床单 床单单件1.0/1.2米被单床单枕套单人双人床1.8米加大1.5m非纯棉全棉 灰色皇冠 120x230cm单床单（适用上下铺）', 50000, 600);
INSERT INTO `product_info` VALUES (110, '全棉床单', 31, 1, 9, 31, 69.00, '北极绒 全棉床单单件 纯棉被单双人床罩席梦思保护套 爱巢 230*250cm 1.5/1.8米床', 20000, 100);
INSERT INTO `product_info` VALUES (111, '小三角床单', 31, 1, 9, 31, 35.90, '迎馨家纺 单人全棉床单斜纹印花学生宿舍纯棉床单单件夏天床上用品床品套件1.2米床 155*230cm 爱巢A版', 15000, 100);
INSERT INTO `product_info` VALUES (112, '纯色床单', 31, 1, 9, 31, 39.00, '雅鹿·自由自在 床单家纺 纯色活性印花亲肤被单单件 180*230cm 浅灰', 16000, 100);
INSERT INTO `product_info` VALUES (113, '印花床单', 31, 1, 9, 31, 69.00, '艾薇 床单家纺 全棉斜纹印花床单 纯棉床单 单件 青馨花园 1.5米/1.8米床 230*250cm', 14000, 100);
INSERT INTO `product_info` VALUES (114, '卡通床单', 31, 1, 9, 31, 49.00, '艾薇 床单家纺 纯棉被单 单人学生宿舍全棉床单 单件 小鹿 1/1.2米床 152*210cm', 13500, 100);
INSERT INTO `product_info` VALUES (115, '白鹅毛被子', 32, 1, 9, 32, 369.00, '斯诺曼（snowman）被芯家纺 全棉白鹅毛被 双人羽绒羽毛被春秋被子被褥四季被 白 约5斤 200*230cm', 12500, 100);
INSERT INTO `product_info` VALUES (116, '夏季薄被子', 32, 1, 9, 32, 79.00, '南极人（NanJiren）被子可水洗机洗夏凉被春秋被芯 水洗棉工艺夏被单人双人空调被被褥 150*200cm', 9500, 100);
INSERT INTO `product_info` VALUES (117, '水洗棉被子', 32, 1, 9, 32, 139.00, '皇朝家私 被子被芯 水洗棉被 加厚保暖冬被四季被春秋单双人太空被 银灰色 200*230cm 6斤', 8400, 100);
INSERT INTO `product_info` VALUES (118, '加厚保暖被子', 32, 1, 9, 32, 79.90, '南极人NanJiren 被芯 加厚春秋保暖被子 双人秋冬被褥棉被学生空调被盖被冬被 200*230cm 6斤', 6200, 100);
INSERT INTO `product_info` VALUES (119, '四季被子', 32, 1, 9, 32, 89.00, '南极人 被芯家纺 四季被子 春秋被空调被 纤维保暖棉被双人盖被 奶白深灰 180*200cm 4斤', 16500, 100);
INSERT INTO `product_info` VALUES (120, '新疆棉花被', 32, 1, 9, 32, 99.00, '南极人 被子家纺 新疆棉花被 单人春秋被芯 四季盖被保暖褥子棉花胎 150*200 4斤', 7800, 100);
INSERT INTO `product_info` VALUES (121, '卡乐比Calbee 日本进口水果麦片零食', 33, 1, 10, 33, 61.90, '卡乐比Calbee 日本进口水果麦片零食 冲饮谷物 营养早餐燕麦片700g', 0, 0);
INSERT INTO `product_info` VALUES (122, '卡乐比 薯条三兄弟', 33, 1, 10, 33, 29.90, '卡乐比（Calbee）薯条三兄弟日本进口咸味薯条零食80g', 0, 0);
INSERT INTO `product_info` VALUES (123, '卡乐比  日本进口水果麦片', 33, 1, 10, 33, 49.90, '卡乐比Calbee 日本进口水果麦片零食 冲饮谷物 营养早餐燕麦片350g', 0, 0);
INSERT INTO `product_info` VALUES (124, '卡乐比 日本进口水果麦片', 33, 1, 10, 33, 64.90, '卡乐比Calbee 日本进口水果麦片零食 冲饮谷物 营养早餐 苹果Plus水果麦片700g', 0, 0);
INSERT INTO `product_info` VALUES (125, '卡乐比 日本进口水果麦片', 33, 1, 10, 33, 64.90, '卡乐比 Calbee日本进口水果麦片零食 冲饮谷物 营养早餐燕麦片抹茶风味600g', 0, 0);
INSERT INTO `product_info` VALUES (126, '卡乐比 日本进口水果麦片', 33, 1, 10, 33, 39.90, '卡乐比Calbee 日本进口水果麦片零食 冲饮谷物 营养早餐燕麦片380g', 0, 0);
INSERT INTO `product_info` VALUES (127, '费列罗拉斐尔椰蓉扁桃仁糖果巧克力', 34, 1, 10, 34, 39.90, 'Ferrero Raffaello费列罗拉斐尔椰蓉扁桃仁糖果巧克力情人节礼盒15粒150g', 0, 0);
INSERT INTO `product_info` VALUES (128, '费列罗臻品糖果巧克力礼盒', 34, 1, 10, 34, 149.00, '费列罗（FERRERO）Collection费列罗臻品糖果巧克力礼盒 48粒装518.4g', 0, 0);
INSERT INTO `product_info` VALUES (129, '费列罗臻品糖果巧克力礼盒', 34, 1, 10, 34, 118.00, 'Ferrero Collection费列罗臻品糖果巧克力礼盒24粒装259.2g', 0, 0);
INSERT INTO `product_info` VALUES (130, '费列罗榛果威化糖果巧克力礼盒', 34, 1, 10, 34, 55.00, 'Ferrero Rocher费列罗榛果威化糖果巧克力礼盒16粒200g', 0, 0);
INSERT INTO `product_info` VALUES (131, '费列罗榛果威化糖果巧克力情人节礼盒', 34, 1, 10, 34, 45.00, 'Ferrero Rocher费列罗榛果威化糖果巧克力情人节礼盒8粒心形装100g', 0, 0);
INSERT INTO `product_info` VALUES (132, '费列罗榛果威化糖果巧克力礼盒', 34, 1, 10, 34, 110.00, 'Ferrero Rocher费列罗榛果威化糖果巧克力礼盒24粒钻石装300g', 0, 0);
INSERT INTO `product_info` VALUES (133, '西湖龙井茶雨前鲜爽罐装', 35, 1, 10, 35, 109.00, '梅府茗家茶叶 茗茶 绿茶 2019新茶 西湖龙井茶雨前鲜爽罐装250g 春茶', 0, 0);
INSERT INTO `product_info` VALUES (134, '西湖龙井茶明前一级老茶树瓷瓶', 35, 1, 10, 35, 219.00, '梅府茗家茶叶茗茶 绿茶 2019新茶 西湖龙井茶明前一级老茶树瓷瓶200g 春茶', 0, 0);
INSERT INTO `product_info` VALUES (135, '安吉白茶雨前清爽罐装', 35, 1, 10, 35, 99.00, '梅府茗家茶叶 茗茶 绿茶 安吉白茶雨前清爽罐装150g 原产地珍稀白茶春茶', 0, 0);
INSERT INTO `product_info` VALUES (136, '碧螺春明前一级罐装', 35, 1, 10, 35, 99.00, '梅府茗家茶叶 茗茶 绿茶 碧螺春明前一级罐装250g 原产地江苏碧螺春茶', 0, 0);
INSERT INTO `product_info` VALUES (137, '正宗武夷桐木关原产 一级正山小种', 35, 1, 10, 35, 99.00, '梅府茗家 茶叶 红茶 正宗武夷桐木关原产 一级正山小种蜜香 150g', 0, 0);
INSERT INTO `product_info` VALUES (138, '熟茶宫廷普洱500克罐装', 35, 1, 10, 35, 219.00, '梅府茗家 小青柑 茶叶 柑普茶 新会陈皮 普洱茶 熟茶宫廷普洱500克罐装', 0, 0);
INSERT INTO `product_info` VALUES (139, ' 特调甜心拿铁 桂花板栗风味', 36, 1, 10, 36, 14.90, '雀巢（Nestle）速溶咖啡 特调甜心拿铁 桂花板栗风味 8条X15g', 0, 0);
INSERT INTO `product_info` VALUES (140, '成人奶粉 进口活性菌 罐装', 36, 1, 10, 36, 91.00, '雀巢(Nestle) 中老年奶粉 怡养益护因子 高钙 成人奶粉 进口活性菌 罐装850g', 0, 0);
INSERT INTO `product_info` VALUES (141, '雀巢（Nestle) 金牌 黑咖啡粉', 36, 1, 10, 36, 78.00, '瑞士进口 雀巢（Nestle) 金牌 黑咖啡粉 至臻原味 速溶 咖啡豆微研磨100g', 0, 0);
INSERT INTO `product_info` VALUES (142, '雀巢（Nestle）果味咖啡', 36, 1, 10, 36, 44.90, '雀巢（Nestle）果味咖啡 冰果萃 3种口味 特调果萃 八角礼盒 4盒装 （沁风桃桃120gx2+青苹果88g+凤梨120g）', 0, 0);
INSERT INTO `product_info` VALUES (143, '雀巢金牌馆藏 提拉米苏风味拿铁', 36, 1, 10, 36, 38.90, '雀巢（Nestle）金牌馆藏 提拉米苏风味拿铁 速溶咖啡 冲调饮品 20gX12条', 0, 0);
INSERT INTO `product_info` VALUES (144, '雀巢(Nestle) 可可味滋滋 麦片', 36, 1, 10, 36, 25.60, '雀巢(Nestle) 可可味滋滋 麦片非油炸 巧克力可可味 儿童营养早餐 原装进口富含多种维生素 即食谷物早餐330g', 0, 0);
INSERT INTO `product_info` VALUES (145, '金龙鱼 东北大米 乳玉皇妃稻香', 37, 1, 10, 37, 99.90, '金龙鱼 东北大米 乳玉皇妃稻香贡米 5kg', 0, 0);
INSERT INTO `product_info` VALUES (146, '古法一九一八花生油4L', 37, 1, 10, 37, 129.80, '胡姬花 食用油 古法一九一八花生油4L（新老包装随机发货）', 0, 0);
INSERT INTO `product_info` VALUES (147, ' 东北大米 臻选稻香米', 37, 1, 10, 37, 55.00, '金龙鱼 稻花香大米 东北大米 臻选稻香米 5KG 甄选', 0, 0);
INSERT INTO `product_info` VALUES (148, '物理压榨玉米油6.18L', 37, 1, 10, 37, 69.90, '金龙鱼 食用油 物理压榨玉米油6.18L（新老包装随机发放）', 0, 0);
INSERT INTO `product_info` VALUES (149, '澳大利亚麦芯粉2.5kg 进口小麦', 37, 1, 10, 37, 31.90, '金龙鱼 面粉 高筋面粉 澳大利亚麦芯粉2.5kg 100%进口小麦(新老包装随机发放)', 0, 0);
INSERT INTO `product_info` VALUES (150, '稻谷鲜生食用植物调和油5L', 37, 1, 10, 37, 89.80, '金龙鱼 食用油 稻谷鲜生食用植物调和油5L\n金龙鱼 食用油 稻谷鲜生食用植物调和油5L\n金龙鱼 食用油 稻谷鲜生食用植物调和油5L', 0, 0);
INSERT INTO `product_info` VALUES (151, 'iPhone7手机', 38, 5, 11, 38, 2999.00, '苹果7手机 128g金色', 100, 200);
INSERT INTO `product_info` VALUES (152, 'iPhone8手机', 38, 5, 11, 38, 3499.00, '苹果8 64G', 50, 250);
INSERT INTO `product_info` VALUES (153, 'iPhone8 plus手机', 38, 5, 11, 38, 3999.00, 'Apple iPhone 8 Plus (A1899) 64GB 深空灰色 移动联通4G手机', 20, 800);
INSERT INTO `product_info` VALUES (154, 'iPhone x手机', 38, 5, 11, 38, 7199.00, 'Apple 苹果 iPhone X 全面屏手机 深空灰色 全网通 256GB ', 12, 1500);
INSERT INTO `product_info` VALUES (155, 'iPhone xr手机', 38, 5, 11, 38, 4699.00, '苹果xr64G', 100, 1000);
INSERT INTO `product_info` VALUES (156, 'iPhone xs手机', 38, 5, 11, 38, 8599.00, 'xs 256G版本', 200, 2000);
INSERT INTO `product_info` VALUES (157, '华为P30手机', 39, 5, 11, 39, 3688.00, '人在做 华为P30在看', 500, 2200);
INSERT INTO `product_info` VALUES (158, '华为mate20手机', 39, 5, 11, 39, 3689.00, 'AI智能芯片全面屏超微距影像超大广角徕卡三摄6GB+128GB亮黑色全网通版', 260, 1800);
INSERT INTO `product_info` VALUES (159, '华为mate20Pro手机', 39, 5, 11, 39, 5099.00, '(UD)屏内指纹版麒麟980芯片全面屏', 300, 1500);
INSERT INTO `product_info` VALUES (160, '华为mateRS手机', 39, 5, 11, 39, 16999.00, '保时捷版手机', 200, 10000);
INSERT INTO `product_info` VALUES (161, '华为nova5手机', 39, 5, 11, 39, 2999.00, '华为 HUAWEI nova 5 Pro 前置3200万人像超级夜景4800万AI四摄麒麟980芯片', 500, 2500);
INSERT INTO `product_info` VALUES (162, '荣耀8c手机', 39, 5, 11, 39, 799.00, '荣耀畅玩8C两天一充 莱茵护眼 刘海屏 全网通版4GB+32GB 幻夜黑 移动联通电信4G全面屏手机 双卡双待 限时优惠', 10, 100);
INSERT INTO `product_info` VALUES (163, '小米8手机', 40, 5, 11, 40, 1799.00, '小米8屏幕指纹版 骁龙845 压感屏幕指纹识别 DxO超百分相机 黑色 6GB+128GB ', 400, 1800);
INSERT INTO `product_info` VALUES (164, '红米K20手机', 40, 5, 11, 40, 2499.00, 'Redmi K20Pro 骁龙855 索尼4800万超广角三摄 AMOLED弹出式全面屏 ', 200, 1000);
INSERT INTO `product_info` VALUES (165, '红米note7手机', 40, 5, 11, 40, 1399.00, 'Redmi Note7Pro 索尼4800万超清双摄 骁龙675 18个月超长质保 ', 100, 800);
INSERT INTO `product_info` VALUES (166, '小米9手机', 40, 5, 11, 40, 2599.00, '小米9 4800万超广角三摄 6GB+128GB全息幻彩蓝 骁龙855 ', 200, 500);
INSERT INTO `product_info` VALUES (167, '小米X2s手机', 40, 5, 11, 40, 2099.00, '小米MIX2S 骁龙845 AI感光双摄 四曲面陶瓷全面屏 黑色 多功能 NFC ', 100, 400);
INSERT INTO `product_info` VALUES (168, '小米6X手机', 40, 5, 11, 40, 999.00, '小米6X 全网通 6GB+64GB 赤焰红 移动联通电信4G手机 双卡双待', 50, 200);
INSERT INTO `product_info` VALUES (169, 'OPPO R15手机', 41, 5, 11, 41, 1599.00, 'R15 双卡双待', 80, 300);
INSERT INTO `product_info` VALUES (170, 'OPPO K3手机', 41, 5, 11, 41, 1899.00, 'OPPO K3 高通骁龙710 升降摄像头 VOOC闪充 8GB+128GB 秘境黑 全网通4G 全面屏拍照游戏智能手机 【下单立减100元，低至1799元】骁龙710，升降全面屏，VOOC3.0。高性价比K1立减200低至999', 20, 111);
INSERT INTO `product_info` VALUES (171, 'OPPO Renovation手机', 41, 5, 11, 41, 2599.00, 'OPPO Reno 4800万超清像素 NFC 超清夜景 6GB+128GB ', 100, 10000);
INSERT INTO `product_info` VALUES (172, 'OPPO Reno10手机', 41, 5, 11, 41, 4299.00, 'OPPO Reno 10倍变焦版 高通骁龙855 4800万超清三摄 6GB+128GB 雾海绿 ', 20, 400);
INSERT INTO `product_info` VALUES (173, 'OPPO findX手机', 41, 5, 11, 41, 3999.00, 'OPPO Find X曲面全景屏 8GB+128GB 冰珀蓝 全网通 ', 300, 2200);
INSERT INTO `product_info` VALUES (174, 'OPPO K1手机', 41, 5, 11, 41, 1199.00, 'OPPO K1 光感屏幕指纹 水滴屏拍照手机 4GB+64GB', 20, 500);
INSERT INTO `product_info` VALUES (175, 'iQOO手机', 42, 5, 11, 42, 1998.00, 'vivo iQOO Neo 6GB+128GB 电光紫 骁龙845处理器', 300, 400);
INSERT INTO `product_info` VALUES (176, ' vivo Z5X手机', 42, 5, 11, 42, 1698.00, 'vivo Z5x 6GB+128GB 极光色 极点屏手机 ', 400, 800);
INSERT INTO `product_info` VALUES (177, 'vivo Z5手机', 42, 5, 11, 42, 1898.00, 'vivo Z5 6GB+128GB 极光幻境 4800万超广角AI三摄手机', 200, 100);
INSERT INTO `product_info` VALUES (178, 'vivo X27手机', 42, 5, 11, 42, 2698.00, 'vivo X27 【直降300，到手价2698！12期白条免息+赠半年延保】', 100, 100);
INSERT INTO `product_info` VALUES (179, 'vivo X27 pro手机', 42, 5, 11, 42, 3598.00, 'vivo X27Pro 8GB+256GB大内存 白母贝 4800万AI三摄全面屏拍照手机', 200, 100);
INSERT INTO `product_info` VALUES (180, 'vivo Z3手机', 42, 5, 11, 42, 1248.00, 'vivo Z3 6GB+64GB 星夜黑 骁龙710处理器', 100, 200);

-- ----------------------------
-- Table structure for product_pic_info
-- ----------------------------
DROP TABLE IF EXISTS `product_pic_info`;
CREATE TABLE `product_pic_info`  (
  `product_pic_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品图片ID',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `pic_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片URL',
  `is_master` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否主图：0.非主图1.主图',
  PRIMARY KEY (`product_pic_id`) USING BTREE,
  INDEX `fk_p_pic_p_info`(`product_id`) USING BTREE,
  CONSTRAINT `fk_p_pic_p_info` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品图片信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_pic_info
-- ----------------------------
INSERT INTO `product_pic_info` VALUES (1, 1, 'images/q1.jpg', 0);
INSERT INTO `product_pic_info` VALUES (2, 2, 'images/q2.jpg', 0);
INSERT INTO `product_pic_info` VALUES (3, 3, 'images/q3.jpg', 0);
INSERT INTO `product_pic_info` VALUES (4, 4, 'images/q4.jpg', 0);
INSERT INTO `product_pic_info` VALUES (5, 5, 'images/q5.jpg', 0);
INSERT INTO `product_pic_info` VALUES (6, 6, 'images/q6.jpg', 0);
INSERT INTO `product_pic_info` VALUES (7, 7, 'images/q7.jpg', 0);
INSERT INTO `product_pic_info` VALUES (8, 8, 'images/q8.jpg', 0);
INSERT INTO `product_pic_info` VALUES (9, 9, 'images/q9.jpg', 0);
INSERT INTO `product_pic_info` VALUES (10, 10, 'images/q10.jpg', 0);
INSERT INTO `product_pic_info` VALUES (11, 11, 'images/q11.jpg', 0);
INSERT INTO `product_pic_info` VALUES (12, 12, 'images/q12.jpg', 0);
INSERT INTO `product_pic_info` VALUES (13, 13, 'images/q13.jpg', 0);
INSERT INTO `product_pic_info` VALUES (14, 14, 'images/q14.jpg', 0);
INSERT INTO `product_pic_info` VALUES (15, 15, 'images/q15.jpg', 0);
INSERT INTO `product_pic_info` VALUES (16, 16, 'images/q16.jpg', 0);
INSERT INTO `product_pic_info` VALUES (17, 17, 'images/q17.jpg', 0);
INSERT INTO `product_pic_info` VALUES (18, 18, 'images/q18.jpg', 0);
INSERT INTO `product_pic_info` VALUES (19, 19, 'images/q18.jpg', 0);
INSERT INTO `product_pic_info` VALUES (20, 20, 'images/q20.jpg', 0);
INSERT INTO `product_pic_info` VALUES (21, 21, 'images/q21.jpg', 0);
INSERT INTO `product_pic_info` VALUES (22, 22, 'images/q22.jpg', 0);
INSERT INTO `product_pic_info` VALUES (23, 23, 'images/q23.jpg', 0);
INSERT INTO `product_pic_info` VALUES (24, 24, 'images/q24.jpg', 0);
INSERT INTO `product_pic_info` VALUES (25, 25, 'images/q25.jpg', 0);
INSERT INTO `product_pic_info` VALUES (26, 26, 'images/q26.jpg', 0);
INSERT INTO `product_pic_info` VALUES (27, 27, 'images/q27.jpg', 0);
INSERT INTO `product_pic_info` VALUES (28, 28, 'images/q28.jpg', 0);
INSERT INTO `product_pic_info` VALUES (29, 29, 'images/q29.jpg', 0);
INSERT INTO `product_pic_info` VALUES (30, 30, 'images/q30.jpg', 0);
INSERT INTO `product_pic_info` VALUES (31, 31, 'images/q31.jpg', 0);
INSERT INTO `product_pic_info` VALUES (32, 32, 'images/q32.jpg', 0);
INSERT INTO `product_pic_info` VALUES (33, 33, 'images/q33.jpg', 0);
INSERT INTO `product_pic_info` VALUES (34, 34, 'images/q34.jpg', 0);
INSERT INTO `product_pic_info` VALUES (35, 35, 'images/q35.jpg', 0);
INSERT INTO `product_pic_info` VALUES (36, 36, 'images/q36.jpg', 0);
INSERT INTO `product_pic_info` VALUES (37, 37, 'images/q37.jpg', 0);
INSERT INTO `product_pic_info` VALUES (38, 38, 'images/q38.jpg', 0);
INSERT INTO `product_pic_info` VALUES (39, 39, 'images/q39.jpg', 0);
INSERT INTO `product_pic_info` VALUES (40, 40, 'images/q40.jpg', 0);
INSERT INTO `product_pic_info` VALUES (41, 41, 'images/q41.jpg', 0);
INSERT INTO `product_pic_info` VALUES (42, 42, 'images/q42.jpg', 0);
INSERT INTO `product_pic_info` VALUES (43, 43, 'images/q43.jpg', 0);
INSERT INTO `product_pic_info` VALUES (44, 44, 'images/q44.jpg', 0);
INSERT INTO `product_pic_info` VALUES (45, 45, 'images/q45.jpg', 0);
INSERT INTO `product_pic_info` VALUES (46, 46, 'images/q46.jpg', 0);
INSERT INTO `product_pic_info` VALUES (47, 47, 'images/q47.jpg', 0);
INSERT INTO `product_pic_info` VALUES (48, 48, 'images/q48.jpg', 0);
INSERT INTO `product_pic_info` VALUES (49, 49, 'images/q49.jpg', 0);
INSERT INTO `product_pic_info` VALUES (50, 50, 'images/q50.jpg', 0);
INSERT INTO `product_pic_info` VALUES (51, 51, 'images/q51.jpg', 0);
INSERT INTO `product_pic_info` VALUES (52, 52, 'images/q52.jpg', 0);
INSERT INTO `product_pic_info` VALUES (53, 53, 'images/q53.jpg', 0);
INSERT INTO `product_pic_info` VALUES (54, 54, 'images/q54.jpg', 0);
INSERT INTO `product_pic_info` VALUES (55, 55, 'images/q55.jpg', 0);
INSERT INTO `product_pic_info` VALUES (56, 56, 'images/q56.jpg', 0);
INSERT INTO `product_pic_info` VALUES (57, 57, 'images/q57.jpg', 0);
INSERT INTO `product_pic_info` VALUES (58, 58, 'images/q58.jpg', 0);
INSERT INTO `product_pic_info` VALUES (59, 59, 'images/q59.jpg', 0);
INSERT INTO `product_pic_info` VALUES (60, 60, 'images/q60.jpg', 0);
INSERT INTO `product_pic_info` VALUES (61, 61, 'images/q61.jpg', 0);
INSERT INTO `product_pic_info` VALUES (62, 62, 'images/q62.jpg', 0);
INSERT INTO `product_pic_info` VALUES (63, 63, 'images/q63.jpg', 0);
INSERT INTO `product_pic_info` VALUES (64, 64, 'images/q64.jpg', 0);
INSERT INTO `product_pic_info` VALUES (65, 65, 'images/q65.jpg', 0);
INSERT INTO `product_pic_info` VALUES (66, 66, 'images/q66.jpg', 0);
INSERT INTO `product_pic_info` VALUES (67, 67, 'images/q67.jpg', 0);
INSERT INTO `product_pic_info` VALUES (68, 68, 'images/q68.jpg', 0);
INSERT INTO `product_pic_info` VALUES (69, 69, 'images/q69.jpg', 0);
INSERT INTO `product_pic_info` VALUES (70, 70, 'images/q70.jpg', 0);
INSERT INTO `product_pic_info` VALUES (71, 71, 'images/q71.jpg', 0);
INSERT INTO `product_pic_info` VALUES (72, 72, 'images/q72.jpg', 0);
INSERT INTO `product_pic_info` VALUES (73, 73, 'images/q73.jpg', 0);
INSERT INTO `product_pic_info` VALUES (74, 74, 'images/q74.jpg', 0);
INSERT INTO `product_pic_info` VALUES (75, 75, 'images/q75.jpg', 0);
INSERT INTO `product_pic_info` VALUES (76, 76, 'images/q76.jpg', 0);
INSERT INTO `product_pic_info` VALUES (77, 77, 'images/q77.jpg', 0);
INSERT INTO `product_pic_info` VALUES (78, 78, 'images/q78.jpg', 0);
INSERT INTO `product_pic_info` VALUES (79, 79, 'images/q79.jpg', 0);
INSERT INTO `product_pic_info` VALUES (80, 80, 'images/q80.jpg', 0);
INSERT INTO `product_pic_info` VALUES (81, 81, 'images/q81.jpg', 0);
INSERT INTO `product_pic_info` VALUES (82, 82, 'images/q82.jpg', 0);
INSERT INTO `product_pic_info` VALUES (83, 83, 'images/q83.jpg', 0);
INSERT INTO `product_pic_info` VALUES (84, 84, 'images/q84.jpg', 0);
INSERT INTO `product_pic_info` VALUES (85, 85, 'images/q85.jpg', 0);
INSERT INTO `product_pic_info` VALUES (86, 86, 'images/q86.jpg', 0);
INSERT INTO `product_pic_info` VALUES (87, 87, 'images/q87.jpg', 0);
INSERT INTO `product_pic_info` VALUES (88, 88, 'images/q88.jpg', 0);
INSERT INTO `product_pic_info` VALUES (89, 89, 'images/q89.jpg', 0);
INSERT INTO `product_pic_info` VALUES (90, 90, 'images/q90.jpg', 0);
INSERT INTO `product_pic_info` VALUES (91, 91, 'images/q91.jpg', 0);
INSERT INTO `product_pic_info` VALUES (92, 92, 'images/q92.jpg', 0);
INSERT INTO `product_pic_info` VALUES (93, 93, 'images/q93.jpg', 0);
INSERT INTO `product_pic_info` VALUES (94, 94, 'images/q94.jpg', 0);
INSERT INTO `product_pic_info` VALUES (95, 95, 'images/q95.jpg', 0);
INSERT INTO `product_pic_info` VALUES (96, 96, 'images/q96.jpg', 0);
INSERT INTO `product_pic_info` VALUES (97, 97, 'images/q97.jpg', 0);
INSERT INTO `product_pic_info` VALUES (98, 98, 'images/q98.jpg', 0);
INSERT INTO `product_pic_info` VALUES (99, 99, 'images/q99.jpg', 0);
INSERT INTO `product_pic_info` VALUES (100, 100, 'images/q100.jpg', 0);
INSERT INTO `product_pic_info` VALUES (101, 101, 'images/q101.jpg', 0);
INSERT INTO `product_pic_info` VALUES (102, 102, 'images/q102.jpg', 0);
INSERT INTO `product_pic_info` VALUES (103, 103, 'images/q103.jpg', 0);
INSERT INTO `product_pic_info` VALUES (104, 104, 'images/q104.jpg', 0);
INSERT INTO `product_pic_info` VALUES (105, 105, 'images/q105.jpg', 0);
INSERT INTO `product_pic_info` VALUES (106, 106, 'images/q106.jpg', 0);
INSERT INTO `product_pic_info` VALUES (107, 107, 'images/q107.jpg', 0);
INSERT INTO `product_pic_info` VALUES (108, 108, 'images/q108.jpg', 0);
INSERT INTO `product_pic_info` VALUES (109, 109, 'images/q109.jpg', 0);
INSERT INTO `product_pic_info` VALUES (110, 110, 'images/q110.jpg', 0);
INSERT INTO `product_pic_info` VALUES (111, 111, 'images/q111.jpg', 0);
INSERT INTO `product_pic_info` VALUES (112, 112, 'images/q112.jpg', 0);
INSERT INTO `product_pic_info` VALUES (113, 113, 'images/q113.jpg', 0);
INSERT INTO `product_pic_info` VALUES (114, 114, 'images/q114.jpg', 0);
INSERT INTO `product_pic_info` VALUES (115, 115, 'images/q115.jpg', 0);
INSERT INTO `product_pic_info` VALUES (116, 116, 'images/q116.jpg', 0);
INSERT INTO `product_pic_info` VALUES (117, 117, 'images/q117.jpg', 0);
INSERT INTO `product_pic_info` VALUES (118, 118, 'images/q118.jpg', 0);
INSERT INTO `product_pic_info` VALUES (119, 119, 'images/q119.jpg', 0);
INSERT INTO `product_pic_info` VALUES (120, 120, 'images/q120.jpg', 0);
INSERT INTO `product_pic_info` VALUES (121, 121, 'images/q121.jpg', 0);
INSERT INTO `product_pic_info` VALUES (122, 122, 'images/q122.jpg', 0);
INSERT INTO `product_pic_info` VALUES (123, 123, 'images/q123.jpg', 0);
INSERT INTO `product_pic_info` VALUES (124, 124, 'images/q124.jpg', 0);
INSERT INTO `product_pic_info` VALUES (125, 125, 'images/q125.jpg', 0);
INSERT INTO `product_pic_info` VALUES (126, 126, 'images/q126.jpg', 0);
INSERT INTO `product_pic_info` VALUES (127, 127, 'images/q127.jpg', 0);
INSERT INTO `product_pic_info` VALUES (128, 128, 'images/q128.jpg', 0);
INSERT INTO `product_pic_info` VALUES (129, 129, 'images/q129.jpg', 0);
INSERT INTO `product_pic_info` VALUES (130, 130, 'images/q130.jpg', 0);
INSERT INTO `product_pic_info` VALUES (131, 131, 'images/q131.jpg', 0);
INSERT INTO `product_pic_info` VALUES (132, 132, 'images/q132.jpg', 0);
INSERT INTO `product_pic_info` VALUES (133, 133, 'images/q133.jpg', 0);
INSERT INTO `product_pic_info` VALUES (134, 134, 'images/q134.jpg', 0);
INSERT INTO `product_pic_info` VALUES (135, 135, 'images/q135.jpg', 0);
INSERT INTO `product_pic_info` VALUES (136, 136, 'images/q136.jpg', 0);
INSERT INTO `product_pic_info` VALUES (137, 137, 'images/q137.jpg', 0);
INSERT INTO `product_pic_info` VALUES (138, 138, 'images/q138.jpg', 0);
INSERT INTO `product_pic_info` VALUES (139, 139, 'images/q139.jpg', 0);
INSERT INTO `product_pic_info` VALUES (140, 140, 'images/q140.jpg', 0);
INSERT INTO `product_pic_info` VALUES (141, 141, 'images/q141.jpg', 0);
INSERT INTO `product_pic_info` VALUES (142, 142, 'images/q142.jpg', 0);
INSERT INTO `product_pic_info` VALUES (143, 143, 'images/q143.jpg', 0);
INSERT INTO `product_pic_info` VALUES (144, 144, 'images/q144.jpg', 0);
INSERT INTO `product_pic_info` VALUES (145, 145, 'images/q145.jpg', 0);
INSERT INTO `product_pic_info` VALUES (146, 146, 'images/q146.jpg', 0);
INSERT INTO `product_pic_info` VALUES (147, 147, 'images/q147.jpg', 0);
INSERT INTO `product_pic_info` VALUES (148, 148, 'images/q148.jpg', 0);
INSERT INTO `product_pic_info` VALUES (149, 149, 'images/q149.jpg', 0);
INSERT INTO `product_pic_info` VALUES (150, 150, 'images/q150.jpg', 0);
INSERT INTO `product_pic_info` VALUES (151, 151, 'images/q151.jpg', 0);
INSERT INTO `product_pic_info` VALUES (152, 152, 'images/q152.jpg', 0);
INSERT INTO `product_pic_info` VALUES (153, 153, 'images/q153.jpg', 0);
INSERT INTO `product_pic_info` VALUES (154, 154, 'images/q154.jpg', 0);
INSERT INTO `product_pic_info` VALUES (155, 155, 'images/q155.jpg', 0);
INSERT INTO `product_pic_info` VALUES (156, 156, 'images/q156.jpg', 0);
INSERT INTO `product_pic_info` VALUES (157, 157, 'images/q157.jpg', 0);
INSERT INTO `product_pic_info` VALUES (158, 158, 'images/q158.jpg', 0);
INSERT INTO `product_pic_info` VALUES (159, 159, 'images/q159.jpg', 0);
INSERT INTO `product_pic_info` VALUES (160, 160, 'images/q160.jpg', 0);
INSERT INTO `product_pic_info` VALUES (161, 161, 'images/q161.jpg', 0);
INSERT INTO `product_pic_info` VALUES (162, 162, 'images/q162.jpg', 0);
INSERT INTO `product_pic_info` VALUES (163, 163, 'images/q163.jpg', 0);
INSERT INTO `product_pic_info` VALUES (164, 164, 'images/q164.jpg', 0);
INSERT INTO `product_pic_info` VALUES (165, 165, 'images/q165.jpg', 0);
INSERT INTO `product_pic_info` VALUES (166, 166, 'images/q166.jpg', 0);
INSERT INTO `product_pic_info` VALUES (167, 167, 'images/q167.jpg', 0);
INSERT INTO `product_pic_info` VALUES (168, 168, 'images/q168.jpg', 0);
INSERT INTO `product_pic_info` VALUES (169, 169, 'images/q169.jpg', 0);
INSERT INTO `product_pic_info` VALUES (170, 170, 'images/q170.jpg', 0);
INSERT INTO `product_pic_info` VALUES (171, 171, 'images/q171.jpg', 0);
INSERT INTO `product_pic_info` VALUES (172, 172, 'images/q172.jpg', 0);
INSERT INTO `product_pic_info` VALUES (173, 173, 'images/q173.jpg', 0);
INSERT INTO `product_pic_info` VALUES (174, 174, 'images/q174.jpg', 0);
INSERT INTO `product_pic_info` VALUES (175, 175, 'images/q175.jpg', 0);
INSERT INTO `product_pic_info` VALUES (176, 176, 'images/q176.jpg', 0);
INSERT INTO `product_pic_info` VALUES (177, 177, 'images/q177.jpg', 0);
INSERT INTO `product_pic_info` VALUES (178, 178, 'images/q178.jpg', 0);
INSERT INTO `product_pic_info` VALUES (179, 179, 'images/q179.jpg', 0);
INSERT INTO `product_pic_info` VALUES (180, 180, 'images/q180.jpg', 0);

-- ----------------------------
-- Table structure for product_stock
-- ----------------------------
DROP TABLE IF EXISTS `product_stock`;
CREATE TABLE `product_stock`  (
  `stock_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `stock_num` int(20) NOT NULL DEFAULT 30,
  PRIMARY KEY (`stock_id`) USING BTREE,
  INDEX `fk_p_stock_p_info`(`product_id`) USING BTREE,
  CONSTRAINT `fk_p_stock_p_info` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_stock
-- ----------------------------
INSERT INTO `product_stock` VALUES (1, 1, 15);
INSERT INTO `product_stock` VALUES (2, 2, 30);
INSERT INTO `product_stock` VALUES (3, 3, 30);
INSERT INTO `product_stock` VALUES (4, 4, 30);
INSERT INTO `product_stock` VALUES (5, 5, 30);
INSERT INTO `product_stock` VALUES (6, 6, 30);
INSERT INTO `product_stock` VALUES (7, 7, 30);
INSERT INTO `product_stock` VALUES (8, 8, 30);
INSERT INTO `product_stock` VALUES (9, 9, 30);
INSERT INTO `product_stock` VALUES (10, 10, 30);
INSERT INTO `product_stock` VALUES (11, 11, 30);
INSERT INTO `product_stock` VALUES (12, 12, 30);
INSERT INTO `product_stock` VALUES (13, 13, 30);
INSERT INTO `product_stock` VALUES (14, 14, 30);
INSERT INTO `product_stock` VALUES (15, 15, 30);
INSERT INTO `product_stock` VALUES (16, 16, 30);
INSERT INTO `product_stock` VALUES (17, 17, 30);
INSERT INTO `product_stock` VALUES (18, 18, 30);
INSERT INTO `product_stock` VALUES (19, 19, 30);
INSERT INTO `product_stock` VALUES (20, 20, 30);
INSERT INTO `product_stock` VALUES (21, 21, 30);
INSERT INTO `product_stock` VALUES (22, 22, 30);
INSERT INTO `product_stock` VALUES (23, 23, 30);
INSERT INTO `product_stock` VALUES (24, 24, 30);
INSERT INTO `product_stock` VALUES (25, 25, 30);
INSERT INTO `product_stock` VALUES (26, 26, 30);
INSERT INTO `product_stock` VALUES (27, 27, 30);
INSERT INTO `product_stock` VALUES (28, 28, 30);
INSERT INTO `product_stock` VALUES (29, 29, 30);
INSERT INTO `product_stock` VALUES (30, 30, 30);
INSERT INTO `product_stock` VALUES (31, 31, 30);
INSERT INTO `product_stock` VALUES (32, 32, 30);
INSERT INTO `product_stock` VALUES (33, 33, 30);
INSERT INTO `product_stock` VALUES (34, 34, 30);
INSERT INTO `product_stock` VALUES (35, 35, 30);
INSERT INTO `product_stock` VALUES (36, 36, 30);
INSERT INTO `product_stock` VALUES (37, 37, 30);
INSERT INTO `product_stock` VALUES (38, 38, 30);
INSERT INTO `product_stock` VALUES (39, 39, 30);
INSERT INTO `product_stock` VALUES (40, 40, 30);
INSERT INTO `product_stock` VALUES (41, 41, 30);
INSERT INTO `product_stock` VALUES (42, 42, 30);
INSERT INTO `product_stock` VALUES (43, 43, 30);
INSERT INTO `product_stock` VALUES (44, 44, 30);
INSERT INTO `product_stock` VALUES (45, 45, 30);
INSERT INTO `product_stock` VALUES (46, 46, 30);
INSERT INTO `product_stock` VALUES (47, 47, 30);
INSERT INTO `product_stock` VALUES (48, 48, 30);
INSERT INTO `product_stock` VALUES (49, 49, 30);
INSERT INTO `product_stock` VALUES (50, 50, 30);
INSERT INTO `product_stock` VALUES (51, 51, 30);
INSERT INTO `product_stock` VALUES (52, 52, 30);
INSERT INTO `product_stock` VALUES (53, 53, 30);
INSERT INTO `product_stock` VALUES (54, 54, 30);
INSERT INTO `product_stock` VALUES (55, 55, 30);
INSERT INTO `product_stock` VALUES (56, 56, 30);
INSERT INTO `product_stock` VALUES (57, 57, 30);
INSERT INTO `product_stock` VALUES (58, 58, 30);
INSERT INTO `product_stock` VALUES (59, 59, 30);
INSERT INTO `product_stock` VALUES (60, 60, 30);
INSERT INTO `product_stock` VALUES (61, 61, 30);
INSERT INTO `product_stock` VALUES (62, 62, 30);
INSERT INTO `product_stock` VALUES (63, 63, 30);
INSERT INTO `product_stock` VALUES (64, 64, 30);
INSERT INTO `product_stock` VALUES (65, 65, 30);
INSERT INTO `product_stock` VALUES (66, 66, 30);
INSERT INTO `product_stock` VALUES (67, 67, 30);
INSERT INTO `product_stock` VALUES (68, 68, 30);
INSERT INTO `product_stock` VALUES (69, 69, 30);
INSERT INTO `product_stock` VALUES (70, 70, 30);
INSERT INTO `product_stock` VALUES (71, 71, 30);
INSERT INTO `product_stock` VALUES (72, 72, 30);
INSERT INTO `product_stock` VALUES (73, 73, 30);
INSERT INTO `product_stock` VALUES (74, 74, 30);
INSERT INTO `product_stock` VALUES (75, 75, 30);
INSERT INTO `product_stock` VALUES (76, 76, 30);
INSERT INTO `product_stock` VALUES (77, 77, 30);
INSERT INTO `product_stock` VALUES (78, 78, 30);
INSERT INTO `product_stock` VALUES (79, 79, 30);
INSERT INTO `product_stock` VALUES (80, 80, 30);
INSERT INTO `product_stock` VALUES (81, 81, 30);
INSERT INTO `product_stock` VALUES (82, 82, 30);
INSERT INTO `product_stock` VALUES (83, 83, 30);
INSERT INTO `product_stock` VALUES (84, 84, 30);
INSERT INTO `product_stock` VALUES (85, 85, 30);
INSERT INTO `product_stock` VALUES (86, 86, 30);
INSERT INTO `product_stock` VALUES (87, 87, 30);
INSERT INTO `product_stock` VALUES (88, 88, 30);
INSERT INTO `product_stock` VALUES (89, 89, 30);
INSERT INTO `product_stock` VALUES (90, 90, 30);
INSERT INTO `product_stock` VALUES (91, 91, 30);
INSERT INTO `product_stock` VALUES (92, 92, 30);
INSERT INTO `product_stock` VALUES (93, 93, 30);
INSERT INTO `product_stock` VALUES (94, 94, 30);
INSERT INTO `product_stock` VALUES (95, 95, 30);
INSERT INTO `product_stock` VALUES (96, 96, 30);
INSERT INTO `product_stock` VALUES (97, 97, 30);
INSERT INTO `product_stock` VALUES (98, 98, 30);
INSERT INTO `product_stock` VALUES (99, 99, 30);
INSERT INTO `product_stock` VALUES (100, 100, 30);
INSERT INTO `product_stock` VALUES (101, 101, 30);
INSERT INTO `product_stock` VALUES (102, 102, 30);
INSERT INTO `product_stock` VALUES (103, 103, 30);
INSERT INTO `product_stock` VALUES (104, 104, 30);
INSERT INTO `product_stock` VALUES (105, 105, 30);
INSERT INTO `product_stock` VALUES (106, 106, 30);
INSERT INTO `product_stock` VALUES (107, 107, 30);
INSERT INTO `product_stock` VALUES (108, 108, 30);
INSERT INTO `product_stock` VALUES (109, 109, 30);
INSERT INTO `product_stock` VALUES (110, 110, 30);
INSERT INTO `product_stock` VALUES (111, 111, 30);
INSERT INTO `product_stock` VALUES (112, 112, 30);
INSERT INTO `product_stock` VALUES (113, 113, 30);
INSERT INTO `product_stock` VALUES (114, 114, 30);
INSERT INTO `product_stock` VALUES (115, 115, 30);
INSERT INTO `product_stock` VALUES (116, 116, 30);
INSERT INTO `product_stock` VALUES (117, 117, 30);
INSERT INTO `product_stock` VALUES (118, 118, 30);
INSERT INTO `product_stock` VALUES (119, 119, 30);
INSERT INTO `product_stock` VALUES (120, 120, 30);
INSERT INTO `product_stock` VALUES (121, 121, 30);
INSERT INTO `product_stock` VALUES (122, 122, 30);
INSERT INTO `product_stock` VALUES (123, 123, 30);
INSERT INTO `product_stock` VALUES (124, 124, 30);
INSERT INTO `product_stock` VALUES (125, 125, 30);
INSERT INTO `product_stock` VALUES (126, 126, 30);
INSERT INTO `product_stock` VALUES (127, 127, 30);
INSERT INTO `product_stock` VALUES (128, 128, 30);
INSERT INTO `product_stock` VALUES (129, 129, 30);
INSERT INTO `product_stock` VALUES (130, 130, 30);
INSERT INTO `product_stock` VALUES (131, 131, 30);
INSERT INTO `product_stock` VALUES (132, 132, 30);
INSERT INTO `product_stock` VALUES (133, 133, 30);
INSERT INTO `product_stock` VALUES (134, 134, 30);
INSERT INTO `product_stock` VALUES (135, 135, 30);
INSERT INTO `product_stock` VALUES (136, 136, 30);
INSERT INTO `product_stock` VALUES (137, 137, 30);
INSERT INTO `product_stock` VALUES (138, 138, 30);
INSERT INTO `product_stock` VALUES (139, 139, 30);
INSERT INTO `product_stock` VALUES (140, 140, 30);
INSERT INTO `product_stock` VALUES (141, 141, 30);
INSERT INTO `product_stock` VALUES (142, 142, 30);
INSERT INTO `product_stock` VALUES (143, 143, 30);
INSERT INTO `product_stock` VALUES (144, 144, 30);
INSERT INTO `product_stock` VALUES (145, 145, 30);
INSERT INTO `product_stock` VALUES (146, 146, 30);
INSERT INTO `product_stock` VALUES (147, 147, 30);
INSERT INTO `product_stock` VALUES (148, 148, 30);
INSERT INTO `product_stock` VALUES (149, 149, 30);
INSERT INTO `product_stock` VALUES (150, 150, 30);
INSERT INTO `product_stock` VALUES (151, 151, 30);
INSERT INTO `product_stock` VALUES (152, 152, 30);
INSERT INTO `product_stock` VALUES (153, 153, 30);
INSERT INTO `product_stock` VALUES (154, 154, 30);
INSERT INTO `product_stock` VALUES (155, 155, 30);
INSERT INTO `product_stock` VALUES (156, 156, 30);
INSERT INTO `product_stock` VALUES (157, 157, 30);
INSERT INTO `product_stock` VALUES (158, 158, 30);
INSERT INTO `product_stock` VALUES (159, 159, 30);
INSERT INTO `product_stock` VALUES (160, 160, 30);
INSERT INTO `product_stock` VALUES (161, 161, 30);
INSERT INTO `product_stock` VALUES (162, 162, 30);
INSERT INTO `product_stock` VALUES (163, 163, 30);
INSERT INTO `product_stock` VALUES (164, 164, 30);
INSERT INTO `product_stock` VALUES (165, 165, 30);
INSERT INTO `product_stock` VALUES (166, 166, 30);
INSERT INTO `product_stock` VALUES (167, 167, 30);
INSERT INTO `product_stock` VALUES (168, 168, 30);
INSERT INTO `product_stock` VALUES (169, 169, 30);
INSERT INTO `product_stock` VALUES (170, 170, 30);
INSERT INTO `product_stock` VALUES (171, 171, 30);
INSERT INTO `product_stock` VALUES (172, 172, 30);
INSERT INTO `product_stock` VALUES (173, 173, 30);
INSERT INTO `product_stock` VALUES (174, 174, 30);
INSERT INTO `product_stock` VALUES (175, 175, 30);
INSERT INTO `product_stock` VALUES (176, 176, 30);
INSERT INTO `product_stock` VALUES (177, 177, 30);
INSERT INTO `product_stock` VALUES (178, 178, 30);
INSERT INTO `product_stock` VALUES (179, 179, 30);
INSERT INTO `product_stock` VALUES (180, 180, 30);

-- ----------------------------
-- Table structure for shipping_info
-- ----------------------------
DROP TABLE IF EXISTS `shipping_info`;
CREATE TABLE `shipping_info`  (
  `ship_id` int(11) NOT NULL AUTO_INCREMENT,
  `carrier_id` int(11) NOT NULL,
  `distribution_id` int(11) NOT NULL,
  `transport_num` int(11) NOT NULL,
  PRIMARY KEY (`ship_id`) USING BTREE,
  INDEX `fk_s_info_c`(`carrier_id`) USING BTREE,
  INDEX `fk_s_info_d_mode`(`distribution_id`) USING BTREE,
  CONSTRAINT `fk_s_info_c` FOREIGN KEY (`carrier_id`) REFERENCES `carrier` (`carrier_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_s_info_d_mode` FOREIGN KEY (`distribution_id`) REFERENCES `distribution_mode` (`distribution_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shipping_info
-- ----------------------------
INSERT INTO `shipping_info` VALUES (1, 1, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
