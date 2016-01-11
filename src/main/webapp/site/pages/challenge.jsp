<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0, maximum-scale=1,user-scalable=yes" />
<meta name="format-detection" content="telephone=no" />
<title></title>
<link rel="stylesheet" href="<c:url value="/site/css/style.css" />" />
<script type="text/javascript"
	src="<c:url value="/site/js/jquery.js" />"></script>
<script type="text/javascript">
	window.onload = function(){
		var anchor = location.href.split('#')[1];
		//处理球局
		if(anchor.indexOf('r_') == 0) {
			$('li.TabbedPanelsTab:last').click();
		}
		if(anchor.length > 0) {
			var top = $('#' + anchor).offset().top;
			$(document).scrollTop(top - $('.header').height() - 8);
		}
	};
</script>
<script type="text/javascript" src="<c:url value="/site/js/common.js?t=${_time }" />"></script>
<style type="text/css">
	.circle {
		border-radius: 50%;
		width: 70px;
		height: 70px; 
		background:#f00;
		position:absolute;
		left:50%;
		top:50%;
		margin-left:-35px;
		margin-top:-35px;
		text-align:center;
		line-height:70px;
		color:#fff;
		font-weight:bold;
		opacity:0.5;
	}
	.circleRound {
		border-radius: 100%;
		width: 80px;
		height: 80px; 
		background:#f00;
		position:absolute;
		left:42%;
		top:50%;
		margin-left:-42px;
		margin-top:-35px;
		text-align:center;
		line-height:80px;
		color:#fff;
		font-weight:bold;
		opacity:0.5;
	}
	ul.roundUl span {
		margin-right:10px;
	}
</style>
</head>

