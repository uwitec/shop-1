/*
Navicat MySQL Data Transfer

Source Server         : fywx
Source Server Version : 50539
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50539
File Encoding         : 65001

Date: 2016-05-19 10:45:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `g_category`
-- ----------------------------
DROP TABLE IF EXISTS `g_category`;
CREATE TABLE `g_category` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` mediumint(9) NOT NULL COMMENT '父类别',
  `name` varchar(32) NOT NULL COMMENT '类别名称',
  `showFlag` bit(1) NOT NULL COMMENT '是否显示',
  `sort` tinyint(4) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类';

-- ----------------------------
-- Records of g_category
-- ----------------------------

-- ----------------------------
-- Table structure for `g_category_attr`
-- ----------------------------
DROP TABLE IF EXISTS `g_category_attr`;
CREATE TABLE `g_category_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` mediumint(9) NOT NULL COMMENT '商品分类ID',
  `attrName` varchar(16) NOT NULL COMMENT '属性名称',
  `searchFlag` bit(1) NOT NULL COMMENT '是否搜索项',
  `sort` tinyint(4) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类属性';

-- ----------------------------
-- Records of g_category_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `g_category_attr_val`
-- ----------------------------
DROP TABLE IF EXISTS `g_category_attr_val`;
CREATE TABLE `g_category_attr_val` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryAttrId` int(11) NOT NULL COMMENT '分类属性ID',
  `val` varchar(32) NOT NULL COMMENT '属性值',
  `sort` tinyint(4) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类属性值';

-- ----------------------------
-- Records of g_category_attr_val
-- ----------------------------

-- ----------------------------
-- Table structure for `g_discut_strategy`
-- ----------------------------
DROP TABLE IF EXISTS `g_discut_strategy`;
CREATE TABLE `g_discut_strategy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) NOT NULL COMMENT '商品ID',
  `buyNum` tinyint(4) NOT NULL COMMENT '购买数量',
  `discutMoney` mediumint(9) NOT NULL COMMENT '减去金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品优惠策略';

-- ----------------------------
-- Records of g_discut_strategy
-- ----------------------------

-- ----------------------------
-- Table structure for `g_goods`
-- ----------------------------
DROP TABLE IF EXISTS `g_goods`;
CREATE TABLE `g_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` mediumint(9) NOT NULL COMMENT '商品分类ID',
  `supperBrandId` mediumint(9) NOT NULL COMMENT '供应商品牌ID',
  `name` varchar(64) NOT NULL COMMENT '商品名称',
  `code` varchar(32) NOT NULL COMMENT '商品编码',
  `productCode` varchar(64) NOT NULL COMMENT '货品编码',
  `price` int(11) NOT NULL COMMENT '售价',
  `title` varchar(128) NOT NULL COMMENT '标题',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `newFlag` bit(1) NOT NULL COMMENT '是否新品',
  `hotFlag` bit(1) NOT NULL COMMENT '是否热销',
  `recommendFlag` bit(1) NOT NULL COMMENT '是否推荐',
  `attr1Name` varchar(32) NOT NULL COMMENT '主属性名称',
  `attr2Name` varchar(32) NOT NULL COMMENT '子属性名称',
  `attr2Val` varchar(128) NOT NULL COMMENT '子属性值, 逗号分割',
  `attr3Name` varchar(32) NOT NULL COMMENT '附加属性名称',
  `attr3Val` varchar(128) NOT NULL COMMENT '附加属性值, 逗号分割',
  `cartFlag` bit(1) NOT NULL COMMENT '是否进购物车',
  `freeExpressFlag` bit(1) NOT NULL COMMENT '是否免运费',
  `saleStartTime` bigint(20) NOT NULL COMMENT '促销开始时间',
  `saleEndTime` bigint(20) NOT NULL COMMENT '促销结束时间',
  `limitNum` mediumint(9) NOT NULL COMMENT '限购数量',
  `limitStartTime` bigint(20) NOT NULL COMMENT '限购开始时间',
  `limitEndTime` bigint(20) NOT NULL COMMENT '限购结束时间',
  `validityTime` bigint(20) NOT NULL COMMENT '有效期',
  `countDownFlag` bit(1) NOT NULL COMMENT '是否显示倒计时',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

-- ----------------------------
-- Records of g_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `g_goods_attr_val`
-- ----------------------------
DROP TABLE IF EXISTS `g_goods_attr_val`;
CREATE TABLE `g_goods_attr_val` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) NOT NULL COMMENT '商品ID',
  `categoryAttrValId` int(11) NOT NULL COMMENT '商品分类属性值ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性值\r\n放到mongoDb搜索，组合精确查询';

-- ----------------------------
-- Records of g_goods_attr_val
-- ----------------------------

-- ----------------------------
-- Table structure for `g_goods_statistic`
-- ----------------------------
DROP TABLE IF EXISTS `g_goods_statistic`;
CREATE TABLE `g_goods_statistic` (
  `id` int(11) NOT NULL,
  `sale` int(11) NOT NULL COMMENT '销量',
  `visit` int(11) NOT NULL COMMENT '热度',
  `favorite` int(11) NOT NULL COMMENT '收藏次数',
  `comment` int(11) NOT NULL COMMENT '评价次数',
  `best` int(11) NOT NULL COMMENT '好评',
  `ok` int(11) NOT NULL COMMENT '中评',
  `worse` int(11) NOT NULL COMMENT '差评',
  `image` int(11) NOT NULL COMMENT '晒图',
  `order` int(11) NOT NULL COMMENT '下单，包括各种状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品统计信息';

-- ----------------------------
-- Records of g_goods_statistic
-- ----------------------------

-- ----------------------------
-- Table structure for `g_goods_text`
-- ----------------------------
DROP TABLE IF EXISTS `g_goods_text`;
CREATE TABLE `g_goods_text` (
  `id` int(11) NOT NULL,
  `paramVals` varchar(1024) DEFAULT NULL COMMENT '商品参数详情 key:Val JSON',
  `detail` tinytext COMMENT '商品详情',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品详情文本';

-- ----------------------------
-- Records of g_goods_text
-- ----------------------------

-- ----------------------------
-- Table structure for `g_main_attr`
-- ----------------------------
DROP TABLE IF EXISTS `g_main_attr`;
CREATE TABLE `g_main_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) NOT NULL COMMENT '商品ID',
  `attrName` varchar(32) NOT NULL COMMENT '属性名称',
  `smallImg` varchar(128) NOT NULL COMMENT '小图',
  `bigImg` varchar(128) NOT NULL COMMENT '大图片',
  `stockNum` mediumint(9) NOT NULL COMMENT '库存数量',
  `price` mediumint(9) NOT NULL COMMENT '价格',
  `marketPrice` mediumint(9) NOT NULL COMMENT '市场价',
  `lowestPrice` mediumint(9) NOT NULL COMMENT '历史最低价',
  `salePrice` mediumint(9) NOT NULL COMMENT '促销价',
  `sort` tinyint(4) NOT NULL,
  `defaultFlag` bit(1) NOT NULL COMMENT '是否默认属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品主属性值';

-- ----------------------------
-- Records of g_main_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `g_mix_attr`
-- ----------------------------
DROP TABLE IF EXISTS `g_mix_attr`;
CREATE TABLE `g_mix_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mainAttrId` int(11) NOT NULL COMMENT '主属性值ID',
  `attr2Val` varchar(32) NOT NULL COMMENT '子属性值',
  `attr3Val` varchar(32) NOT NULL COMMENT '附加属性值',
  `stockNum` mediumint(9) NOT NULL COMMENT '库存',
  `price` mediumint(11) NOT NULL COMMENT '价格',
  `salePrice` mediumint(9) NOT NULL COMMENT '促销价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品多属性值';

-- ----------------------------
-- Records of g_mix_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `g_recommend`
-- ----------------------------
DROP TABLE IF EXISTS `g_recommend`;
CREATE TABLE `g_recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) NOT NULL COMMENT '商品ID',
  `relationId` int(11) NOT NULL COMMENT '推荐商品ID',
  `sort` tinyint(4) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品推荐';

-- ----------------------------
-- Records of g_recommend
-- ----------------------------

-- ----------------------------
-- Table structure for `m_ban_rule`
-- ----------------------------
DROP TABLE IF EXISTS `m_ban_rule`;
CREATE TABLE `m_ban_rule` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '规则名称',
  `obj` tinyint(2) NOT NULL COMMENT '规则对象 1：帐号 2：IP',
  `condition` tinyint(2) NOT NULL COMMENT '过滤条件 1：下单次数 2：订单金额 3：未付款订单',
  `threshold` mediumint(11) NOT NULL COMMENT '阀值',
  `time_unit` tinyint(2) NOT NULL COMMENT '封禁单位 1:月 2：天 3：小时 4：分钟',
  `time_num` int(11) NOT NULL COMMENT '封禁时间',
  `rule_status` tinyint(2) NOT NULL COMMENT '1：开启 0：关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='封禁规则';

-- ----------------------------
-- Records of m_ban_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `m_black`
-- ----------------------------
DROP TABLE IF EXISTS `m_black`;
CREATE TABLE `m_black` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `banRuleId` tinyint(11) NOT NULL,
  `startTime` bigint(14) NOT NULL,
  `endTime` bigint(14) NOT NULL COMMENT '为空表示 永久封禁',
  `realEndTime` bigint(14) NOT NULL COMMENT '实际结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='黑名单用户';

-- ----------------------------
-- Records of m_black
-- ----------------------------

-- ----------------------------
-- Table structure for `m_express`
-- ----------------------------
DROP TABLE IF EXISTS `m_express`;
CREATE TABLE `m_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` int(11) NOT NULL COMMENT '会员ID',
  `recipient` varchar(32) NOT NULL COMMENT '收件人姓名',
  `province` varchar(8) NOT NULL COMMENT '省',
  `city` varchar(8) NOT NULL COMMENT '市',
  `district` varchar(8) NOT NULL COMMENT '县区',
  `street` varchar(16) NOT NULL COMMENT '街道',
  `addr` varchar(128) NOT NULL COMMENT '详细地址',
  `postCode` varchar(6) NOT NULL COMMENT '邮政编码',
  `mobile` varchar(11) NOT NULL COMMENT '手机',
  `phone` varchar(32) NOT NULL COMMENT '联系电话',
  `qq` varchar(16) NOT NULL COMMENT 'QQ',
  `sort` tinyint(4) NOT NULL COMMENT '排序',
  `defaultFlag` bit(1) NOT NULL COMMENT '是否默认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收货地址表';

-- ----------------------------
-- Records of m_express
-- ----------------------------

-- ----------------------------
-- Table structure for `m_ip_black`
-- ----------------------------
DROP TABLE IF EXISTS `m_ip_black`;
CREATE TABLE `m_ip_black` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'IP地址',
  `ipAddr` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'IP实际地址',
  `startTime` bigint(14) NOT NULL COMMENT '开始时间',
  `endTime` bigint(14) NOT NULL COMMENT '结束时间 为空表示 永久封禁',
  `realEndTime` bigint(14) NOT NULL COMMENT '时间结束时间',
  `banRuleId` tinyint(11) NOT NULL COMMENT '规则ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='IP黑名单';

-- ----------------------------
-- Records of m_ip_black
-- ----------------------------

-- ----------------------------
-- Table structure for `m_level`
-- ----------------------------
DROP TABLE IF EXISTS `m_level`;
CREATE TABLE `m_level` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `levelName` varchar(16) NOT NULL,
  `minScore` mediumint(9) NOT NULL,
  `maxScore` mediumint(9) NOT NULL,
  `discount` tinyint(4) NOT NULL COMMENT '折扣率  /100',
  `showDiscountFlag` bit(1) NOT NULL COMMENT '是否显示折扣',
  `specialFlag` bit(1) NOT NULL COMMENT '是否特殊会员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员等级';

-- ----------------------------
-- Records of m_level
-- ----------------------------

-- ----------------------------
-- Table structure for `m_member`
-- ----------------------------
DROP TABLE IF EXISTS `m_member`;
CREATE TABLE `m_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(32) NOT NULL COMMENT '用户名',
  `nickName` varchar(32) NOT NULL COMMENT '昵称',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `realName` varchar(16) NOT NULL COMMENT '真实姓名',
  `sex` tinyint(4) NOT NULL COMMENT '性别 0：未知  1: 男  2：女',
  `phone` varchar(16) NOT NULL COMMENT '手机',
  `email` varchar(32) NOT NULL COMMENT '邮箱',
  `avatar` varchar(128) NOT NULL COMMENT '头像',
  `status` tinyint(4) NOT NULL COMMENT '会员状态',
  `levelId` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员等级Id',
  `brithday` bigint(20) NOT NULL COMMENT '生日',
  `regTime` bigint(20) NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员';

-- ----------------------------
-- Records of m_member
-- ----------------------------

-- ----------------------------
-- Table structure for `m_white`
-- ----------------------------
DROP TABLE IF EXISTS `m_white`;
CREATE TABLE `m_white` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `startTime` bigint(14) NOT NULL COMMENT '开始时间',
  `endTime` bigint(14) NOT NULL COMMENT '结束时间 为空表示 不限时间',
  `realEndTime` bigint(14) NOT NULL COMMENT '实际结束时间',
  `remark` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='白名单用户';

-- ----------------------------
-- Records of m_white
-- ----------------------------

-- ----------------------------
-- Table structure for `o_cart`
-- ----------------------------
DROP TABLE IF EXISTS `o_cart`;
CREATE TABLE `o_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) NOT NULL COMMENT 'BM6',
  `mainAttrId` int(11) NOT NULL COMMENT '商品主属性ID',
  `mixAttrId` int(11) NOT NULL COMMENT '商品多属性值ID',
  `memberId` int(11) NOT NULL COMMENT '会员ID',
  `num` smallint(6) NOT NULL COMMENT '购物车数量',
  `createTime` bigint(20) NOT NULL,
  `key` varchar(255) NOT NULL COMMENT '客户端cookie和缓存Key',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of o_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `o_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `o_favorite`;
CREATE TABLE `o_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) NOT NULL COMMENT '商品id',
  `memberId` int(11) NOT NULL COMMENT '会员id',
  `thatPrice` mediumint(9) NOT NULL COMMENT '收藏时价格',
  `remindPrice` mediumint(9) NOT NULL COMMENT '提醒阀值',
  `email` varchar(32) NOT NULL COMMENT '提醒邮箱',
  `phone` varchar(11) NOT NULL COMMENT '提醒手机',
  `createTime` bigint(20) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品收藏';

-- ----------------------------
-- Records of o_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for `o_order`
-- ----------------------------
DROP TABLE IF EXISTS `o_order`;
CREATE TABLE `o_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父订单ID',
  `memberId` int(11) NOT NULL COMMENT '会员ID',
  `orderCode` varchar(32) NOT NULL COMMENT '订单编码',
  `totalAmount` int(11) NOT NULL COMMENT '商品总金额',
  `expressAmount` mediumint(9) NOT NULL COMMENT '运费',
  `discountAmount` mediumint(9) NOT NULL COMMENT '优惠金额',
  `payAmount` int(11) NOT NULL COMMENT '支付金额',
  `payType` tinyint(4) NOT NULL COMMENT '支付方式',
  `payAccount` varchar(255) NOT NULL COMMENT '付款帐号',
  `payTime` bigint(20) NOT NULL COMMENT '支付时间',
  `payFlag` bit(1) NOT NULL COMMENT '是否已支付',
  `showFlag` bit(1) NOT NULL COMMENT '会员是否显示',
  `cancelType` tinyint(2) NOT NULL COMMENT '订单取消类型',
  `orderSource` tinyint(2) NOT NULL COMMENT '订单来源',
  `orderTime` bigint(20) NOT NULL COMMENT '下单时间',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o_order
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_attr`
-- ----------------------------
DROP TABLE IF EXISTS `sys_attr`;
CREATE TABLE `sys_attr` (
  `attrId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domainId` int(11) unsigned NOT NULL COMMENT '所属实体Id',
  `name` varchar(64) NOT NULL COMMENT '字段名',
  `cnName` varchar(64) NOT NULL COMMENT '中文名',
  `sqlName` varchar(64) NOT NULL COMMENT '数据库名',
  `type` varchar(32) DEFAULT NULL COMMENT '字段类型',
  `dbType` varchar(64) DEFAULT NULL COMMENT '数据库类型',
  `isId` char(1) DEFAULT NULL COMMENT '是否ID',
  `isNull` char(1) DEFAULT NULL COMMENT '是否可空',
  `isEdit` char(1) DEFAULT NULL COMMENT '是否可更新',
  `isUnique` char(1) DEFAULT NULL COMMENT '是否唯一',
  `inList` char(1) DEFAULT NULL COMMENT '是否列表展示',
  `inForm` char(1) DEFAULT NULL COMMENT '是否表单展示',
  `inQuery` char(1) DEFAULT NULL COMMENT '是否查询条件',
  `queryType` varchar(32) DEFAULT NULL COMMENT '查询匹配方式',
  `formType` varchar(32) DEFAULT NULL COMMENT '表单类型',
  `dictName` varchar(64) DEFAULT NULL COMMENT '所属字典',
  `maxLength` int(11) DEFAULT NULL COMMENT '最大长度',
  `inOrder` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`attrId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_auth`
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth`;
CREATE TABLE `sys_auth` (
  `authCode` varchar(64) NOT NULL,
  `menuId` int(10) unsigned DEFAULT NULL,
  `authName` varchar(16) NOT NULL,
  PRIMARY KEY (`authCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_auth
-- ----------------------------
INSERT INTO `sys_auth` VALUES ('auth:list', '7', '查询权限');
INSERT INTO `sys_auth` VALUES ('auth:update', '7', '修改权限');
INSERT INTO `sys_auth` VALUES ('dept:del', '10', '删除部门');
INSERT INTO `sys_auth` VALUES ('dept:list', '10', '查询部门');
INSERT INTO `sys_auth` VALUES ('dept:save', '10', '新增部门');
INSERT INTO `sys_auth` VALUES ('dept:update', '10', '修改部门');
INSERT INTO `sys_auth` VALUES ('dict:del', '6', '删除字典');
INSERT INTO `sys_auth` VALUES ('dict:list', '6', '查询字典');
INSERT INTO `sys_auth` VALUES ('dict:save', '6', '新增字典');
INSERT INTO `sys_auth` VALUES ('dict:update', '6', '修改字典');
INSERT INTO `sys_auth` VALUES ('dictItem:del', '6', '删除元素');
INSERT INTO `sys_auth` VALUES ('dictItem:list', '6', '查询元素');
INSERT INTO `sys_auth` VALUES ('dictItem:save', '6', '新增元素');
INSERT INTO `sys_auth` VALUES ('dictItem:status', '6', '启禁元素');
INSERT INTO `sys_auth` VALUES ('dictItem:update', '6', '修改元素');
INSERT INTO `sys_auth` VALUES ('log:list', '11', '日志查询');
INSERT INTO `sys_auth` VALUES ('menu:del', '5', '删除菜单');
INSERT INTO `sys_auth` VALUES ('menu:list', '5', '查询菜单');
INSERT INTO `sys_auth` VALUES ('menu:save', '5', '新增菜单');
INSERT INTO `sys_auth` VALUES ('menu:update', '5', '修改菜单');
INSERT INTO `sys_auth` VALUES ('role:auth', '4', '分配权限');
INSERT INTO `sys_auth` VALUES ('role:del', '4', '删除角色');
INSERT INTO `sys_auth` VALUES ('role:list', '4', '查询角色');
INSERT INTO `sys_auth` VALUES ('role:save', '4', '新增角色');
INSERT INTO `sys_auth` VALUES ('role:status', '4', '启禁角色');
INSERT INTO `sys_auth` VALUES ('role:update', '4', '修改角色');
INSERT INTO `sys_auth` VALUES ('user:del', '3', '删除用户');
INSERT INTO `sys_auth` VALUES ('user:list', '3', '查询用户');
INSERT INTO `sys_auth` VALUES ('user:restPassword', '3', '重置密码');
INSERT INTO `sys_auth` VALUES ('user:role', '3', '分配角色');
INSERT INTO `sys_auth` VALUES ('user:save', '3', '新增用户');
INSERT INTO `sys_auth` VALUES ('user:status', '3', '启禁用户');
INSERT INTO `sys_auth` VALUES ('user:update', '3', '修改用户');

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deptName` varchar(64) NOT NULL COMMENT '部门名称',
  `deptCode` varchar(32) NOT NULL COMMENT '部门编码',
  `orderNo` tinyint(4) DEFAULT NULL COMMENT '排序',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `pid` int(11) NOT NULL COMMENT '父id',
  `deptTel` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `deptAddr` varchar(128) DEFAULT NULL COMMENT '联系地址',
  `deptType` varchar(32) DEFAULT NULL COMMENT '部门类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '公司', 'ROOT', '1', '', '0', '155555555', '', '');

-- ----------------------------
-- Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `dictId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dictName` varchar(64) NOT NULL,
  `dictCode` varchar(32) NOT NULL,
  `dictType` tinyint(2) NOT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`dictId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '系统配置', 'DICT_SYS_CONF', '0', '系统公共配置', '1');
INSERT INTO `sys_dict` VALUES ('4', '文件上传', 'DICT_FILE', '0', '', '1');
INSERT INTO `sys_dict` VALUES ('5', '短信', 'SMS', '0', '', '1');
INSERT INTO `sys_dict` VALUES ('6', '短信返回状态', 'SMS_STATUS_CODE', '0', '', '1');

-- ----------------------------
-- Table structure for `sys_dict_item`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item` (
  `dictItemId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dictId` int(10) unsigned NOT NULL,
  `itemName` varchar(64) NOT NULL,
  `itemCode` varchar(32) NOT NULL,
  `itemVal` varchar(1024) DEFAULT NULL,
  `itemValExt` varchar(1024) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `orderNo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`dictItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES ('1', '1', '开启登录验证', 'VERITY_CODE_FLAG', 'false', '', '1', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('2', '1', '前台照片目录', 'FRONT_PIC_URL', 'false', '1212', '1', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('3', '1', '单用户登录', 'ONLY_SINGLE_LOGIN', 'false', null, '', '1', '3');
INSERT INTO `sys_dict_item` VALUES ('11', '1', '刷新权限', 'ITEM_FLUSH_AUTH', 'auto', null, '自动刷新 auto  手动刷新  hand', '1', '4');
INSERT INTO `sys_dict_item` VALUES ('12', '1', '部门根节点名称', 'ITEM_DEPT_ROOT', '创智财富', null, '', '1', '5');
INSERT INTO `sys_dict_item` VALUES ('13', '4', '默认文件夹', 'ITEM_FILE_DIR', 'upload', null, '', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('14', '4', '文件公共路径', 'ITEM_FILE_PUB_DIRS', 'file/', null, '', '1', '2');
INSERT INTO `sys_dict_item` VALUES ('15', '1', '开启自动登录', 'AUTO_LOGIN_FLAG', 'true', null, '', '1', '6');
INSERT INTO `sys_dict_item` VALUES ('83', '4', '默认文件夹', 'ITEM_FILE_DIR', 'upload', null, '', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('84', '4', '文件公共路径', 'ITEM_FILE_PUB_DIRS', 'file/', null, '', '1', '2');
INSERT INTO `sys_dict_item` VALUES ('85', '1', '开启自动登录', 'AUTO_LOGIN_FLAG', 'true', null, '', '1', '6');
INSERT INTO `sys_dict_item` VALUES ('86', '5', '短信发送地址', 'SMS_SEND_URL', 'http://116.213.72.20/SMSHttpService/send.aspx', null, '', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('87', '5', '短信接收回复地址', 'SMS_RECV_URL', 'http://116.213.72.20/SMSHttpService/getmsg.aspx', null, '', '1', '2');
INSERT INTO `sys_dict_item` VALUES ('88', '5', '短信余额查询地址', 'SMS_MONEY_URL', 'http://116.213.72.20/SMSHttpService/Balance.aspx', null, '', '1', '3');
INSERT INTO `sys_dict_item` VALUES ('89', '5', '用户名', 'SMS_UID', 'byjr3', null, '', '1', '4');
INSERT INTO `sys_dict_item` VALUES ('90', '5', '用户密码', 'SMS_PWD', 'byjr3', null, '', '1', '5');
INSERT INTO `sys_dict_item` VALUES ('91', '5', '短信线程一次发送记录数', 'SMS_SCAN_LIMIT', '10', null, '', '1', '6');
INSERT INTO `sys_dict_item` VALUES ('92', '5', '短信线程扫描间隔', 'SMS_SCAN_INTERVAL', '60000', null, '毫秒', '1', '7');
INSERT INTO `sys_dict_item` VALUES ('93', '6', '成送成功', '0', '', null, '', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('94', '6', '当前账号余额不足2', '1002', '', null, '', '1', '2');
INSERT INTO `sys_dict_item` VALUES ('95', '6', '当前用户密码错误', '1001', '', null, '', '1', '3');
INSERT INTO `sys_dict_item` VALUES ('97', '6', '手机号码格式不对', '-2', '', null, '', '1', '5');
INSERT INTO `sys_dict_item` VALUES ('99', '6', '其他错误', '1004', '', null, '', '1', '7');
INSERT INTO `sys_dict_item` VALUES ('100', '6', '预约时间格式不正确', '1005', '', null, '', '1', '8');
INSERT INTO `sys_dict_item` VALUES ('178', '5', '短信签名', 'SMS_SIGN', '【伯庸金融】', null, '', '1', '8');
INSERT INTO `sys_dict_item` VALUES ('182', '1', '代码模板路径', 'FTL_PATH', 'E:\\github\\platform_github\\base\\system-parent\\ext-code\\src\\main\\resources\\templates\\educate', '', '', '1', '7');

-- ----------------------------
-- Table structure for `sys_domian`
-- ----------------------------
DROP TABLE IF EXISTS `sys_domian`;
CREATE TABLE `sys_domian` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `domainName` varchar(64) NOT NULL COMMENT '实体名',
  `domainCnName` varchar(64) NOT NULL COMMENT '中文名',
  `domainSqlName` varchar(64) NOT NULL COMMENT '数据库',
  `pkgName` varchar(256) DEFAULT NULL COMMENT '包名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_domian
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_file_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_info`;
CREATE TABLE `sys_file_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fileName` varchar(1024) NOT NULL COMMENT '文件名',
  `fileType` tinyint(2) NOT NULL COMMENT '文件类型',
  `realFileName` varchar(64) NOT NULL COMMENT '原文件名',
  `fileSuffix` varchar(16) NOT NULL COMMENT '文件后缀名',
  `filePath` varchar(256) NOT NULL COMMENT '文件路径',
  `absolutePath` varchar(256) DEFAULT NULL COMMENT '绝对路径',
  `urlPath` varchar(256) NOT NULL COMMENT 'url访问地址',
  `saveWay` tinyint(2) NOT NULL COMMENT '保存方式',
  `width` int(6) DEFAULT NULL COMMENT '图片宽度',
  `height` int(6) DEFAULT NULL COMMENT '图片高度',
  `fileSize` int(10) NOT NULL COMMENT '文件大小',
  `originalImgId` int(11) DEFAULT NULL COMMENT '原始图Id',
  `extInfo` varchar(512) DEFAULT NULL COMMENT '扩展信息',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `createTime` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_file_info
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_log_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_info`;
CREATE TABLE `sys_log_info` (
  `id` int(11) NOT NULL,
  `clazz` varchar(128) NOT NULL COMMENT '调用类',
  `method` varchar(48) NOT NULL COMMENT '调用方法',
  `module` varchar(32) NOT NULL COMMENT '中文模块名',
  `info` varchar(256) DEFAULT NULL COMMENT '日志描述',
  `params` text COMMENT '方法参数',
  `ip` varchar(16) DEFAULT NULL,
  `userName` varchar(32) DEFAULT NULL COMMENT '当前用户',
  `costTime` int(11) NOT NULL COMMENT '调用耗时',
  `createTime` bigint(14) NOT NULL COMMENT '创建时间',
  `rs` tinyint(4) DEFAULT NULL COMMENT '结果类型 0：成功',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_log_info
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menuId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(10) unsigned DEFAULT NULL,
  `menuName` varchar(64) DEFAULT NULL,
  `menuType` tinyint(2) DEFAULT NULL,
  `menuUrl` varchar(512) DEFAULT NULL,
  `inco` varchar(64) DEFAULT NULL,
  `openType` tinyint(2) DEFAULT NULL,
  `orderNo` tinyint(4) DEFAULT NULL,
  `openState` tinyint(2) DEFAULT NULL,
  `publicFlag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('2', '0', '系统管理', '1', '', '', '1', '10', '1', '');
INSERT INTO `sys_menu` VALUES ('3', '2', '用户管理', '3', '/user/goTree', '', '1', '2', '1', '');
INSERT INTO `sys_menu` VALUES ('4', '2', '角色管理', '3', '/role/goList', '', '1', '3', '1', '');
INSERT INTO `sys_menu` VALUES ('5', '2', '菜单管理', '3', '/menu/goList', '', '1', '4', '1', '');
INSERT INTO `sys_menu` VALUES ('6', '2', '字典管理', '3', '/dict/goTree', '', '1', '7', '1', '');
INSERT INTO `sys_menu` VALUES ('7', '2', '权限管理', '3', '/auth/goTree', '', '1', '5', '1', '');
INSERT INTO `sys_menu` VALUES ('10', '2', '组织管理', '3', '/dept/goList', '', '1', '1', '1', '');
INSERT INTO `sys_menu` VALUES ('11', '2', '日志查看', '3', '/log/goList', '', '1', '8', '1', '');
INSERT INTO `sys_menu` VALUES ('14', '2', '缓存管理', '3', '/goAdmin', '', '1', '11', '1', '');
INSERT INTO `sys_menu` VALUES ('22', '2', '短信查看', '3', '/sms/goList', '', '1', '15', '1', '');
INSERT INTO `sys_menu` VALUES ('23', '2', '文件上传', '3', '/fileInfo/goFileUpload', '', '1', '16', '1', '');
INSERT INTO `sys_menu` VALUES ('24', '2', '图片上传', '3', '/fileInfo/goImgUpload', '', '1', '17', '1', '');
INSERT INTO `sys_menu` VALUES ('27', '2', '在线用户', '3', '/goWhoAreOnline', '', '1', '12', '1', '');
INSERT INTO `sys_menu` VALUES ('29', '2', '代码生产', '3', '/code/goList', '', '1', '12', '1', '');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `roleId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleName` varchar(16) DEFAULT NULL,
  `roleCode` varchar(64) DEFAULT NULL COMMENT '角色编码',
  `status` tinyint(2) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `canDelFlag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role_auth`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_auth`;
CREATE TABLE `sys_role_auth` (
  `roleAuthId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleId` int(10) unsigned DEFAULT NULL,
  `authCode` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`roleAuthId`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_sms`
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms`;
CREATE TABLE `sys_sms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(1024) NOT NULL COMMENT '短信内容',
  `smsType` int(11) NOT NULL COMMENT '短信类型',
  `sendTime` datetime DEFAULT NULL,
  `toPhones` varchar(1024) NOT NULL COMMENT '接收号码',
  `encode` varchar(1024) DEFAULT NULL COMMENT '自定义扩展号',
  `resStatus` varchar(1024) DEFAULT NULL COMMENT '返回状态',
  `resMsg` varchar(1024) DEFAULT NULL COMMENT '返回信息',
  `sid` varchar(1024) DEFAULT NULL COMMENT 'sid',
  `overLengthIgnore` char(1) DEFAULT NULL COMMENT '内容超70忽略',
  `sendRealTime` char(1) DEFAULT NULL COMMENT '是否实时发送',
  `retryTime` int(11) DEFAULT NULL COMMENT '重发次数',
  `curRetryTime` int(11) DEFAULT NULL COMMENT '当前发送次数',
  `recTime` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '消息状态 1.待发送， 2. 发送成功， 3. 发送失败 ',
  `bisExpInfo` varchar(1024) DEFAULT NULL COMMENT '异常信息',
  `originalId` int(10) unsigned DEFAULT NULL COMMENT '原始id，适应与短信内容超长分条发送',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_sms
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(16) NOT NULL COMMENT '用户名',
  `password` char(56) NOT NULL COMMENT '密码',
  `realName` varchar(32) DEFAULT NULL,
  `deptId` int(10) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `createUserId` int(10) unsigned DEFAULT NULL,
  `lastLoginTime` bigint(13) DEFAULT NULL,
  `loginIp` varchar(64) DEFAULT NULL,
  `addOn` varchar(1024) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `userType` tinyint(4) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `adminflag` bit(1) DEFAULT NULL,
  `createTime` bigint(13) DEFAULT NULL,
  `loginNum` int(11) DEFAULT NULL COMMENT '登录次数',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '8C24E4A28487E42FA6EE9E63ABC886A7A27432823050A5C377895734', '超级管理员', '0', '', '15059490712', '0', '1463476104551', '127.0.0.1', '1', '1', '1', '1', '', null, '8');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `userRoleId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned DEFAULT NULL,
  `roleId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`userRoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
