CREATE TABLE `t_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityName` varchar(200) NOT NULL,
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '1=有效，0=无效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `t_city`
ADD COLUMN `createTime`  datetime NULL DEFAULT NULL COMMENT '创建时间' AFTER `status`,
ADD COLUMN `updateTime`  datetime NULL DEFAULT NULL COMMENT '修改时间' AFTER `createTime`;



ALTER TABLE `t_admin`
ADD COLUMN `type`  int(1) NULL COMMENT '1=系统总管理员,2=区域管理员' AFTER `updateTime`,
ADD COLUMN `cityId`  int(11) NULL COMMENT ' 如果是区域管理员，则显示所在的城市的ID' AFTER `type`;



