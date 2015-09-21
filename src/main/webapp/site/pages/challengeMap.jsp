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
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=yukxov4aBQUGowvyGuS5lD5t"></script>
<script type="text/javascript" src="<c:url value="/site/js/jquery.js" />" ></script>
<script src="<c:url value="/site/js/jquery.hoverIntent.minified.js" />" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/site/js/qh.js" />" ></script>
<script type="text/javascript">
	var TYPE = "challenge";
	var CHALLENGE_DATA = [];
	var ROUND_DATA = [];
	var locationMap,roundMap;
	<c:forEach items="${list}" var="challenge">
		locationMap = {
				hostPic : '<c:url value="${challenge.host.pic }" />',
				hostName : '<c:out value="${challenge.host.name }" />',
				guestPic : '<c:url value="${challenge.guest.pic }" />',
				guestName : '<c:url value="${challenge.guest.name }" />',
				emptyPic : '<c:url value="/site/images/tx_no.png" />',
				location : '<c:out value="${challenge.location }" />',
				id : <c:out value="${challenge.id }" />,
				teamId : <c:out value="${challenge.teamId }" />,
				ps : '<c:out value="${challenge.ps }" />',
				time : '<fmt:formatDate value="${challenge.time}" type="both" pattern="yyyy年MM月dd日 HH:mm"/>',
				needReferee : '<c:if test="${challenge.needReferee == 1 }">待定</c:if><c:if test="${challenge.needReferee == 0 }">无</c:if>',
				fee : '<c:if test="${challenge.feeType == 0 }">免费</c:if><c:if test="${challenge.feeType == 1 }">¥<c:out value="${challenge.fee }" />(AA)</c:if>'
		};
		CHALLENGE_DATA.push(locationMap);
	</c:forEach>
	<c:forEach items="${roundList }" var="round">
		roundMap = {
			hostPic : '<c:url value="${round.team.pic }" />',
			roundName : '${round.name }',
			creator : '${round.user.username }',
			time : "<fmt:formatDate value="${round.startTime}" pattern="yyyy年MM月dd日 HH:mm"/><c:if test="$(round.endTime != '1970-01-01 00:00:00')">至<fmt:formatDate value="${round.endTime}" pattern="yyyy年MM月dd日 HH:mm"/></c:if>",
			location : '${round.location}',
			enroll : '${round.members }/<c:if test="${round.enrollType==0 }">不限</c:if><c:if test="${round.enrollType == 1 }">${round.enrollLimit }</c:if>'
		};
		ROUND_DATA.push(roundMap);
	</c:forEach>
	$(function(){
		PageUtil.init();
	});
	var PageUtil = {
			map : null,
			local : null,
			init : function() {
				$('#map').height($(window).height());
				this.initMap();
				this.search();
			},
			initMap : function() {
				var _this = this;
				_this.map = new BMap.Map("map");  
				var myCity = new BMap.LocalCity();
				myCity.get(function(result){
					_this.map.centerAndZoom(result.name, 11);
				});
				_this.local = new BMap.LocalSearch(_this.map, {
					onSearchComplete: function(results){
						// 判断状态是否正确
						if (_this.local.getStatus() == BMAP_STATUS_SUCCESS){
							var point,marker,infoWindow,info,location,data;
							for (var i = 0; i < results.getCurrentNumPois(); i++){
								location = results.getPoi(i);
								//获取坐标点
								point = location.point;
								//创建标注
								marker = new BMap.Marker(point);
								//将标注添加到地图中
								_this.map.addOverlay(marker);
								if(i == 0) {
									//默认地图中心是搜索结果第一个的位置
									_this.map.centerAndZoom(point, 11);
									(function (_location,_marker,_point){
										_marker.addEventListener("click", function(){
											if(TYPE == 'challenge') {
												data = _this.findData(results.keyword);
												info = $('div.info').clone();
												$('dt.host span',info).text(data.hostName);
												$('dt.host img',info).prop('src',data.hostPic);
												if(data.guestName.length != 0) {
													$('dt.guest',info).html('<img src=' + data.guestPic + ' /><span>' + data.guestName + '</span>');
												}else {
													$('dt.guest input.lv_btn',info).attr('onClick','PageUtil.showChallenge(' + data.id + ',' + data.teamId + ');');
												}
												$('span.ps',info).text(data.ps);
												$('span.time',info).text(data.time);
												$('span.referee',info).text(data.needReferee);
												$('span.location',info).text(data.location);
												$('span.fee',info).text(data.fee);
											}
											if(TYPE == 'round') {
												data = _this.findData(results.keyword);
												info = $('div.round').clone();
												$('dt.hostPic img',info).prop('src',data.hostPic);
												$('strong.roundName',info).text(data.roundName);
												$('span.time',info).text(data.time);
												$('span.creator',info).text(data.creator);
												$('span.enroll',info).text(data.enroll);
												$('span.location',info).text(data.location);
											}
											//创建信息窗口对象 
											infoWindow = new BMap.InfoWindow("");
											infoWindow.setContent(info.html());
											//开启信息窗口
											_this.map.openInfoWindow(infoWindow,_point); 
										});
									})(location,marker,point);
									break;
								}
							}
						}
					}
				});
			},
			search : function() {
				var list = TYPE == 'challenge' ? CHALLENGE_DATA : ROUND_DATA;
				var data;
				for(var i = 0; i < list.length; i++) {
					data = list[i];
					this.local.search(data.location);
				}
			},
			findData : function(loc) {
				var list = TYPE == 'challenge' ? CHALLENGE_DATA : ROUND_DATA;
				var data;
				for(var i = 0; i < list.length; i++) {
					data = list[i];
					if(data.location == loc) {
						return data;
					}
				}
			},
			showChallenge : function(id,currentTid) {
				var _this = this;
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
							_this.acceptChallenge(id);
						});
						document.getElementById("bg").style.display = "block";
						document.getElementById("show").style.display = "block";
					}
				});
			},
			hideChallenge : function() {
				document.getElementById("bg").style.display = "none";
				document.getElementById("show").style.display = "none";
			},
			acceptChallenge: function(id) {
				var _this = this;
				var teamId = $('#show select[name=teamId] option:selected').val();
				if(teamId == -1) {
					return;
				}
				var qq = $.trim($('#show input[name=qq]').val());
				var mobile = $.trim($('#show input[name=mobile]').val());
				var msg = $.trim($('#show textarea[name=msg]').val());
				$.ajax({
					url : '<c:url value="/site/challenge/accept" />',
					data : {tid:teamId,qq:qq,mobile:mobile,msg:msg,challengeId:id},
					type : 'post',
					success : function(res) {
						if(res == 'ok') {
							_this.hideChallenge();
						}
					}
				});
			},
			switchPanel : function(p) {
				if(p) {
					TYPE = 'challenge';
				}else {
					TYPE = 'round';
				}
				PageUtil.init();
			}
	};
