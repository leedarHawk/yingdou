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
<script language="javascript" type="text/javascript">
	var map = new Object;
	function showdiv(id) {
		$('tr.mobile').hide();
		$('tr.qq').hide();
		$('img.headPic').prop('src',map[id].teamPic);
		$('td.teamName').text(map[id].team);
		if(map[id].mobile.length > 0) {
			$('td.mobile').text(map[id].mobile);
			$('tr.mobile').show();
		}
		if(map[id].qq.length > 0) {
			$('td.qq').text(map[id].qq);
			$('tr.qq').show();
		}
		$('td.msg').text(map[id].msg);
		document.getElementById("bg").style.display = "block";
		document.getElementById("show").style.display = "block";
	}
	function hidediv() {
		document.getElementById("bg").style.display = 'none';
		document.getElementById("show").style.display = 'none';
	}
</script>
<style type="text/css">
#bg {
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

#show {
	display: none;
	position: fixed;
	top: 3%;
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
	<c:forEach items="${list }" var="map">
		<dl class="hy_qdlist">
		<dt><a href="<c:url value="/site/team/detail/${map.team.id }" />"><img src="<c:url value="${map.team.pic }" />"></a></dt>
		<dd>
		<strong>${map.team.name }</strong>
		<p><a href="javascript:showdiv('${map.ai.id }');void 0;">报名信息</a><a href="<c:url value="/site/challenge/acceptChallenge/${map.team.id }/${map.ai.challengeId}" />">确定对手</a></p>
		</dd>
		</dl>
		<script type="text/javascript">
			map['${map.ai.id}'] = {};
			map['${map.ai.id}'].team = '${map.team.name}';
			map['${map.ai.id}'].teamPic = '<c:url value="${map.team.pic}" />';
			map['${map.ai.id}'].qq = '${map.ai.qq}';
			map['${map.ai.id}'].mobile = '${map.ai.mobile}';
			map['${map.ai.id}'].msg = '${map.ai.msg}';
		</script>
	</c:forEach>
	<c:if test="${empty list }">
		<dl class="hy_jshudl" style="background:none;">
		<dt><img src="<c:url value="/site/images/ts_ico.png" />"></dt>
		<dd>
		<strong>您还没有收到应战请求</strong>
		</dd>
		</dl>
	</c:if>
</div>
<br><br><br>
<div id="bg"></div>
	<div id="show">
		<input class="close_btn" id="btnclose" onClick="hidediv();" name=""
			type="button" value="关闭">
		<div class="zhc_tcbox" id="djk3">
			<div class="huibg">
				<dl class="hy_toptx">
					<dt><img class="headPic" src="" /></dt>
				</dl>
			</div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="43%" height="40" align="right">Ta的球队：</td>
					<td width="57%" height="40" class="teamName">
					</td>
				</tr>
				<tr class="mobile">
					<td height="40" align="right">Ta的手机号：</td>
					<td height="40" class="mobile"></td>
				</tr>
				<tr class="qq">
					<td height="40" align="right">Ta的QQ号：</td>
					<td height="40" class="qq"></td>
				</tr>
				<tr>
					<td height="40" align="right">捎个信儿：</td>
					<td height="40" class="msg"></td>
				</tr>
				<tr>
					<td height="90" colspan="2" align="center"><input
						class="lv_btn accept" name="" type="button" value="关闭" onClick="hidediv()"></td>
				</tr>
			</table>
		</div>
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
</body>
</html>
