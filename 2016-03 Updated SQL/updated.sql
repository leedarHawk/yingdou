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

ALTER TABLE `t_admin`
ADD COLUMN `status`  int(1) NULL COMMENT '1:有效的，2：无效的' AFTER `cityId`;


CREATE TABLE `t_game_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `gameId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `t_game_content`
ADD COLUMN `cityId`  int NOT NULL AFTER `gameId`,
ADD COLUMN `status`  int(1) NOT NULL DEFAULT 1 COMMENT '1=有效，0：无效' AFTER `cityId`;

ALTER TABLE `t_game_content`
ADD COLUMN `creatId`  int NOT NULL AFTER `status`,
ADD COLUMN `createTime`  datetime NULL AFTER `creatId`,
ADD COLUMN `updateTime`  datetime NULL AFTER `createTime`;

ALTER TABLE `t_game`
ADD COLUMN `cityId`  int NULL AFTER `teamNum`;

ALTER TABLE `t_team`
ADD COLUMN `cityId`  int(11) NULL AFTER `likes`,
ADD COLUMN `status`  int(2) NULL AFTER `cityId`;






