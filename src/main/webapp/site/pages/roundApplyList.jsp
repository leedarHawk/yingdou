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
	var PageUtil = {
			confirmRound : function(id,rid) {
				$.ajax({
					url : '<c:url value="/site/challenge/confirmRound" />',
					data : {roundApplyId:id,roundId:rid},
					type : 'post',
					success : function(res) {
						if(res == 'ok') {
							$('#a_' + id).parent().append('<span class="hui_ann">已同意</span>');
							$('#a_' + id).remove();
							location.href = '<c:url value="/site/challenge/list" />';
						}
					}
				});
			},
			show : function(username,height,weight,qq,mobile,msg,headPic) {
				$('tr.mobile').show();
				$('tr.qq').show();
				$('td.headPic img').prop('src',headPic)
				$('td.username').text(username);
				$('td.height').text(height.length == 0 ? '无' : height + 'cm');
				$('td.weight').text(weight.length == 0 ? '无' : weight + 'kg');
				if(qq.length > 0) {
					$('td.qq').text(qq);
				}else {
					$('tr.qq').hide();
				}
				if(mobile.length > 0) {
					$('td.mobile').text(mobile);
				}else {
					$('tr.mobile').hide();
				}
				$('td.msg').text(msg.length == 0 ? '无' : msg);
				$('#bg1,#show1').show();
			},
			hide : function() {
				var empty = '';
				$('td.username').text(empty);
				$('td.height').text(empty);
				$('td.weight').text(empty);
				$('td.qq').text(empty);
				$('td.mobile').text(empty);
				$('td.msg').text(empty);
				$('#bg1,#show1').hide();
			}
	};
</script>
<style type="text/css">
#bg1 {
	display: none;
	position: fixed;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.7;
	opacity: .70;
	filter: alpha(opacity = 70);
}

#show1 {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1002;
	overflow: auto;
}
</style>
</head>

<body>
<div class="header"><span><a href="javascript:history.go(-1);void 0;"><img src="<c:url value="/site/images/jt_fh.png" />">返回</a></span>列表</div>
<div class="main4">
	<c:forEach items="${list }" var="applyRound">
		<dl class="hy_qdlist">
		<dt><img src="<c:url value="${applyRound.user.headPic }" />"></dt>
		<dd>
		<strong>${applyRound.username }</strong>
		<c:if test="${applyRound.uid == creatorId }">
			<p><span class="hui_ann">球主</span></p>
		</c:if>
		<c:if test="${applyRound.uid != creatorId }">
			<p>
				<a href="javascript:PageUtil.show('${applyRound.username}','${applyRound.height}','${applyRound.weight}','${applyRound.qq}','${applyRound.mobile}','${applyRound.msg}','<c:url value="${applyRound.user.headPic }" />');void 0;">报名信息</a>
				<c:if test="${applyRound.status == 0 }"><a id="a_${applyRound.id }" href="javascript:PageUtil.confirmRound(${applyRound.id },${applyRound.rid });void 0;">同意</a></c:if>
				<c:if test="${applyRound.status == 1 }"><span class="hui_ann">已同意</span></c:if>
			</p>
		</c:if>
		</dd>
		</dl>
	</c:forEach>
</div>
<div class="footer">
		<ul>
			<li class="nav01"><a href="<c:url value="/site/game/list" />">比赛</a></li>
			<li class="nav02"><a class="hover"
				href="<c:url value="/site/challenge/list" />">约战</a></li>
			<li class="nav03"><a href="<c:url value="/site/team/list" />">球队</a></li>
			<li class="nav04"><a href="<c:url value="/site/user/path/me" />">我</a></li>
		</ul>
	</div>
<div id="bg1"></div>
	<div id="show1">
		<div style="height:10px;"></div>
		<div class="zhc_tcbox" id="djk4">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="2" class="headPic hy_qdlist" align="center"><dt style="width:100%;text-align:center;"><img src="" /></dt></td>
				</tr>
				<tr>
					<td width="43%" align="right">姓名：</td>
					<td width="57%" class="username"></td>
				</tr>
				<tr>
					<td align="right">身高：</td>
					<td class="height"></td>
				</tr>
				<tr>
					<td align="right">体重：</td>
					<td class="weight"></td>
				</tr>
				<tr class="qq">
					<td align="right">QQ号：</td>
					<td class="qq"></td>
				</tr>
				
				<tr class="mobile">
					<td align="right">手机号：</td>
					<td class="mobile"></td>
				</tr>
				
				<tr>
					<td align="right">给群主捎个信儿：</td>
					<td class="msg"></td>
				</tr>
			</table>
			<div class="bot_btn">
				<input class="lv_btn" name="applyRound" type="button" value="关闭" onClick="PageUtil.hide();">
			</div>
		</div>
	</div>
</body>
</html>
