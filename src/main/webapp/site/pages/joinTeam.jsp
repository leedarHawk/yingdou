<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0, maximum-scale=1,user-scalable=yes" />
<meta name="format-detection" content="telephone=no" />
<title></title>
<link rel="stylesheet" href="<c:url value="/site/css/style.css" />" />
<script type="text/javascript" src="<c:url value="/site/js/jquery.js" />"></script>
<script type="text/javascript" src="<c:url value="/site/js/common.js?t=${_time }" />"></script>
<script type="text/javascript">
	$(function(){
		var inputs = '<c:out value="${team.candidateItems}" />';
		var input;
		if(inputs.length > 0) {
			$('tr.hidden').each(function(){
				input = $('input',this).prop('name');
				if(inputs.indexOf(input) > -1) {
					$(this).show();
				}
			});
		}
		$('form').submit(function(){
			var username = $.trim($('input[name=username]').val());
			if(username.length == 0) {
				AlertUtil.show("请您填写完整信息");
				return false;
			}
			var height = $.trim($('input[name=height]').val());
			if(height.length == 0){
				AlertUtil.show("请您填写完整信息");
				return false;
			}
			if(inputs.indexOf('height') > -1 && height.length > 0 && !CommonUtil.isNumber(height)) {
				AlertUtil.show("请输入正确的身高");
				return false;
			}
			var weight = $.trim($('input[name=weight]').val());
			if(weight.length == 0){
				AlertUtil.show("请您填写完整信息");
				return false;
			}
			if(inputs.indexOf('weight') > -1 && weight.length > 0 && !CommonUtil.isNumber(weight)) {
				AlertUtil.show("请输入正确的体重");
				return false;
			}
			var mobile = $.trim($('input[name=mobile]').val());
			if(mobile.length == 0){
				AlertUtil.show("请您填写完整信息");
				return false;
			}
			if(inputs.indexOf('mobile') > -1 && mobile.length > 0 && !CommonUtil.isMobile(mobile)) {
				AlertUtil.show("请输入正确的手机号");
				return false;
			}
			var qq = $.trim($('input[name=qq]').val());
			if(qq.length == 0){
				AlertUtil.show("请您填写完整信息");
				return false;
			}
			if(inputs.indexOf('qq') > -1 && qq.length > 0 && !CommonUtil.isNumber(qq)) {
				AlertUtil.show("请输入正确的QQ号");
				return false;
			}
			var msg = $.trim($("[name='msg']").val());

			if(CommonUtil.isBlank(msg)){
				AlertUtil.show("给咱们领队捎个信不能为空");
				return false;
			}
			if(CommonUtil.limit(20,msg)){
				AlertUtil.show("给咱们领队捎个信不超过20个字");
				return false;
			}
			return true;
		});
	});
</script>
<style type="text/css">
	tr.hidden {
		display:none;
	}
</style>
</head>

<body>
<%@ include file="../../commons/alert.jsp"%>
<div class="header"><span><a href="<c:url value="/site/team/detail/${team.id}" />"><img src="<c:url value="/site/images/jt_fh.png" />">返回</a></span>加入球队</div>
<form action="<c:url value="/site/team/candidate" />" method="post">
<input type="hidden" name="teamId" value="${team.id}" />
<div class="main3">
	<div class="jiaq_h1"><c:out value="${team.name }" /></div>
<table width="90%" border="0" cellspacing="0" cellpadding="5">
  <tr class="hidden">
    <td width="43%" height="50" align="right">*姓名：</td>
    <td width="57%" height="50"><input name="username" readonly type="text" class="fab_text" value="${user.username}"></td>
  </tr>
  <tr class="hidden">
    <td height="50" align="right">*身高(cm)：</td>
    <td height="50"><input name="height" type="text" class="fab_text" value="${user.height}"></td>
  </tr>
  <tr class="hidden">
    <td height="50" align="right">*体重(kg)：</td>
    <td height="50"><input name="weight" type="text" class="fab_text" value="${user.weight}"></td>
  </tr>
  <tr class="hidden">
    <td height="50" align="right">*手机：</td>
    <td height="50"><input name="mobile" type="text" class="fab_text" value="${user.mobile}"></td>
  </tr>
  <tr class="hidden">
    <td height="50" align="right">*QQ号：</td>
    <td height="50"><input name="qq" type="text" class="fab_text" value="${user.qq}"></td>
  </tr>
  <tr>
    <td height="90" align="right" valign="top">给群主捎个信儿：</td>
    <td><textarea class="fab_textare" name="msg" cols="" rows=""></textarea></td>
  </tr>
</table>
	<div class="bot_btn"><input class="lv_btn" name="" type="submit" value="提交"></div>
</div>
</form>
<div style="height:50px;"></div>
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
