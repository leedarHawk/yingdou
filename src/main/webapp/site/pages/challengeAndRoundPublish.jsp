
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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
<script type="text/javascript" src="<c:url value="/site/js/jquery.js" />"></script>
<script type="text/javascript">
	$(function(){
		CPageUtil.init();
	});
	var CPageUtil = {
			init : function() {
				var _this = this;
				$('#mapPage').hide();
				$('a.fab_a').click(function(){
					$('#infoPage').fadeOut();
					$('#mapPage').fadeIn();
				});
				$('#matchForm').submit(function() {
					if(!_this.check()) {
						return false;
					}
					return true;
				});
				$('#roundForm').submit(function() {
					if(!_this.checkRound()) {
						return false;
					}
					return true;
				});
			},
			checkRound : function() {
				var name = $.trim($('#roundForm input[name="name"]').val());
				if(name.length == 0) {
					AlertUtil.show("请输入球局名");
					return false;
				}
				var teamId = $('#roundForm select[name="tid"] option:selected').val();
				$('#roundForm select[name="tid"]').val(teamId);
				/* if(teamId < 0) {
					AlertUtil.show("请选择球队");
					return false;
				}else {
					$('#roundForm select[name="tid"]').val(teamId);
				} */
				var startDate = $('#roundForm select[name="startDate"]').val();
				var startTimestamp = $('#roundForm input[name="startTimestamp"]').val();
				if(startDate.length == 0 || startTimestamp.length == 0) {
					AlertUtil.show("请选择开始时间");
					return false;
				}else {
					$('#roundForm input[name="startTime"]').val(startDate + " " + startTimestamp + ":00");
				}
				var endDate = $('#roundForm select[name="endDate"]').val();
				var endTimestamp = $('#roundForm input[name="endTimestamp"]').val();
				if(endDate.length == 0 || endTimestamp.length == 0) {
					endDate = "1970-01-01";
					endTimestamp = "00:00";
				}
				$('#roundForm input[name="endTime"]').val(endDate + " " + endTimestamp + ":00");
				var location = $.trim($('#roundForm input[name="location"]').val());
				if(location.length == 0) {
					AlertUtil.show("请选择地点");
					return false;
				}
				var mobile = $.trim($('#roundForm input[name="mobile"]').val());
				if(mobile.length == 0) {
					AlertUtil.show("请填写联系电话");
					return false;
				}
				var enrollLimit = $.trim($('#roundForm input[name="enrollLimit"]').val());
				if(enrollLimit.length == 0) {
					$('#roundForm input[name="enrollLimit"]').val(0);
				}
				var members = $.trim($('#roundForm input[name="members"]').val());
				if(members.length == 0) {
					$('#roundForm input[name="members"]').val(0);
				}
				var fee = $.trim($('#roundForm input[name="fee"]').val());
				if(fee.length == 0) {
					$('#roundForm input[name="fee"]').val(0);
				}
				return true;
			},
			check : function() {
				var teamId = $('select[name="teamId"] option:selected').val();
				if(teamId < 0) {
					AlertUtil.show("请选择球队");
					return false;
				}else {
					$('select[name="teamId"]').val(teamId);
				}
				var date = $('select[name=date]').val();
				var timestamp = $('input[name=timestamp]').val();
				if(date.length == 0 || timestamp == 0) {
					AlertUtil.show("请选择时间");
					return false;
				}else {
					$('input[name=time]').val(date + " " + timestamp + ":00");
				}
				var location = $.trim($('#matchForm input[name=location]').val());
				if(location.length == 0) {
					AlertUtil.show("请输入地点");
					return false;
				}
				var needReferee = $('select[name=needReferee] option:selected').val();
				$('select[name=needReferee]').val(needReferee);
				var feeType = $('#matchForm input[name=feeType]:checked').val();
				if(feeType == '0') {
					$('input[name=fee]').val(0);
				}else {
					var fee = $.trim($('#matchForm input[name=fee]').val());
					if(fee.length == 0) {
						AlertUtil.show("请输入费用");
						return false;
					}else {
						$('#matchForm input[name=fee]').val(fee);
					}
				}
				var mobile = $.trim($('#matchForm input[name=mobile]').val());
				if(mobile.length == 0) {
					ALertUtil.show("请输入联系电话");
					return false
				}else {
					$('#matchForm input[name=mobile]').val(mobile);
				}
				return true;
			}
	};
</script>
<style type="text/css">
	#roundForm table td {
		padding:2px 0px;
	}
