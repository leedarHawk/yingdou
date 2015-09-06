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
<div class="header">比赛</div>
<div class="main">
	<div id="wechat"></div>
	<c:forEach items="${list}" var="game">
		<div class="in_tp">
			<a href="<c:url value="/site/game/gameInfo/" />${game.id }"><img src="<c:url value="${game.pic }" />">
				<span>${game.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${game.duration}</span>
			</a>
		</div>
	</c:forEach>
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