</script>
<style type="text/css">
#map {
	width:100%;
}
div.info {
	display:none;
}
div.round {
	display:none;
}
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
<div class="header"><span><a href="javascript:history.go(-1);void 0;"><img src="<c:url value="/site/images/jt_fh.png" />">返回</a></span>约战<font><a href="<c:url value="/site/challenge/publish" />">发布约战</a></font></div>
<div class="main3" style="position:fixed;width:100%;top:0px;z-index:1;">
	<!--切换内容开始0-->
	<div id="TabbedPanels2" class="hangy_qh5">
		<ul class="TabbedPanelsTabGroup">        
			<li class="TabbedPanelsTab" tabindex="0" onclick="PageUtil.switchPanel(1)">比赛</li>
			<li class="TabbedPanelsTab" tabindex="1" onclick="PageUtil.switchPanel(0)">球局</li>
		</ul>
		<div class="TabbedPanelsContentGroup">
		<!--比赛-->
		<div class="TabbedPanelsContent">
			<span class="dingw2"><a class="telmenu" href="<c:url value="/site/challenge/list" />"><img src="<c:url value="/site/images/yuez_ico.png" />"></a></span>
		</div>

		<!--球局-->
		<div class="TabbedPanelsContent">
			<span class="dingw2"><a href="<c:url value="/site/challenge/list" />"><img src="<c:url value="/site/images/yuez_ico.png" />"></a></span>
		</div>
	</div>
	<script type="text/javascript">
	var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels2");
	</script>
	</div>
	<!--切换内容 结束0-->	   
</div>
<div id="map"></div>
<div class="yuez_con info" style="position:absolute;width:95%;z-index:9999;">
    <dl class="hybs_dl">
		<dt class="host"><img src=""><span></span></dt>
		<dd>
		<strong>VS</strong>
		<p>等待应战</p>
		</dd>
		<dt class="guest"><img src="<c:url value="/site/images/tx_no.png" />"><input class="lv_btn" type="button" value="应战" ></dt>
	</dl>
	<ul class="hybs_ul">
		<li>时间：<span class="time"></span></li>
		<li>裁判：<span class="referee"></span></li>
		<li>地点：<span class="location"></span></li>
		<li>费用：<span class="fee"></span></li>
	</ul>
</div>

<div class="yuez_con round">
	<dl class="hy_topdl">
	<dt class="hostPic"><img style="width:64px;height:64px;" src="" /></dt>
	<dd>
	<strong class="roundName"></strong>
	</dd>
	</dl>
	
<table border="0" cellspacing="0" margin="0">
  <tr>
    <td align="right">发起人：</td>
    <td><span class="creator"></span></td>
  </tr>
  <tr>
    <td align="right">时间：</td>
    <td><span class="time"></span></td>
  </tr>
  <tr>
    <td align="right">地点：</td>
    <td><span class="location"></span></td>
  </tr>
  <tr>
    <td align="right">已报名/招募：</td>
    <td><span class="enroll"></span></td>
  </tr>
</table>
<ul class="hy_btn">
<li><input class="lv_ann" id="btnshow1" onClick=""
						name="" type="button" value="参加"></li>
</ul>
</div>

<div id="bg"></div>
<div id="show">
	<input class="close_btn" id="btnclose" onClick="PageUtil.hideChallenge();" name=""
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
</body>
</html>
