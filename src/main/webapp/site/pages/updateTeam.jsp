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
<script type="text/javascript">
	$(function(){
		PageUtil.init();
	});
	var PageUtil = {
			init : function() {
				var _this = this;
				$('input.lv_btn').click(function(){
					_this.update();
				});
			},
			update : function() {
				var slogan = $.trim($('input[name=slogan]').val());
				var description = $.trim($('textarea[name=description]').val());
				location.href = "<c:url value="/site/team/update/${team.id}/" />" + slogan + "/" + description;
			}
	};
</script>
</head>

<body>
<div class="header"><span><a href="javascript:history.go(-1);void 0;"><img src="<c:url value="/site/images/jt_fh.png" />">返回</a></span>修改球队</div>
<div class="main3">
	<div class="jiaq_h1"><c:out value="${team.name }" /></div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="50" align="right">球队口号：</td>
    <td height="50"><input name="slogan" type="text" class="fab_text" value="<c:out value="${team.slogan }" />"></td>
  </tr>
  <tr>
    <td height="90" align="right" valign="top">球队公告：</td>
    <td><textarea class="fab_textare" name="description" cols="" rows=""><c:out value="${team.description }" /></textarea></td>
  </tr>
</table>
	<div class="bot_btn"><input class="lv_btn" name="" type="button" value="确定"></div>
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