</style>
</head>

<body>
<%@ include file="../../commons/alert.jsp"%>
<div id="infoPage">
	<div class="header">
		<span><a href="javascript:history.go(-1);void 0;"><img
				src="<c:url value="/site/images/jt_fh.png" />">返回</a></span>
	</div>
	<div class="main3">

		<script type="text/javascript" src="<c:url value="/site/js/qh.js" />"></script>
		<!--切换内容开始0-->
		<div id="TabbedPanels2" class="hangy_qh2">
			<ul class="TabbedPanelsTabGroup">
				<li class="TabbedPanelsTab" tabindex="0">比赛</li>
				<li class="TabbedPanelsTab" tabindex="0">球局</li>
			</ul>
			<div class="TabbedPanelsContentGroup">
				<!--比赛-->
				<div class="TabbedPanelsContent">
					<form id="matchForm" action="<c:url value="/site/challenge/publishMatch" />" method="post">
						<input type="hidden" name="time" />
						<table width="90%" border="0" cellspacing="5" cellpadding="0">
							<tr>
								<td width="43%" height="40" align="right">*发起人：</td>
								<td width="57%" height="40"><c:out value="${user.username }" /></td>
							</tr>
							<tr>
								<td height="40" align="right">*我的球队：</td>
								<td height="40">
									<select name="teamId" class="fab_sel">
										<option value="-1">-请选择-</option>
										<c:forEach items="${list }" var="team">
											<option value="${team.id }">${team.name }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td height="40" align="right">*开始时间：</td>
								<td height="40">
									<select class="fab_sel" style="width:148px;" name="date">
									<%
										Date d=new Date();
										SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
										for (int i=0; i<15; i++){
											String dayStr = df.format(new Date(d.getTime() + i * 24 * 60 * 60 * 1000));
									%>
											<option value="<%=dayStr%>"><%=dayStr%></option>
									<%
										}
									%>
								</select>
									<input class="fab_sel" style="width:148px;" type="time" name="timestamp" /></td>
							</tr>
							<tr>
								<td height="40" align="right">*地点：</td>
								<td height="40"><a href="#" class="fab_a">进入地图查找</a></td>
							</tr>
							<tr>
								<td height="40" align="right">&nbsp;</td>
								<td height="40"><input name="location" type="text"
									class="fab_text" placeholder="手动输入" /></td>
							</tr>
							<tr>
								<td height="40" align="right">*费用：</td>
								<td height="40"><input type="radio" name="feeType" value="0" checked />免费</td>
							</tr>
							<tr>
								<td height="40" align="right">&nbsp;</td>
								<td height="40"><input type="radio" name="feeType" value="1" />AA&nbsp;<input name="fee" type="text"
									class="fab_text2" placeholder="¥"></td>
							</tr>
							<tr>
								<td height="40" align="right">裁判：</td>
								<td height="40">
									<select name="needReferee" class="fab_sel">
										<option value="0">不需要裁判</option>
										<option value="1">需要裁判</option>
									</select>
								</td>
							</tr>
							<tr>
								<td height="40" align="right">*发起人联系电话：</td>
								<td height="40"><input name="mobile" type="text"
									class="fab_text" value="<c:out value="${user.mobile }" />" /></td>
							</tr>
							<tr>
								<td height="40" align="right">备用联系人电话：</td>
								<td height="40"><input name="firstBakMobile" type="text"
									class="fab_text"></td>
							</tr>
							<tr>
								<td height="40" align="right">备用联系人电话：</td>
								<td height="40"><input name="secondBakMobile" type="text"
									class="fab_text"></td>
							</tr>
							<tr>
								<td height="40" align="right">需要参加者留下：</td>
								<td height="40"><span class="right"><input type="radio" name="contact" value="qq" checked /> QQ</span><input type="radio" name="contact" value="mobile" />手机号</td>
							</tr>
							<tr>
								<td height="40" align="right">备注信息：</td>
								<td height="40"><span class="right"><textarea name="ps" class="fab_text" style="width:170px;height:70px;"></textarea></td>
							</tr>
							<tr>
								<td height="90" align="right">&nbsp;</td>
								<td><input class="lv_btn" name="" type="submit" value="提交"></td>
							</tr>
						</table>
					</form>
				</div>

				<!--球局-->
				<div class="TabbedPanelsContent">
					<form id="roundForm" action="<c:url value="/site/challenge/publishRound" />" method="post">
						<input type="hidden" name="startTime" />
						<input type="hidden" name="endTime" value="0" />
						<table width="90%" border="0" cellspacing="5" cellpadding="0">
							<tr>
								<td width="43%" height="40" align="right">*发起人：</td>
								<td width="57%" height="40">${user.username }</td>
							</tr>
							<tr>
								<td height="40" align="right">*球局名称：</td>
								<td height="40"><input name="name" type="text" class="fab_text" /></td>
							</tr>
							<tr>
								<td height="40" align="right">我的球队：</td>
								<td height="40">
									<select name="tid" class="fab_sel">
										<option value="-1">-请选择-</option>
										<c:forEach items="${list }" var="team">
											<option value="${team.id }">${team.name }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td height="40" align="right">*开始时间：</td>
								<td height="40">
									<select class="fab_sel" style="width:148px;" type="date" name="startDate" />
									<%
										for (int i=0; i<15; i++){
											String dayStr = df.format(new Date(d.getTime() + i * 24 * 60 * 60 * 1000));
									%>
									<option value="<%=dayStr%>"><%=dayStr%></option>
									<%
										}
									%>
									</select
									<input class="fab_sel" style="width:148px;" type="time" name="startTimestamp" />
								</td>
							</tr>
							<tr>
								<td height="40" align="right">结束时间：</td>
								<td height="40">
									<select class="fab_sel" style="width:148px;" type="date" name="endDate">
									<%
										for (int i=0; i<15; i++){
											String dayStr = df.format(new Date(d.getTime() + i * 24 * 60 * 60 * 1000));
									%>
									<option value="<%=dayStr%>"><%=dayStr%></option>
									<%
										}
									%>
									</select>
									<input class="fab_sel" style="width:148px;" type="time" name="endTimestamp" />
								</td>
							</tr>
							<tr>
								<td height="40" align="right">*地点：</td>
								<td height="40"><a href="#" class="fab_a">进入地图查找</a></td>
							</tr>
							<tr>
								<td height="40" align="right">&nbsp;</td>
								<td height="40"><input name="location" type="text"
									class="fab_text" placeholder="手动录入"></td>
							</tr>
							<tr>
								<td height="40" align="right">*费用：</td>
								<td height="40"><input type="radio" name="feeType" value="0" checked />免费</td>
							</tr>
							<tr>
								<td height="40" align="right">&nbsp;</td>
								<td height="40"><input type="radio" name="feeType" value="1" />AA&nbsp;<input name="fee" type="text"
									class="fab_text2" placeholder="¥"></td>
							</tr>
							<tr>
								<td height="40" align="right">已有人数：</td>
								<td height="40"><input name="members" type="number"
									class="fab_text" ></td>
							</tr>
							<tr>
								<td height="40" align="right">招募人数：</td>
								<td height="40"><input type="radio" name="enrollType" value="0" checked />不限</td>
							</tr>
							<tr>
								<td height="40" align="right">&nbsp;</td>
								<td height="40"><input type="radio" name="enrollType" value="1" />限定&nbsp;<input name="enrollLimit" type="number"
									class="fab_text2"></td>
							</tr>
							<tr>
								<td height="40" align="right">*联系电话：</td>
								<td height="40"><input name="mobile" type="text"
									class="fab_text" value="${user.mobile }"></td>
							</tr>
							<tr>
								<td height="40" align="right">需要参加者留下：</td>
								<td height="40"><span class="right"><input type="radio" name="contact" value="qq" checked /> QQ</span><input type="radio" name="contact" value="mobile" />手机号</td>
							</tr>
							<tr>
								<td height="90" align="right">&nbsp;</td>
								<td><input class="lv_btn" name="" type="submit" value="提交"></td>
							</tr>
						</table>
					</form>
				</div>

			</div>
			<script type="text/javascript">
				var TabbedPanels1 = new Spry.Widget.TabbedPanels(
						"TabbedPanels2");
			</script>
		</div>
		<!--切换内容 结束0-->
	</div>
	<div style="height: 50px;"></div>
	<div class="footer">
		<ul>
			<li class="nav01"><a href="<c:url value="/site/game/list" />">比赛</a></li>
			<li class="nav02"><a class="hover"
				href="<c:url value="/site/challenge/list" />">约战</a></li>
			<li class="nav03"><a href="<c:url value="/site/team/list" />">球队</a></li>
			<li class="nav04"><a href="<c:url value="/site/user/path/me" />">我</a></li>
		</ul>
	</div>
