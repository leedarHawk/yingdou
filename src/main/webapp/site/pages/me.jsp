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
<style type="text/css">
	span.notice {
		background:#c0c0c0;
		display:inline-block;
		width:22%;
		color:#fff;
		height: 32px;
	    line-height: 32px;
	    font-size: 14px;
	    text-align: center;
	    margin: 0 auto;
	    border-radius: 5px;
	}
</style>
<script type="text/javascript">
	var PageUtil = {
			pay : function(url,creatorId,uid) {
				if(creatorId == uid) {
					location.href = url;
				}else {
					AlertUtil.show('只有球队创建者才能支付喔');
				}
			}
	}
</script>
</head>

<body>
<%@ include file="../../commons/alert.jsp"%>
<div class="header">我<font><a href="<c:url value="/site/user/settings" />">设置</a></font></div>
<div class="main">
	<dl class="hy_topdl">
	<dt><img src="<c:url value="${user.headPic}" />"></dt>
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
		<li><span>身高：</span>${user.height}</li>
		<li><span>水平：</span>${user.level}</li>
		<li><span>体重：</span>${user.weight}</li>
		<li><span>手机号：</span>${user.mobile}</li>
		<li><span>球场位置：</span>${user.position}</li>
		<li><span>QQ号：</span>${user.qq}</li>
	</ul>
	<script type="text/javascript" src="<c:url value="/site/js/qh.js" />" ></script>
	<!--切换内容开始0-->
	<div id="TabbedPanels2" class="hangy_qh3">
		<ul class="TabbedPanelsTabGroup">        
			<li class="TabbedPanelsTab" tabindex="0" style="border:0;">我的比赛</li>
			<li class="TabbedPanelsTab" tabindex="0">我的球局</li>
			<li class="TabbedPanelsTab" tabindex="0">我的球队<c:if test="${num > 0 }"><span><c:out value="${num }" /></span></c:if></li>
		</ul>
		<div class="TabbedPanelsContentGroup">
		<!--比赛-->
		<div class="TabbedPanelsContent">
		<c:forEach items="${gameList }" var="game">
			<div class="hywo_con">
				<dl class="hywo_dl">
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
						<p><i class="lv_zhf"><span><a href="javascript:PageUtil.pay('<c:url value="/site/pages/pay.html?gameName=" /><c:out value="${game.name }" />&gameId=<c:out value="${game.id }" />&fee=<c:out value="${game.fee }" />',<c:out value="${game.creatorId }" />,<c:out value="${user.id }" />);void 0;">去支付</a></span></i></p>
					</c:when>
					<c:when test="${game.status == 2 }">
						<p><i><span class="notice">已报名</span></i></p>
					</c:when>
					<c:when test="${game.status == 3 }">
						<p><i><span class="notice">审核不通过</span></i></p>
					</c:when>
				</c:choose>
			</div>
		</c:forEach>
		</div>

		<!--球局-->
		<div class="TabbedPanelsContent">
	<%-- <dl class="hydy_dl">
	<dt><a href=""><img src="<c:url value="/site/images/in_tp2.jpg" />"></a></dt>
	<dd>
	<strong><a href="">喜欢打篮球的一起来嗨森！</a></strong>
	<ul>
	<li><span>发起人：</span>长腿美眉</li>
	<li><span>时间：</span>2015年9月12日 18:00</li>
	<li><span>地点：</span>北京体育大学</li>
	<li><span>剩余/招募：</span>5/6</li>
	</ul>
	</dd>
	</dl>
	
	<dl class="hydy_dl">
	<dt><a href=""><img src="<c:url value="/site/images/in_tp2.jpg" />"></a></dt>
	<dd>
	<strong><a href="">喜欢打篮球的一起来嗨森！</a></strong>
	<ul>
	<li><span>发起人：</span>长腿美眉</li>
	<li><span>时间：</span>2015年9月12日 18:00</li>
	<li><span>地点：</span>北京体育大学</li>
	<li><span>剩余/招募：</span>5/6</li>
	</ul>
	<b>已参加</b>
	</dd>
	</dl> --%>
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
					</ul>
				</dd>
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
