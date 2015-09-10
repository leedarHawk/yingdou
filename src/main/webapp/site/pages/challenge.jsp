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
</style>
</head>

<body>
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
					<span class="dingw"><a href=""><img
							src="<c:url value="/site/images/dingw.png" />"></a></span>
					<c:forEach items="${list }" var="challenge">
						<div class="yuez_con">
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
									<c:if test="${empty challenge.guest }">
										<div style="position:relative;"><c:if test="${challenge.creatorId == user.id }"><a href="<c:url value="/site/challenge/acceptInfoList/${challenge.id }" />"><div class="circle">${challenge.count }</div></a></c:if><img src="<c:url value="/site/images/tx_no.png" />"></div><input
											class="lv_btn" id="btnshow" onClick="showdiv(<c:out value="${challenge.id }" />,<c:out value="${challenge.teamId}" />);" name=""
											type="button" value="应战">
									</c:if>
									<c:if test="${not empty challenge.guest }">
										<img src="<c:url value="${challenge.guest.pic }" />"><c:out value="${challenge.guest.name }" />
									</c:if>
								</dt>
							</dl>
							<ul class="hybs_ul">
								<li>时间：<fmt:formatDate value="${challenge.time}" type="both" pattern="yyyy年MM月dd日 HH:mm"/></li>
								<li>裁判：<c:if test="${challenge.needReferee == 1 }">待定</c:if><c:if test="${challenge.needReferee == 0 }">无</c:if></li>
								<li>地点：<c:out value="${challenge.location }" /></li>
								<li>费用：<c:if test="${challenge.feeType == 0 }">免费</c:if><c:if test="${challenge.feeType == 1 }">¥<c:out value="${challenge.fee }" />(AA)</c:if></li>
							</ul>
						</div>
					</c:forEach>
				</div>


				<div class="TabbedPanelsContent">
					 <div class="yuez_con">
						<dl class="hydy_dl">
							<dt>
								<a href=""><img
									src="<c:url value="/site/images/tx_no.png" />"></a>
							</dt>
							<dd>
								<strong><a href="">喜欢打篮球的一起来嗨森！</a></strong>
								<ul>
									<li><span>发起人：</span>长腿美眉</li>
									<li><span>时间：</span>2015年9月12日 18:00</li>
									<li><span>地点：</span>北京体育大学</li>
									<li><span>剩余/招募：</span>5/6</li>
								</ul>
								<p>
									<input class="lv_ann" id="btnshow1" onClick="showdiv1();"
										name="" type="button" value="参加">
								</p>
							</dd>
						</dl>
					</div>

					<div class="yuez_con">
						<dl class="hydy_dl">
							<dt>
								<a href=""><img
									src="<c:url value="/site/images/tx_no.png" />"></a>
							</dt>
							<dd>
								<strong><a href="">喜欢打篮球的一起来嗨森！</a></strong>
								<ul>
									<li><span>发起人：</span>长腿美眉</li>
									<li><span>时间：</span>2015年9月12日 18:00</li>
									<li><span>地点：</span>北京体育大学</li>
									<li><span>剩余/招募：</span>5/6</li>
								</ul>
								<b>结束</b>
							</dd>
						</dl>
					</div>
 
				</div>

			</div>
			<script type="text/javascript">
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
			$('tr.mobile').hide();
			$('tr.qq').hide()
			$('span.ps').text('');
			$('select[name=teamId]').empty();
			$.ajax({
				url : '<c:url value="/site/challenge/toAccept" />',
				data : {id:id},
				success : function(data) {
					$("span.ps").text(data.ps);
					$('tr.' + data.contact).show();
					var teams = data.myTeams;
					$('select[name=teamId]').empty().append('<option value="-1">-请选择-</option>');
					for(var i in teams) {
						if(teams[i].id == currentTid) {
							continue;
						}
						$('select[name=teamId]').append('<option value="' + teams[i].id + '">' + teams[i].name + '</option>');
					}
					$('input.accept').click(function(){
						accept(id);
					});
					document.getElementById("bg").style.display = "block";
					document.getElementById("show").style.display = "block";
				}
			});
		}
		
		function accept(id) {
			var teamId = $('select[name=teamId] option:selected').val();
			if(teamId == -1) {
				return;
			}
			var qq = $.trim($('input[name=qq]').val());
			var mobile = $.trim($('input[name=mobile]').val());
			var msg = $.trim($('textarea[name=msg]').val());
			$.ajax({
				url : '<c:url value="/site/challenge/accept" />',
				data : {tid:teamId,qq:qq,mobile:mobile,msg:msg,challengeId:id},
				type : 'post',
				success : function(res) {
					if(res == 'ok') {
						hidediv();
					}
				}
			});
		}
		
		function hidediv() {
			document.getElementById("bg").style.display = 'none';
			document.getElementById("show").style.display = 'none';
		}

		function showdiv1() {
			document.getElementById("bg1").style.display = "block";
			document.getElementById("show1").style.display = "block";
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
	position: absolute;
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
	position: absolute;
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
		<div class="zhc_tcbox" id="djk4">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="43%" height="50" align="right">*姓名：</td>
					<td width="57%" height="50"><input name="" type="text"
						class="fab_text"></td>
				</tr>
				<tr>
					<td height="50" align="right">*身高：</td>
					<td height="50"><input name="" type="text" class="fab_text"></td>
				</tr>
				<tr>
					<td height="50" align="right">*体重：</td>
					<td height="50"><input name="" type="text" class="fab_text"></td>
				</tr>
				<tr>
					<td height="50" align="right">*QQ号：</td>
					<td height="50"><input name="" type="text" class="fab_text"></td>
				</tr>
				<tr>
					<td height="90" align="right" valign="top">给群主捎个信儿：</td>
					<td><textarea class="fab_textare" name="" cols="" rows=""></textarea></td>
				</tr>
			</table>
			<div class="bot_btn">
				<input class="lv_btn" name="" type="button" value="提交">
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