</div>
<div id="mapPage">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=yukxov4aBQUGowvyGuS5lD5t"></script>
<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
<script type="text/javascript">
	var PageUtil = {
			map : null,
			local : null,
			level : 18,
			init : function() {
				var height = $(window).height() - $('div.search').height();
				var width = $(window).width() - 114;
				$('#map').height(height);
				$('input[name=queryLocation]').width(width);
				$('a.returnBtn').click(function(){
					$('#infoPage').fadeIn();
					$('#mapPage').fadeOut();
				});
				this.initMap();
			},
			initMap : function() {
				var _this = this;
				if(navigator.geolocation.getCurrentPosition) {
					navigator.geolocation.getCurrentPosition(function(position){
						var currentLat = position.coords.latitude; 
						var currentLon = position.coords.longitude; 
						var gpsPoint = new BMap.Point(currentLon, currentLat); 
						BMap.Convertor.translate(gpsPoint, 0, function(point){
							_this.map = new BMap.Map("map");  
							_this.map.centerAndZoom(point, _this.level); 
							_this.map.addOverlay(new BMap.Marker(point));
							/* var myCity = new BMap.LocalCity();
							myCity.get(function(result){
								_this.map.centerAndZoom(result.name, 11);
							}); */
							_this.local = new BMap.LocalSearch(_this.map, {
								onSearchComplete: function(results){
									// 判断状态是否正确
									if (_this.local.getStatus() == BMAP_STATUS_SUCCESS){
										var point,marker,infoWindow,info,location;
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
												_this.map.centerAndZoom(point, 15);
											}
											(function (_location,_marker,_point){
												_marker.addEventListener("click", function(){ 
													info = $('div.info').clone();
													$('div.title',info).text(_location.title);
													$('div.address',info).text(_location.address);
													$('a.add',info).attr('data-title',_location.title);
													//创建信息窗口对象 
													infoWindow = new BMap.InfoWindow("");
													infoWindow.setContent(info.html());
													//开启信息窗口
													_this.map.openInfoWindow(infoWindow,_point); 
												});
											})(location,marker,point);
										}
									}
								}
							});
						}); 
					}); 
				}
			},
			search : function() {
				var location = $.trim($('input[name=queryLocation]').val());
				if(location.length == 0) {
					return;
				}
				this.local.search(location);
			},
			add : function() {
				var text = $('a.add:eq(1)').attr('data-title');
				var location = $('input[name="location"]').val();
				if(location.length > 0) {
					$('input[name="location"]').val(location + ',' + text);
				}else {
					$('input[name="location"]').val(text);
				}
				$('#infoPage').fadeIn();
				$('#mapPage').fadeOut();
			}
	};
