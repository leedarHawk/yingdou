<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理-登录</title>
<link rel="stylesheet" type="text/css" href="<spring:url value="/admin/css/login.css" />" />
<script type="text/javascript" src="<spring:url value="/admin/js/jquery.min.js" />"></script>
<script type="text/javascript" src="<spring:url value="/admin/js/jquery-ui.min.js" />"></script>
<script type="text/javascript">
	$(function(){
		PageUtil.init();
	});
	var PageUtil = {
			init : function() {
				if(top.location!=self.location){
					top.location = self.location;
				}
				var _this = this;
				$("form input:first").focus();
				$("form").submit(function(e) {
					e.preventDefault();
					if(_this.check()) {
						$.ajax({
							url : "<spring:url value="/admin/login" />",
							data : {username:$.trim($("input[name='username']").val()),password:$.trim($("input[name='password']").val())},
							success : function(result) {
								if(result) {
									document.location.href = "<spring:url value="/admin/main" />"
								}else {
									_this.showMsg('用户不存在');
								}
							}
						});
					}
				});
			},
			check : function() {
				var username = $.trim($("input[name='username']").val());
				if(username.length == 0) {
					this.showMsg('请输入用户名');
					$("input[name='username']").focus();
					return false;
				}
				var password = $.trim($("input[name='password']").val());
				if(password.length == 0) {
					this.showMsg('请输入密码');
					$("input[name='password']").focus();
					return false;
				}
				return true;
			},
			showMsg : function(msg) {
				$('#loginPanel').effect('shake',500,function(){
					$('div.tooltip').html('').hide();
					var img = "<img src='<spring:url value="/admin/images/warning.png" />' style='vertical-align:middle;margin-right:5px;' />";
					$('div.tooltip').html(img + msg).fadeIn();
					setTimeout(function(){
						$('div.tooltip').fadeOut();
					},3000)
				});
			}
	};
</script>
</head>
<body>
	<div id="loginPanel">
		<div class="titleBar">后台管理</div>
		<form id="login" name="login" action="<spring:url value="/admin/pages/index.jsp" />" method="post">
			<div class="tooltip"></div>
			<div style="margin-top:60px">
				<label>用户<input type="text" class="input" name="username" /></label>
			</div>
			<div>
				<label>密码<input type="password" class="input" name="password" /></label>
			</div>
			<div style="margin-top:30px">
				<input type="submit" class="button" value="确定" />
			</div>
		</form>
	</div>
</body>
</html>