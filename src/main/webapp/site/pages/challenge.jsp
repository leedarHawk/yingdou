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
</head>

<body>
	<div class="header">
		约战<b><a href="#">发布约战</a></b>
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

<%-- 					<div class="yuez_con">
						<dl class="hybs_dl">
							<dt>
								<img src="<c:url value="/site/images/tx_no.png" />">樱木花道队
							</dt>
							<dd>
								<strong>VS</strong>
								<p>等待应战</p>
							</dd>
							<dt>
								<img src="<c:url value="/site/images/tx_no.png" />"><input
									class="lv_btn" id="btnshow" onClick="showdiv();" name=""
									type="button" value="应战">
							</dt>
						</dl>
						<ul class="hybs_ul">
							<li>时间：2015年9月12日 18:00</li>
							<li>裁判：待定</li>
							<li>地点：北京体育大学</li>
							<li>费用：¥400(AA)</li>
						</ul>
					</div>

					<div class="yuez_con">
						<dl class="hybs_dl">
							<dt>
								<img src="<c:url value="/site/images/tx_no.png" />">樱木花道队
							</dt>
							<dd>
								<strong>VS</strong>
								<p>等待上传比分</p>
							</dd>
							<dt>
								<img src="<c:url value="/site/images/tx_no.png" />">潇潇闹革命
							</dt>
						</dl>
						<ul class="hybs_ul">
							<li>时间：2015年9月12日 18:00</li>
							<li>裁判：待定</li>
							<li>地点：北京体育大学</li>
							<li>费用：¥400(AA)</li>
						</ul>
					</div>

					<div class="yuez_con">
						<dl class="hybs_dl">
							<dt>
								<img src="<c:url value="/site/images/tx_no.png" />">樱木花道队
							</dt>
							<dd>
								<strong>7:6</strong>
								<p>比赛完成</p>
							</dd>
							<dt>
								<img src="<c:url value="/site/images/tx_no.png" />">潇潇闹革命
							</dt>
						</dl>
						<ul class="hybs_ul">
							<li>时间：2015年9月12日 18:00</li>
							<li>裁判：待定</li>
							<li>地点：北京体育大学</li>
							<li>费用：¥400(AA)</li>
						</ul>
					</div>
 --%>
				</div>


				<div class="TabbedPanelsContent">
					<%-- <div class="yuez_con">
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
 --%>
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
		function showdiv() {
			document.getElementById("bg").style.display = "block";
			document.getElementById("show").style.display = "block";
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

#show {
	display: none;
	position: absolute;
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
			<span>本次比赛所有女篮球队参加比赛场次均以女球队3：0领先开局，若两支球队均以女篮球队则按正常比赛开局进行。</span>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="43%" height="40" align="right">我的球队：</td>
					<td width="57%" height="40"><select name="" class="fab_sel"></select></td>
				</tr>
				<tr>
					<td height="40" align="right">我的手机号：</td>
					<td height="40"><input name="" type="text" class="fab_text"></td>
				</tr>
				<tr>
					<td height="40" align="right">我的QQ号：</td>
					<td height="40"><input name="Input2" type="text"
						class="fab_text"></td>
				</tr>
				<tr>
					<td height="40" align="right">捎个信儿：</td>
					<td height="40"><textarea class="fab_textare" name="" cols=""
							rows=""></textarea></td>
				</tr>
				<tr>
					<td height="90" colspan="2" align="center"><input
						class="lv_btn" name="" type="button" value="应战"></td>
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