</script>
<style type="text/css">
	#map {
		width:100%;
		height:500px;
	}
	div.search {
		height:50px;
		background:#f8f8f8;
	    border-bottom: 1px solid #dedede;
	    padding:2px;
	}
	div.search input {
		height:40px;
		border:1px solid #c0c0c0;
		text-align:center;
		line-height:100%;
		margin:0px 2px;
		
	}
	a.searchBtn {
		width:50px;
		height:50px;
		margin-left:2px;
	}
	a.returnBtn {
		width:50px;
		height:50px;
	}
	a.returnBtn img {
		width:14px;
		margin:0px 2px;
	}
	div.info {
		display:none;
	}
	div.infoPanel {
		font-size:14px;
	}
	a.add span {
		display:inline-block;
		width:50px;
		height:30px;
		background:#f00;
		color:#fff;
		line-height:30px;
		text-align:center;
	}
	div.button {
		text-align:right;
	}
	div.title {
		color:#f00;
		font-weight:bold;
	}
</style>
	<div class="info">
		<div class="infoPanel">
			<div class="title"></div>
			<div class="address"></div>
			<div class="button">
				<a class="add" data-title="" href="javascript:PageUtil.add();void 0;"><span>添加</span></a>
			</div>
		</div>
	</div>
	<div class="search">
		<a class="returnBtn" href="javascript:;"><img src="<c:url value="/site/images/jt_fh.png" />">返回</a>
		<input type="text" name="queryLocation" placeholder="查询地点" onblur="PageUtil.search()" />
		<a class="searchBtn" href="javascript:PageUtil.search();void 0;"><img alt="" src="<c:url value="/site/images/search.png" />"></a>
	</div>
	<div id="map"></div>
<script type="text/javascript">
	PageUtil.init();
</script>
</body>
</html>
