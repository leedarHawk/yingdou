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
<script type="text/javascript" src="<c:url value="/site/js/common.js" />"></script>
<style type="text/css">
	ul.baom_tab li {
		margin:15px 0px;
		height:50px;
	}
	ul.baom_tab li input {
		border:1px solid #c0c0c0;
	}
	ul.baom_tab li select {
		height:34px;
		line-height:34px;
		border:1px solid #c0c0c0;
	}
</style>
<script type="text/javascript">
	$(function(){
		PageUtil.init();
	});
	var PageUtil = {
		init : function() {
			var _this = this;
			$('select[name="team"]').width($('input[name="creator"]').width());
			$('form').submit(function(){
				if(!_this.check()) {
					return false;
				}
				$('select option').each(function(){
					if($(this).prop('selected')) {
						$('input[name="teamId"]').val($(this).prop('id'));
						return;
					}
				});
			});
		},
		check : function() {
			var team = $.trim($('select[name="team"]').val());
			if(team.length == 0) {
				AlertUtil.show("请输入球队");
				return false;
			}
			var mobile = $.trim($('input[name="mobile"]').val());
			if(mobile.length == 0) {
				AlertUtil.show("请输入联系电话");
				return false;
			}else if(!CommonUtil.isMobile(mobile)){
				AlertUtil.show("请输入正确的电话号码");
				return false;
			}
			var qq = $.trim($('input[name="qq"]').val());
			if(qq.length == 0) {
				AlertUtil.show("请输入QQ号");
				return false;
			}else if(!CommonUtil.isNumber(qq)){
				AlertUtil.show("请输入正确的QQ号码");
				return false;
			}
			return true;
		}
	};
</script>
</head>

<body>
<%@ include file="../../commons/alert.jsp"%>
<div class="header"><span><a href="<c:url value="/site/game/gameInfo/" />${game.id }"><img src="<c:url value="/site/images/jt_fh.png" />">返回</a></span></div>
<form action="<c:url value="/site/game/apply" />" method="post">
	<input type="hidden" name="gameId" value="<c:out value="${game.id}" />" />
	<input type="hidden" name="teamId" value="" />
	<input type="hidden" name="status" value="0" />
	<div class="main">
		<div class="baom_tit"><c:out value="${game.name}" /></div>
		<div class="baom_buzh"><span>提交报名表—</span>审核通过—支付成功—完成</div>
		<ul class="baom_tab">
			<li><span>*姓名：</span><input readonly name="creator" type="text" value="${user.username}"></li>
			<li><span>*我的球队：</span>
				<select name="team">
					<option id="-1" value="">-请选择-</option>
					<c:forEach items="${myTeams }" var="team">
					  <option id="${team.id}" value="${team.name}">${team.name}</option>
					</c:forEach>
				</select>
			</li>
			<li><span>*联系电话：</span><input name="mobile" type="text" value="${user.mobile}"></li>
			<li><span>*QQ号：</span><input name="qq" type="text" value="${user.qq}"></li>
			<li><span>备用联系人姓名：</span><input name="bakContactor" type="text"></li>
			<li><span>备用联系人电话：</span><input name="bakMobile" type="text"></li>
		</ul>
		<div class="bot_btn"><input class="lv_btn" name="" type="submit" value="提交报名表"></div>
	</div>
</form>
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
