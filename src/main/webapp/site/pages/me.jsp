<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0, maximum-scale=1,user-scalable=yes" />
<meta name="format-detection" content="telephone=no" />
<title></title>
<link rel="stylesheet" href="<c:url value="/site/css/style.css" />" />
<script type="text/javascript" src="<c:url value="/site/js/jquery.js" />"></script>
<script type="text/javascript" src="<c:url value="/site/js/common.js?t=${_time }" />"></script>
<style type="text/css">
	span.notice {
		background:#c0c0c0;
		display:inline-block;
		width:70px;
		color:#fff;
		height: 32px;
	    line-height: 32px;
	    font-size: 14px;
	    text-align: center;
	    margin: 0 auto;
	    border-radius: 5px;
	}
	.circle {
		border-radius: 50%;
		width: 70px;
		height: 70px; 
		background:#f00;
		position:absolute;
		left:50%;
		top:50%;
		margin-left:-35px;
		margin-top:-35px;
		text-align:center;
		line-height:70px;
		color:#fff;
		font-weight:bold;
		opacity:0.5;
	}
	.circleRound {
		border-radius: 100%;
		width: 80px;
		height: 80px; 
		background:#f00;
		position:absolute;
		left:50%;
		top:50%;
		margin-left:-45px;
		margin-top:-35px;
		text-align:center;
		line-height:80px;
		color:#fff;
		font-weight:bold;
		opacity:0.5;
	}
	div.round-status {
		text-align:center;
	}
	div.round-status b {
		display:inline-block; 
		width:70px; 
		text-align:center; 
		margin-top:15px; 
		background:#c0c0c0; 
		height:32px; 
		line-height:32px;
		border-radius:5px; 
		font-weight:normal;
		color:#fff;
	}
</style>
<script type="text/javascript">
	function detail(rid,cid) {
		location.href = '<c:url value="/site/challenge/roundApplyList/" />' + rid + '/' + cid;
	}
	var PageUtil = {
			pay : function(url,creatorId,uid) {
				if(creatorId == uid) {
					location.href = url;
				}else {
					AlertUtil.show('只有球队创建者才能支付喔');
				}
			},
			toGame : function(id) {
				location.href = '<c:url value="/site/game/gameInfo/" />' + id;
			},
			toChallenge : function(position) {
				location.href = '<c:url value="/site/challenge/list" />#' + position;
			},
			toChallengeInfo : function(url) {
				location.href = url;
				return false;
			}
	};
</script>
</head>

