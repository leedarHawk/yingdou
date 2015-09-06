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
<div class="header"><span><a href="javascript:history.go(-1);void 0;"><img src="<c:url value="/site/images/jt_fh.png" />">返回</a></span></div>
<div class="main3">
	<dl class="hy_topdl">
	<dt><img src="<c:url value="${team.pic }" />"></dt>
	<dd>
	<strong><c:out value="${team.name }" /></strong>
	</dd>
	</dl>
	
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td width="35%" height="35" align="right">*球队名称：</td>
    <td width="65%" height="35"><c:out value="${team.name }" /></td>
  </tr>
  <tr>
    <td height="35" align="right">*姓名：</td>
    <td height="35"><c:out value="${member.username }" /></td>
  </tr>
  <tr>
    <td height="35" align="right">*手机号码：</td>
    <td height="35"><c:out value="${member.mobile }" /></td>
  </tr>
  <tr>
    <td height="35" align="right">*QQ号：</td>
    <td height="35"><c:out value="${member.qq }" /></td>
  </tr>
  <tr>
    <td height="35" align="right" valign="top">给群主捎个信儿：</td>
    <td height="35" valign="top"><c:out value="${userTeam.msg }" /></td>
  </tr>
</table>

<ul class="hy_btn">
<li><a href="<c:url value="/site/team/delete/${userTeam.id }/${team.id }" />" class="red_del">删除</a></li>
</ul>

</div>

</body>
</html>
