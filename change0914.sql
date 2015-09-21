CREATE TABLE `t_round` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creatorId` bigint(20) DEFAULT NULL COMMENT '球队创始人',
  `name` varchar(255) DEFAULT NULL COMMENT '球局名称',
  `startTime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '结束时间',
  `location` varchar(255) DEFAULT NULL COMMENT '地点',
  `feeType` int(11) DEFAULT NULL COMMENT '费用类型\n0免费\n1AA',
  `fee` int(11) DEFAULT NULL COMMENT '费用',
  `enrollType` int(11) DEFAULT NULL COMMENT '招募人数\n0不限\n1限定',
  `enrollLimit` int(11) DEFAULT NULL COMMENT '招募人数',
  `mobile` varchar(45) DEFAULT NULL COMMENT '联系电话',
  `contact` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL COMMENT '发布时间',
  `tid` int(11) DEFAULT NULL COMMENT '球队id',
  `members` int(11) DEFAULT NULL COMMENT '已有人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='约球局';


CREATE TABLE `t_roundApply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) DEFAULT NULL COMMENT '球局id',
  `username` varchar(255) DEFAULT NULL,
  `height` varchar(45) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `qq` varchar(45) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL COMMENT '申请日期',
  `status` int(11) DEFAULT NULL COMMENT '状态\n0未确定\n1确定',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='球局申请';