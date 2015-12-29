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
<script type="text/javascript" src="<c:url value="/site/js/common.js?t=${_time }" />"></script>
<script type="text/javascript">
	$(function(){
		PageUtil.initCheck();
		PageUtil.initSelect('position','${user.position}');
		PageUtil.initSelect('level','${user.level}');
	});
	var PageUtil = {
			initSelect : function(prop,value) {
				$('select[name="' + prop + '"] option').each(function(){
					if($(this).val() == value) {
						$(this).prop("selected",true);
					}
				});
			},
			initCheck : function() {
				$('form').submit(function(){
					var username = $.trim($('input[name=username]').val());
					if(username.length == 0) {
						AlertUtil.show("请您填写完整信息");
						return false;
					}
					if(CommonUtil.limit(5,username)) {
						AlertUtil.show("昵称长度不能超过5个字符");
						return false;
					}
					$('input[name=username]').val(username);
					var height = $.trim($('input[name=height]').val());
					if(CommonUtil.isBlank(height)){
						AlertUtil.show("请您填写完整信息");
						return false;
					}
					if(height.length > 0 && !CommonUtil.isNumber(height)) {
						AlertUtil.show("请输入正确的身高");
						return false;
					}
					var weight = $.trim($('input[name=weight]').val());
					if(CommonUtil.isBlank(weight)){
						AlertUtil.show("请您填写完整信息");
						return false;
					}
					if(weight.length > 0 && !CommonUtil.isNumber(weight)) {
						AlertUtil.show("请输入正确的体重");
						return false;
					}
					var mobile = $.trim($('input[name=mobile]').val());
					if(mobile.length = 0 ) {
						AlertUtil.show("请您填写完整信息");
						return false;
					}
					if(mobile.length > 0 && !CommonUtil.isMobile(mobile)) {
						AlertUtil.show("请输入正确的手机号");
						return false;
					}
					var qq = $.trim($('input[name=qq]').val());
					if(qq.length = 0 ) {
						AlertUtil.show("请您填写完整信息");
						return false;
					}
					if(qq.length > 0 && !CommonUtil.isNumber(qq)) {
						AlertUtil.show("请输入正确的qq号");
						return false;
					}
					return true;
				});
			}
	};
</script>
</head>

<body>
<%@ include file="../../commons/alert.jsp"%>
<div class="header"><span><a href="<c:url value="/site/user/path/me" />"><img src="<c:url value="/site/images/jt_fh.png" />">返回</a></span>设置</div>
<div class="main2">
	<form action="<c:url value="/site/user/update" />" method="post">
		<input name="id" type="hidden" value="${user.id}" />
		<input name="headPic" type="hidden" value="${user.headPic}" />
		<input name="country" type="hidden" value="${user.country}" />
		<input name="province" type="hidden" value="${user.province}" />
		<input name="city" type="hidden" value="${user.city}" />
		<div class="shez_box">
		<ul>
		<li class="shez_01"><span><img src="<c:url value="${user.headPic}" />"></span>头像</li>
		<li>昵称<input class="shez_text" name="username" type="text" value="${user.username}"></li>
		<li>性别<select class="shez_text" name="sex">
		  <c:if test="${user.sex == '男' }">
			  <option value="男" selected>男</option>
			  <option value="女">女</option>
		  </c:if>
		  <c:if test="${user.sex == '女' }">
			  <option value="男">男</option>
			  <option value="女" selected>女</option>
		  </c:if>
		</select></li>
		<li>身高(cm)<input class="shez_text" name="height" type="text" style="width:70%;" value="${user.height}"></li>
		<li>体重(kg)<input class="shez_text" name="weight" type="text" style="width:70%;" value="${user.weight}"></li>
		</ul>
		</div>
	
		<div class="shez_box">
		<ul>
		<li>球场位置
			<select class="shez_text" style="width:70%;" name="position">
			  <option value="SG">SG</option>
			  <option value="PG">PG</option>
			  <option value="PF">PF</option>
			  <option value="SF">SF</option>
			  <option value="C">C</option>
			</select>
		</li>
		<li>水平
			<select class="shez_text" name="level">
			  <option value="龙套">龙套</option>
			  <option value="替补">替补</option>
			  <option value="主力">主力</option>
			  <option value="得分王">得分王</option>
			  <option value="球队灵魂">球队灵魂</option>
			</select>
		</li>
		<li>手机号<input class="shez_text" style="width:70%;" name="mobile" type="text" value="${user.mobile}"></li>
		<li>QQ号<input class="shez_text" name="qq" type="text" value="${user.qq}"></li>
		</ul>
		</div>
		<div class="bot_btn"><input class="lv_btn" name="" type="submit" value="保存"></div>
	</form>
</div>
<div class="footer">
<ul>
<li class="nav01"><a href="<c:url value="/site/game/list" />">比赛</a></li>
<li class="nav02"><a href="<c:url value="/site/challenge/list" />">约战</a></li>
<li class="nav03"><a href="<c:url value="/site/team/list" />">球队</a></li>
<li class="nav04"><a class="hover" href="<c:url value="/site/user/path/me" />">我</a></li>
</ul>
</div>
</body>
</html>