<body>
	<%@ include file="../../commons/alert.jsp"%>
	<div class="header">
		约战<b><a href="<c:url value="/site/challenge/publish" />">发布约战</a></b>
	</div>
	<div class="main2">

		<script type="text/javascript" src="<c:url value="/site/js/qh.js" />"></script>
		<!--切换内容开始0-->
		<div id="TabbedPanels1" class="hangy_qh4">
			<ul class="TabbedPanelsTabGroup">
				<li class="TabbedPanelsTab" tabindex="0">比赛</li>
				<li class="TabbedPanelsTab" tabindex="0">球局</li>
			</ul>
			<div class="TabbedPanelsContentGroup">
				<div class="TabbedPanelsContent">
					<span class="dingw"><a href="<c:url value="/site/challenge/map" />"><img
							src="<c:url value="/site/images/dingw.png" />"></a></span>
					<c:forEach items="${list }" var="challenge">
						<div class="yuez_con" id="c_${challenge.id}">
							<dl class="hybs_dl">
								<dt>
									<img src="<c:url value="${challenge.host.pic }" />"><c:out value="${challenge.host.name }" />
								</dt>
								<dd>
									<c:if test="${empty challenge.guest }">
										<strong>VS</strong>
										<p>等待应战</p>
									</c:if>
									<c:if test="${not empty challenge.guest }">
										<c:if test="${challenge.status==1 }">
											<strong>VS</strong>
											<p>等待上传比分</p>
										</c:if>
										<c:if test="${challenge.status==2 }">
											<strong>${challenge.score }</strong>
											<p>比赛完成</p>
										</c:if>
									</c:if>
								</dd>
								<dt>
									<c:if test="${empty challenge.guest}">
										<div style="position:relative;"><c:if test="${challenge.creatorId == user.id }"><a href="<c:url value="/site/challenge/acceptInfoList/${challenge.id }" />"><div class="circle">${challenge.count }</div></a></c:if><img src="<c:url value="/site/images/tx_no.png" />"></div>
										<c:if test="${challenge.creatorId != user.id }">
											<input class="lv_btn" id="btnshow" onClick="showdiv(<c:out value="${challenge.id }" />,<c:out value="${challenge.teamId}" />);" name=""
												type="button" value="应战">
										</c:if>
									</c:if>
									<c:if test="${not empty challenge.guest }">
										<img src="<c:url value="${challenge.guest.pic }" />"><c:out value="${challenge.guest.name }" />
									</c:if>
								</dt>
							</dl>
							<a href ="#" onclick="javascript:challengeApplyList(${challenge.id},${challenge.teamId});">
							<ul class="hybs_ul">
								<li>时间：<fmt:formatDate value="${challenge.time}" type="both" pattern="yyyy年MM月dd日 HH:mm"/></li>
								<li>裁判：<c:if test="${challenge.needReferee == 1 }">待定</c:if><c:if test="${challenge.needReferee == 0 }">无</c:if></li>
								<li>地点：<c:out value="${challenge.location }" /></li>
								<li>费用：<c:if test="${challenge.feeType == 0 }">免费</c:if><c:if test="${challenge.feeType == 1 }">¥<c:out value="${challenge.fee }" />(AA)</c:if></li>
							</ul>
							</a>
						</div>
					</c:forEach>
				</div>


				<div class="TabbedPanelsContent">
					<c:forEach items="${roundList }" var="round">
						<div class="yuez_con" id="r_${round.id}">
							<dl class="hydy_dl">
								<dt style="position:relative;">
									<c:if test="${user.id == round.creatorId }">
										<c:if test="${not empty round.team }">
											<a href="javascript:detail(${round.id },${round.creatorId });void 0;"><div class="circleRound">${round.applyNum }</div><img src="<c:url value="${round.team.pic }" />"></a>
										</c:if>
										<c:if test="${empty round.team }">
											<a href="javascript:detail(${round.id },${round.creatorId });void 0;"><div class="circleRound">${round.applyNum }</div><img src="<c:url value="/site/images/round.png" />"></a>
										</c:if>
									</c:if>
									<c:if test="${ user.id != round.creatorId}">
										<c:if test="${not empty round.team }">
											<img src="<c:url value="${round.team.pic }" />">
										</c:if>
										<c:if test="${empty round.team }">
											<img src="<c:url value="/site/images/round.png" />">
										</c:if>
									</c:if>
								</dt>
								<dd>
									<strong><a href ="#" onclick="javascript:roundApplyList(${round.id});">${round.name }</a></strong>
									<ul class="roundUl">
										<li>发起人：${round.user.username }</li>
										<li>时间：<fmt:formatDate value="${round.startTime}" pattern="yyyy年MM月dd日 HH:mm"/><c:if test="${round.endTime != '1970-01-01 00:00:00.0'}">至<fmt:formatDate value="${round.endTime}" pattern="yyyy年MM月dd日 HH:mm"/></c:if></li>
										<li>地点：${round.location }</li>
										<li>已报名/招募：${round.members }/<c:if test="${round.enrollType==0 }">不限</c:if><c:if test="${round.enrollType == 1 }">${round.enrollLimit }</c:if></li>
									</ul>
									<p>
										<c:if test="${round.enrollType == 1 && round.members == round.enrollLimit}">
											<b>名额已满</b>
										</c:if>
										<c:if test="${round.enrollType == 0 || round.members < round.enrollLimit}">
											<c:if test="${user.id != round.creatorId }">
												<input class="lv_ann" id="btnshow1" onClick="showdiv1('${round.contact}',${round.id });"
												name="" type="button" value="参加">
											</c:if>
											<c:if test="${user.id == round.creatorId }">
												<input class="lv_ann" onClick="detail(${round.id },${round.creatorId });"
											name="" type="button" value="查看">
											</c:if>
										</c:if>
									</p>
								</dd>
							</dl>
						</div>
					</c:forEach>
				</div>

			</div>
			<script type="text/javascript">
				function detail(rid,cid) {
					location.href = '<c:url value="/site/challenge/roundApplyList/" />' + rid + '/' + cid;
				}
				function roundApplyList(id){
					location.href = '<c:url value="/site/challenge/roundApplyDetail/" />'  + id;
				}
				function challengeApplyList(id,creatorId){
					location.href = '<c:url value="/site/challenge/challengeDetail/" />'  + id+ '/' + creatorId;
				}
				var TabbedPanels1 = new Spry.Widget.TabbedPanels(
						"TabbedPanels1");
			</script>
		</div>
		<!--切换内容 结束0-->
	</div>

	<div class="footer">
		<ul>
			<li class="nav01"><a href="">比赛</a></li>
			<li class="nav02"><a href="" class="hover">约战</a></li>
			<li class="nav03"><a href="">球队</a></li>
			<li class="nav04"><a href="">我</a></li>
		</ul>
	</div>


	<script language="javascript" type="text/javascript">
		function showdiv(id,currentTid) {
			$('#show tr.mobile').hide();
			$('#show tr.qq').hide()
			$('#show span.ps').text('');
			$('#show select[name=teamId]').empty();
			$.ajax({
				url : '<c:url value="/site/challenge/toAccept" />',
				data : {id:id},
				success : function(data) {
					$("#show span.ps").text(data.ps);
					$('#show tr.' + data.contact).show();
					var teams = data.myTeams;
					$('#show select[name=teamId]').empty().append('<option value="-1">-请选择-</option>');
					for(var i in teams) {
						if(teams[i].id == currentTid) {
							continue;
						}
						$('#show select[name=teamId]').append('<option value="' + teams[i].id + '">' + teams[i].name + '</option>');
					}
					$('#show input.accept').click(function(){
						accept(id);
					});
					document.getElementById("bg").style.display = "block";
					document.getElementById("show").style.display = "block";
				}
			});
		}
		
		function accept(id) {
			var teamId = $('#show select[name=teamId] option:selected').val();
			var team = $('#show select[name=teamId] option:selected').text();
			if(teamId == -1) {
				AlertUtil.show("请选择球队");
				return;
			}
			var qq = $.trim($('#show input[name=qq]').val());
			var mobile = $.trim($('#show input[name=mobile]').val());
			if(qq.length = 0 ) {
				AlertUtil.show("请输入qq号码");
				return;
			}
			if(mobile.length = 0 ) {
				AlertUtil.show("请输入手机号码");
				return;
			}
			if(qq.length > 0 && !CommonUtil.isNumber(qq)) {
				AlertUtil.show("请输入正确的qq号码");
				return;
			}
			if(mobile.length > 0 && !CommonUtil.isMobile(mobile)) {
				AlertUtil.show("请输入正确的手机号码");
				return;
			}
			var msg = $.trim($('#show textarea[name=msg]').val());
			$.ajax({
				url : '<c:url value="/site/challenge/accept" />',
				data : {tid:teamId,qq:qq,mobile:mobile,msg:msg,challengeId:id},
				type : 'post',
				success : function(res) {
					if(res == 'ok') {
						//AlertUtil.show("保存成功！");
						location.reload();
					}else {
						AlertUtil.show("球队" + team + "已申请过");
					}
				}
			});
		}
		
		function hidediv() {
			document.getElementById("bg").style.display = 'none';
			document.getElementById("show").style.display = 'none';
		}

		function showdiv1(contact,roundId) {
			$('#show1 tr.qq').hide();
			$('#show1 tr.mobile').hide();
			$('#show1 tr.' + contact).show();
			$('#show1 input[name="username"]').val('${user.username}');
			$('#show1 input[name="height"]').val('${user.height}');
			$('#show1 input[name="weight"]').val('${user.weight}');
			if(contact == 'qq') {
				$('#show1 input[name="qq"]').val('${user.qq}');
			}else {
				$('#show1 input[name="mobile"]').val('${user.mobile}');
			}
			$('#show1 input[name="applyRound"]').click(function(){
				apply(roundId,contact);
			});
			document.getElementById("bg1").style.display = "block";
			document.getElementById("show1").style.display = "block";
		}
		function apply(roundId,contact) {
			var username = $.trim($('#show1 input[name="username"]').val());
			if(username.length == 0) {
				AlertUtil.show("请输入姓名");
				return;
			}
			var height = $.trim($('#show1 input[name="height"]').val());
			if(height.length == 0) {
				AlertUtil.show("请输入身高");
				return;
			}
			var weight = $.trim($('#show1 input[name="weight"]').val());
			if(weight.length == 0) {
				AlertUtil.show("请输入体重");
				return;
			}
			var _contact = $.trim($('#show1 input[name="' + contact + '"]').val());
			if(_contact.length == 0) {
				AlertUtil.show("请输入联系方式");
				return;
			}
			var msg = $.trim($('#show1 textarea[name="msg"]').val());
			var _data;
			if(contact == 'qq') {
				if(!CommonUtil.isNumber(_contact)) {
					AlertUtil.show("请输入正确的qq号码");
					return;
				}
				_data = {rid:roundId,uid:${user.id},username:username,height:height,weight:weight,qq:_contact,msg:msg};
			}else {
				if(!CommonUtil.isMobile(_contact)) {
					AlertUtil.show("请输入正确的手机号码");
					return;
				}
				_data = {rid:roundId,uid:${user.id},username:username,height:height,weight:weight,mobile:_contact,msg:msg}
			}
			if(CommonUtil.isBlank(msg)){
				AlertUtil.show("给咱们领队捎个信不能为空");
				return ;
			}
			if(CommonUtil.limit(20,msg)){
				AlertUtil.show("给咱们领队捎个信不超过20个字");
				return ;
			}
			$.ajax({
				url : '<c:url value="/site/challenge/applyRound" />',
				data : _data,
				type : 'post',
				success : function(res) {
					if(res == 'ok') {
						AlertUtil.show('您的申请已提交') ;
						setTimeout("location.reload();", 3000) ;
					}else {
						AlertUtil.show("您已报名");
					}
				}
			});
		}
		function hidediv1() {
			document.getElementById("bg1").style.display = 'none';
			document.getElementById("show1").style.display = 'none';
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

	<div id="bg"></div>
	<div id="show">
		<input class="close_btn" id="btnclose" onClick="hidediv();" name=""
			type="button" value="关闭">
		<div class="zhc_tcbox" id="djk3">
			<p>Ta的备注信息:</p>
			<span class="ps"></span>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="43%" height="40" align="right">我的球队：</td>
					<td width="57%" height="40">
						<select name="teamId" class="fab_sel">
						</select>
					</td>
				</tr>
				<tr class="mobile">
					<td height="40" align="right">我的手机号：</td>
					<td height="40"><input name="mobile" type="text" class="fab_text" value="<c:out value="${user.mobile }" />" /></td>
				</tr>
				<tr class="qq">
					<td height="40" align="right">我的QQ号：</td>
					<td height="40"><input name="qq" type="text"
						class="fab_text" value="<c:out value="${user.qq }" />"></td>
				</tr>
				<tr>
					<td height="40" align="right">捎个信儿：</td>
					<td height="40"><textarea class="fab_textare" name="msg" cols=""
							rows=""></textarea></td>
				</tr>
				<tr>
					<td height="90" colspan="2" align="center"><input
						class="lv_btn accept" name="" type="button" value="应战"></td>
				</tr>
			</table>
		</div>
	</div>

	<div id="bg1"></div>
	<div id="show1">
		<input class="close_btn" id="btnclose1" onClick="hidediv1();" name=""
			type="button" value="关闭">
		<div style="height:10px;"></div>
		<div class="zhc_tcbox" id="djk4">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="43%" height="50" align="right">*姓名：</td>
					<td width="57%" height="50"><input name="username" type="text"
						class="fab_text"></td>
				</tr>
				<tr>
					<td height="50" align="right">*身高(cm)：</td>
					<td height="50"><input name="height" type="text" class="fab_text"></td>
				</tr>
				<tr>
					<td height="50" align="right">*体重(kg)：</td>
					<td height="50"><input name="weight" type="text" class="fab_text"></td>
				</tr>
				<tr class="qq">
					<td height="50" align="right">*QQ号：</td>
					<td height="50"><input name="qq" type="text" class="fab_text"></td>
				</tr>
				
				<tr class="mobile">
					<td height="50" align="right">*手机号：</td>
					<td height="50"><input name="mobile" type="text" class="fab_text"></td>
				</tr>
				
				<tr>
					<td height="90" align="right" valign="top">给群主捎个信儿：</td>
					<td><textarea class="fab_textare" name="msg" cols="" rows=""></textarea></td>
				</tr>
			</table>
			<div class="bot_btn">
				<input class="lv_btn" name="applyRound" type="button" value="提交">
			</div>
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
