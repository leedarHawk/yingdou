CREATE TABLE `t_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(200) NOT NULL,
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '1=有效，0=无效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

