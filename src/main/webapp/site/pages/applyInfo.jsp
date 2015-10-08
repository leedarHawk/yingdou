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
<div class="header"><span><a href="<c:url value="/site/game/gameInfo/${gameApply.gameId }" />"><img src="<c:url value="/site/images/jt_fh.png" />">返回</a></span></div>
<br class="main3">
	<dl class="hy_topdl">
	<dt><img src="<c:url value="${team.pic }" />"></dt>
	<dd>
	<strong><c:out value="${gameApply.team }" /></strong>
	</dd>
	</dl>
	
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td width="35%" height="35" align="right">*球队名称：</td>
    <td width="65%" height="35"><c:out value="${gameApply.team }" /></td>
  </tr>
  <tr>
    <td height="35" align="right">*姓名：</td>
    <td height="35"><c:out value="${gameApply.creator }" /></td>
  </tr>
  <tr>
    <td height="35" align="right">*手机号码：</td>
    <td height="35"><c:out value="${gameApply.mobile }" /></td>
  </tr>
  <tr>
    <td height="35" align="right">*QQ号：</td>
    <td height="35"><c:out value="${gameApply.qq }" /></td>
  </tr>
  <tr>
    <td height="35" align="right" valign="top">备用联系人姓名：</td>
    <td height="35" valign="top"><c:out value="${gameApply.bakContactor }" /></td>
  </tr>
  <tr>
    <td height="35" align="right" valign="top">备用联系人电话：</td>
    <td height="35" valign="top"><c:out value="${gameApply.bakMobile }" /></td>
  </tr>
</table>

<ul class="hy_btn">
  <li> <strong>提交报名表成功</strong></li>
</ul>


<ul class="hy_btn">
<li><a href="<c:url value="/site/game/deleteGameApply/${gameApply.id }/${gameApply.gameId }" />" class="red_del">取消报名</a></li>
</ul>

</div>
<div style="height:60px;"></div>
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