<body>
<%@ include file="../../commons/alert.jsp"%>
<div class="header">我<font><a href="<c:url value="/site/user/settings" />">设置</a></font></div>
<div class="main">
	<dl class="hy_topdl">
	<dt><img src="<c:if test="${not empty user.headPic }" ><c:url value="${user.headPic}" /></c:if><c:if test="${empty user.headPic }"><c:url value="/site/images/unknown.png" /></c:if>"></dt>
	<dd>
	<strong>
		${user.username}
		<c:if test="${user.sex=='男' }">
			<img alt="" src="<c:url value="/site/images/xingb.png" />">
		</c:if>
		<c:if test="${user.sex=='女' }">
			<img alt="" src="<c:url value="/site/images/xingb2.png" />">
		</c:if>
	</strong>
	<!-- <p>好久不见好久不见好久不见！</p> -->
	</dd>
	</dl>
	<ul class="hy_taul">
		<li><span>身高：</span><c:if test="${fn:length(user.height) > 0}">${user.height}cm</c:if><c:if test="${fn:length(user.height) == 0}">无</c:if></li>
		<li><span>水平：</span>${user.level}</li>
		<li><span>体重：</span><c:if test="${fn:length(user.weight) > 0}">${user.weight}kg</c:if><c:if test="${fn:length(user.weight) == 0}">无</c:if></li>
		<li><span>手机号：</span><c:if test="${fn:length(user.mobile) > 0}">${user.mobile}</c:if><c:if test="${fn:length(user.mobile) == 0}">无</c:if></li>
		<li><span>球场位置：</span>${user.position}</li>
		<li><span>QQ号：</span><c:if test="${fn:length(user.qq) > 0}">${user.qq}</c:if><c:if test="${fn:length(user.qq) == 0}">无</c:if></li>
	</ul>
	<script type="text/javascript" src="<c:url value="/site/js/qh.js" />" ></script>
	<!--切换内容开始0-->
	<div id="TabbedPanels2" class="hangy_qh3">
		<ul class="TabbedPanelsTabGroup">        
			<li class="TabbedPanelsTab" tabindex="0" style="border:0;">我的比赛<c:if test="${myChallengesNum > 0 }"><span><c:if test="${myChallengesNum > 9 }">9+</c:if><c:if test="${myChallengesNum <= 9}"><c:out value="${myChallengesNum }" /></c:if></span></c:if></li>
			<li class="TabbedPanelsTab" tabindex="1">我的球局<c:if test="${myRoundApplyNum > 0 }"><span><c:if test="${myRoundApplyNum > 9 }">9+</c:if><c:if test="${myRoundApplyNum <= 9}"><c:out value="${myRoundApplyNum }" /></c:if></span></c:if></li>
			<li class="TabbedPanelsTab" tabindex="2">我的球队<c:if test="${num > 0 }"><span><c:if test="${num > 9 }">9+</c:if><c:if test="${num <= 9}"><c:out value="${num }" /></c:if></span></c:if></li>
		</ul>
		<div class="TabbedPanelsContentGroup">
		<!--比赛-->
		<div class="TabbedPanelsContent">
		<c:forEach items="${gameList }" var="game">
			<div class="hywo_con" onclick="PageUtil.toGame(${game.gameId})">
				<dl class="hywo_dl hydy_dl" style="border-bottom:none;">
					<dt><a href=""><img src="<c:url value="${game.pic }" />"></a></dt>
					<dd>
						<strong><a href=""><c:out value="${game.name }" /></a></strong>
							<ul>
								<li>时间：<c:out value="${game.duration }" /></li>
								<li>地点：<c:out value="${game.location }" /></li>
								<li>费用：¥<c:out value="${game.fee }" /></li>
							</ul>
					</dd>
				</dl>
				<c:choose>
					<c:when test="${game.status == 0 }">
						<p><i><span class="notice">审核中</span></i></p>
					</c:when>
					<c:when test="${game.status == 1 }">
						<p><i class="lv_zhf"><span><a href="javascript:PageUtil.pay('<c:url value="/site/pages/pay.html?gameName=" /><c:out value="${game.name }" />&gameId=<c:out value="${game.gameId }" />&fee=<c:out value="${game.fee }" />',<c:out value="${game.creatorId }" />,<c:out value="${user.id }" />);void 0;">去支付</a></span></i></p>
					</c:when>
					<c:when test="${game.status == 2 }">
						<p><i><span class="notice">已报名</span></i></p>
					</c:when>
					<c:when test="${game.status == 3 }">
						<p><i><span class="notice">审核不通过</span></i> <i class="lv_zhf"><span><a href="<c:url value="/site/game/candidate/${game.gameId}" />">重新报名</a></span></i></p>
					</c:when>
				</c:choose>
			</div>
		</c:forEach>
		<!-- 约战  -->
		<c:forEach items="${myChallenges }" var="challenge">
						<div class="yuez_con" onclick="PageUtil.toChallenge('c_${challenge.id}')">
							<dl class="hybs_dl">
								<dt>
									<img src="<c:url value="${challenge.host.pic }" />"><c:out value="${challenge.host.name }" />
								</dt>
								<dd>
									<c:if test="${empty challenge.guest }">
										<strong>VS</strong>
										<p>等待应战</p>
									</c:if>
									<c:if test="${not empty challenge.guest }">
										<c:if test="${challenge.status==1 }">
											<strong>VS</strong>
											<p>等待上传比分</p>
										</c:if>
										<c:if test="${challenge.status==2 }">
											<strong>${challenge.score }</strong>
											<p>比赛完成</p>
										</c:if>
									</c:if>
								</dd>
								<dt>
									<c:if test="${empty challenge.guest }">
										<div style="position:relative;"><c:if test="${challenge.creatorId == user.id }"><a href="javascript:PageUtil.toChallengeInfo('<c:url value="/site/challenge/acceptInfoList/${challenge.id }" />');void 0;"><div class="circle">${challenge.count }</div></a></c:if><img src="<c:url value="/site/images/tx_no.png" />"></div><%-- <input
											class="lv_btn" id="btnshow" onClick="showdiv(<c:out value="${challenge.id }" />,<c:out value="${challenge.teamId}" />);" name=""
											type="button" value="应战"> --%>
									</c:if>
									<c:if test="${not empty challenge.guest }">
										<img src="<c:url value="${challenge.guest.pic }" />"><c:out value="${challenge.guest.name }" />
									</c:if>
								</dt>
							</dl>
							<ul class="hybs_ul">
								<li>时间：<fmt:formatDate value="${challenge.time}" type="both" pattern="yyyy年MM月dd日 HH:mm"/></li>
								<li>裁判：<c:if test="${challenge.needReferee == 1 }">待定</c:if><c:if test="${challenge.needReferee == 0 }">无</c:if></li>
								<li>地点：<c:out value="${challenge.location }" /></li>
								<li>费用：<c:if test="${challenge.feeType == 0 }">免费</c:if><c:if test="${challenge.feeType == 1 }">¥<c:out value="${challenge.fee }" />(AA)</c:if></li>
							</ul>
						</div>
					</c:forEach>
		</div>

		<!--球局-->
		<div class="TabbedPanelsContent">
		<c:forEach items="${myRoundApplys }" var="ra">
			<dl class="hydy_dl" onclick="PageUtil.toChallenge('r_${ra.round.id}')">
			<dt style="position:relative;">
				<c:if test="${user.id == ra.round.creatorId }">
					<c:if test="${not empty ra.round.team }">
						<a href="javascript:detail(${ra.round.id },${ra.round.creatorId });void 0;"><div class="circleRound">${ra.round.applyNum }</div><img src="<c:url value="${ra.round.team.pic }" />"></a>
					</c:if>
					<c:if test="${empty ra.round.team }">
						<a href="javascript:detail(${ra.round.id },${ra.round.creatorId });void 0;"><div class="circleRound">${ra.round.applyNum }</div><img src="<c:url value="/site/images/round.png" />"></a>
					</c:if>
				</c:if>
				<c:if test="${ user.id != ra.round.creatorId}">
					<c:if test="${not empty ra.round.team }">
						<img src="<c:url value="${ra.round.team.pic }" />">
					</c:if>
					<c:if test="${empty ra.round.team }">
						<img src="<c:url value="/site/images/round.png" />">
					</c:if>
				</c:if>
			</dt>
			<strong>${ra.round.name }</strong>
			<ul>
				<li><span>发起人：</span>${ra.round.user.username }</li>
				<li><span>时间：</span><fmt:formatDate value="${ra.round.startTime}" pattern="yyyy年MM月dd日 HH:mm"/><c:if test="$(round.endTime != '1970-01-01 00:00:00')">至<fmt:formatDate value="${ra.round.endTime}" pattern="yyyy年MM月dd日 HH:mm"/></c:if></li>
				<li><span>地点：</span>${ra.round.location }</li>
				<li"><span style="padding-left:89px;">报名/招募：</span>${ra.round.members }/<c:if test="${ra.round.enrollType==0 }">不限</c:if><c:if test="${ra.round.enrollType == 1 }">${ra.round.enrollLimit }</c:if></li>
			</ul>
			<div class="round-status">
				<c:if test="${ra.status == 0 }"><b>审核中</b></c:if><c:if test="${ra.status == 1 }"><b>已参加</b></c:if>
			</div>
			</dd>
			</dl>
		</c:forEach>
		</div>
		
		<!--我的球队-->
		<div class="TabbedPanelsContent">
		<c:forEach items="${list }" var="team">
			<dl class="hydy_dl">
				<dt><a href="<c:url value="/site/team/detail/${team.id }" />"><img src="<c:url value="${team.pic }" />"></a></dt>
				<dd>
					<strong><a href="<c:url value="/site/team/detail/${team.id }" />">${team.name }</a></strong>
					<ul>
						<li><span>发起人：</span>${team.creator.username }</li>
						<li><span>活动地点：</span>${team.location }</li>
						<li><span>成员数量：</span>${fn:length(team.member)}</li>
						<li><span>球队公告：</span>${team.slogan }</li>
						<li><span>球队简介：</span>${team.description }</li>
					</ul>
				</dd>
				<c:if test="${not empty team.applicants && user.id == team.creator.id }">
					<div style="text-align:center;"><a style="background:#f00;color:#fff;padding:5px;" href="<c:url value="/site/team/allMembers?teamId=${team.id }" />">有${fn:length(team.applicants)}个小伙伴加入你的球队</a></div>
				</c:if>
			</dl>
		</c:forEach>
		</div>

		</div>
	<script type="text/javascript">
	var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels2");
	</script>
	</div>
	<!--切换内容 结束0-->	   

</div>
<div class="footer">
<ul>
<li class="nav01"><a href="<c:url value="/site/game/list" />">比赛</a></li>
<li class="nav02"><a href="<c:url value="/site/challenge/list" />">约战</a></li>
<li class="nav03"><a href="<c:url value="/site/team/list" />">球队</a></li>
<li class="nav04"><a class="hover" href="<c:url value="/site/user/path/me" />">我</a></li>
</ul>
</div>
</body>
</html>
