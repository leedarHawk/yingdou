<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>
<META content=text/html;charset=utf-8 http-equiv=Content-Type ></Meta>
<link rel="stylesheet" type="text/css" href="../css/backstage.css" />
<div class="header">
	<dt><h1 style="color:#fff;">篮球后台管理系统</h1></dt>
	<dd><a href="" class="yhm"><img src="../images/touxiang.jpg">管理员&nbsp;<c:out value="${admin.username}" /></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:parent.document.location.href='<spring:url value="/admin/logout" />';void 0;">退出</a></dd>
</div>