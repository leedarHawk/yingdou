<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/frameset.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>篮球后台管理系统</TITLE>
<META content=text/html;charset=utf-8 http-equiv=Content-Type>
<META name=GENERATOR content="MCBN"></HEAD>
<FRAMESET frameSpacing=0 border=0 frameBorder=NO rows=90,*>
<FRAME noResize marginHeight=0 src="<spring:url value="/admin/pages/head.jsp" />" frameBorder=NO name=topFrame marginWidth=0 scrolling=no target="main" >
<FRAMESET id=frame cols=240,* rows=100%,*>
<FRAME noResize marginHeight=0 src="<spring:url value="/admin/pages/menu.jsp" />" frameBorder=0 name=left 
marginWidth=0 scrolling=yes target="main">
<FRAME marginHeight=0 src="<c:url value="/admin/game/list" />" frameBorder=0  name="main" id="main" title="main marginWidth=0 
target="_self">
<NOFRAMES>您的浏览器不支持框架</NOFRAMES>
</HTML>
