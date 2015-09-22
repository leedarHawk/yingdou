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
<div class="header"><span><a href="<c:url value="/site/team/detail/${teamId}" />"><img src="<c:url value="/site/images/jt_fh.png" />">返回</a></span></div>
<div class="main4">
	<div class="hydy_list">
	<p class="ph_jshtit">新加入成员</p>
	<ul class="hydy_txul">
		<c:forEach items="${newList}" var="user">
			<li><a href="<c:url value="/site/team/profile/${teamId }/${user.id }" />"><img src="<c:url value="${user.headPic}" />">${user.username}</a><span><a href="<c:url value="/site/team/profile/${teamId }/${user.id }" />">资料</a></span></li>
		</c:forEach>
	</ul>
	</div>

	<div class="hydy_list">
	<p class="ph_jshtit">球队老成员</p>
	<ul class="hydy_txul">
		<c:forEach items="${oldList}" var="_user">
			<c:if test="${_user.id == user.id }">
				<li><a href="<c:url value="/site/user/info/${_user.id }" />"><img src="<c:url value="${_user.headPic}" />">${user.username}</a><span><a href="<c:url value="/site/user/info/${user.id }" />">资料</a></span></li>
			</c:if>
			<c:if test="${_user.id != user.id }">
				<li><a href="<c:url value="/site/team/memberProfile/${teamId }/${_user.id }" />"><img src="<c:url value="${_user.headPic}" />">${_user.username}</a><span><a href="<c:url value="/site/team/memberProfile/${teamId }/${_user.id }" />">资料</a></span></li>
			</c:if>
		</c:forEach>
	</ul>
	</div>

</div>
<div class="footer">
<ul>
<li class="nav01"><a class="hover" href="<c:url value="/site/game/list" />">比赛</a></li>
<li class="nav02"><a href="<c:url value="/site/challenge/list" />">约战</a></li>
<li class="nav03"><a href="<c:url value="/site/team/list" />">球队</a></li>
<li class="nav04"><a href="<c:url value="/site/user/path/me" />">我</a></li>
</ul>
</div>
</body>
</html>
