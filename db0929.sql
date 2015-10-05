
DROP DATABASE IF EXISTS `iyuesai`; 
CREATE DATABASE `iyuesai` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE iyuesai;

CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台管理员';


INSERT INTO `iyuesai`.`t_admin`
(`id`,
`username`,
`password`)
VALUES
(1,
'admin',
'AZICOnu9cyUFFvBp3xi1AA==');

CREATE TABLE `t_game` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '比赛名称',
  `duration` varchar(255) DEFAULT NULL COMMENT '比赛时间',
  `location` varchar(255) DEFAULT NULL COMMENT '比赛地点',
  `fee` int(11) DEFAULT NULL COMMENT '报名费用',
  `description` varchar(255) DEFAULT NULL COMMENT '赛事简介',
  `pic` varchar(120) DEFAULT NULL COMMENT '比赛logo、图片',
  `status` int(11) DEFAULT '0' COMMENT '比赛状态\n0未开始\n1进行中\n2已结束',
  `createType` int(11) DEFAULT '0' COMMENT '赛事创建类型\n0管理员创建\n1用户创建',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `createTime` datetime DEFAULT NULL COMMENT '赛事创建时间',
  `teamNum` int(11) DEFAULT NULL COMMENT '球队名额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='赛事';


CREATE TABLE `t_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostTeamId` int(11) DEFAULT NULL COMMENT '主队id',
  `guestTeamId` int(11) DEFAULT NULL COMMENT '客队id',
  `time` datetime DEFAULT NULL COMMENT '比赛时间',
  `location` varchar(45) DEFAULT NULL COMMENT '比赛地点',
  `fee` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '比赛状态\n0未开始\n1进行中\n2已结束',
  `score` varchar(45) DEFAULT NULL COMMENT '比赛结果',
  `creatorId` bigint(20) DEFAULT NULL COMMENT '发起人id',
  `creatorType` int(11) DEFAULT NULL COMMENT '发起人类型\n0管理员发起\n1普通用户发起',
  `gameId` bigint(20) DEFAULT '-1' COMMENT '关联的赛事id\n－1表示单场比赛',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单场比赛信息';

CREATE TABLE `t_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creatorId` bigint(20) DEFAULT NULL COMMENT '发起人id',
  `name` varchar(45) DEFAULT NULL COMMENT '球队名称',
  `slogan` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL COMMENT '活动地点',
  `members` int(11) DEFAULT NULL COMMENT '成员数量\n-1表示不限',
  `description` varchar(255) DEFAULT NULL COMMENT '球队说明',
  `needConfirm` int(11) DEFAULT NULL COMMENT '加入球队是否需要确认\n0不需要\n1需要',
  `candidateItems` varchar(255) DEFAULT NULL COMMENT '需要参加者留下的信息，包含姓名、身高、体重、手机号、qq',
  `createTime` datetime DEFAULT NULL COMMENT '创建日期',
  `pic` varchar(255) DEFAULT NULL COMMENT '球队logo',
  `likes` int(11) DEFAULT '0' COMMENT '点赞次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='球队';


CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `height` varchar(45) DEFAULT NULL COMMENT '身高',
  `weight` varchar(45) DEFAULT NULL COMMENT '体重',
  `position` varchar(45) DEFAULT NULL COMMENT '球场位置',
  `level` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `qq` varchar(45) DEFAULT NULL,
  `headPic` varchar(255) DEFAULT NULL,
  `uid` varchar(45) DEFAULT NULL COMMENT '用户唯一id,微信登录后返回',
  `country` varchar(45) DEFAULT NULL COMMENT '国家',
  `province` varchar(45) DEFAULT NULL COMMENT '省份',
  `city` varchar(45) DEFAULT NULL COMMENT '城市',
  `registerTime` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

