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
</head>

<body>
<div class="header">球队<b><a href="<c:url value="/site/team/toCreate" />">创建球队</a></b></div>
<div class="main2">
	<c:forEach items="${list}" var="team">
		<dl class="qiud_dl">
		<dt><a href="<c:url value="/site/team/detail/${team.id }" />"><img src="<c:url value="${team.pic}" />"></a></dt>
		<dd>
		<strong><a href="<c:url value="/site/team/detail/${team.id }" />"><c:url value="${team.name}" /></a></strong>
		<ul>
		<li><span>发起人：</span><c:out value="${team.creator.username }" /></li>
		<li><span>活动地点：</span><c:url value="${team.location}" /></li>
		<li><span>成员数量：</span>${fn:length(team.member) }</li>
		<li><span>球队公告：</span><c:url value="${team.slogan}" /></li>
		</ul>
		</dd>
		</dl>
	</c:forEach>
</div>
<div class="footer">
<ul>
<li class="nav01"><a href="<c:url value="/site/game/list" />">比赛</a></li>
<li class="nav02"><a href="<c:url value="/site/challenge/list" />">约战</a></li>
<li class="nav03"><a class="hover" href="<c:url value="/site/team/list" />">球队</a></li>
<li class="nav04"><a href="<c:url value="/site/user/path/me" />">我</a></li>
</ul>
</div>

</body>
</html>