CREATE TABLE `t_userTeam` (
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `tid` int(11) NOT NULL COMMENT '球队id',
  `status` int(11) DEFAULT NULL COMMENT '审批状态\n0未审批\n1审批通过\n2审批不通过',
  `time` datetime DEFAULT NULL COMMENT '如通过审批,表示用户加入球队时间 \n如未通过审批,表示拒绝的时间\n如未审批,表示申请加入时间',
  `msg` varchar(255) DEFAULT NULL COMMENT '申请留言',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户和球队关联表';



CREATE TABLE `t_gameAnnouncement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gameId` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL COMMENT '公告内容',
  `time` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='赛事公告';


CREATE TABLE `t_gameApply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gameId` bigint(20) DEFAULT NULL COMMENT '赛事id',
  `creatorId` bigint(20) DEFAULT NULL COMMENT '球队创始人id',
  `teamId` int(11) DEFAULT NULL COMMENT '球队id',
  `mobile` varchar(45) DEFAULT NULL COMMENT '联系电话',
  `qq` varchar(45) DEFAULT NULL COMMENT 'qq',
  `bakContactor` varchar(45) DEFAULT NULL COMMENT '备用联系人姓名',
  `bakMobile` varchar(45) DEFAULT NULL COMMENT '备用联系人电话',
  `creator` varchar(45) DEFAULT NULL COMMENT '球队创始人姓名',
  `team` varchar(45) DEFAULT NULL COMMENT '球队名称',
  `time` datetime DEFAULT NULL COMMENT '报名时间',
  `status` int(11) DEFAULT NULL COMMENT '审核状态\n0审核中\n1审核通过，去支付\n2已经报名\n3审核不通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='赛事报名';

CREATE TABLE `t_teamAlbum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teamId` int(11) DEFAULT NULL COMMENT '球队id',
  `pic` varchar(100) DEFAULT NULL COMMENT '球队图片',
  `time` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='球队相册';

CREATE TABLE `t_userScore` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '球员id',
  `gameId` bigint(20) DEFAULT NULL COMMENT '赛事id',
  `tid` int(11) DEFAULT NULL COMMENT '球队id',
  `score` int(11) DEFAULT NULL COMMENT '成绩',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='球员成绩';


CREATE TABLE `t_score` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `round` int(11) DEFAULT NULL COMMENT '比赛场次',
  `win` int(11) DEFAULT NULL COMMENT '胜几场',
  `lose` int(11) DEFAULT NULL COMMENT '输几场',
  `gameId` bigint(20) DEFAULT NULL COMMENT '赛事id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赛事球队成绩';

CREATE TABLE `iyuesai`.`t_userTeamLike` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `uid` BIGINT NULL COMMENT '用户id',
  `tid` INT NULL COMMENT '球队id',
  `time` DATETIME NULL COMMENT '点赞时间',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '用户对球队点赞记录';

CREATE TABLE `t_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gameId` bigint(20) DEFAULT NULL COMMENT '赛事id',
  `teamId` int(11) DEFAULT NULL COMMENT '球队id',
  `creatorId` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `fee` int(11) DEFAULT NULL COMMENT '报名费用',
  `payTime` datetime DEFAULT NULL COMMENT '支付时间',
  `orderNo` varchar(255) DEFAULT NULL COMMENT '订单号',
  `orderName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=ucs2 COMMENT='赛事支付订单';


CREATE TABLE `t_challenge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creatorId` bigint(20) DEFAULT NULL COMMENT '发起人id',
  `teamId` int(11) DEFAULT NULL COMMENT '球队id',
  `time` datetime DEFAULT NULL COMMENT '开始时间',
  `location` varchar(255) DEFAULT NULL COMMENT '地点',
  `feeType` int(11) DEFAULT NULL COMMENT '费用类型\n0免费\n1AA制\n',
  `fee` int(11) DEFAULT NULL COMMENT '费用',
  `needReferee` int(11) DEFAULT NULL COMMENT '需要裁判\n0不需要\n1需要',
  `mobile` varchar(45) DEFAULT NULL,
  `firstBakMobile` varchar(45) DEFAULT NULL,
  `secondBakMobile` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL COMMENT '需要参加者留下的联系方式，qq或手机',
  `guestTeamId` int(11) DEFAULT NULL COMMENT '约战方球队id',
  `score` varchar(45) DEFAULT NULL COMMENT '比分',
  `status` int(11) DEFAULT NULL COMMENT '约战状态\n0等待应战\n1等待上传比分\n2比赛完成',
  `ps` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='发布的约战信息';

CREATE TABLE `t_acceptInfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL COMMENT '球队id',
  `qq` varchar(45) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `challengeId` bigint(20) DEFAULT NULL COMMENT '约战id',
  `mobile` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='约战应战';

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








