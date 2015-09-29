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
<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
<script type="text/javascript" src="<c:url value="/site/js/jquery.js" />" ></script>
<script type="text/javascript" src="<c:url value="/site/js/common.js" />"></script>
<script type="text/javascript">
	var TEAM_DATA = [];
	var teamMap;
	<c:forEach items="${list}" var="team">
		teamMap = {
				pic : '<c:url value="${team.pic }" />',
				name : '<c:out value="${team.name}" />',
				members : '${fn:length(team.member)}',
				creator : '<c:out value="${team.creator.username }" />',
				slogan : '<c:out value="${team.slogan}" />',
				description : '<c:out value="${team.description}" />',
				location : '<c:out value="${team.location}" />',
				id : <c:out value="${team.id }" />
		};
		TEAM_DATA.push(teamMap);
	</c:forEach>
	$(function(){
		PageUtil.init();
	});
	var PageUtil = {
			level:14,
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
					//_this.map.centerAndZoom(result.name, _this.level);
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
									//_this.map.centerAndZoom(point, _this.level);
									(function (_location,_marker,_point){
										_marker.addEventListener("click", function(){
											data = _this.findData(results.keyword);
											info = $('div.info').clone();
											$('.teamPic img',info).prop('src',data.pic);
											$('strong',info).text(data.name);
											$('span.creator',info).text(data.creator);
											$('span.location',info).text(data.location);
											$('span.slogan',info).text(data.slogan);
											$('span.description',info).text(data.description);
											$('span.members',info).text(data.members);
											$('dl,ul',info).attr('onclick','PageUtil.jump("' + data.id + '")');
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
				navigator.geolocation.getCurrentPosition(function(position){
					var currentLat = position.coords.latitude; 
					var currentLon = position.coords.longitude; 
					var gpsPoint = new BMap.Point(currentLon, currentLat); 
					BMap.Convertor.translate(gpsPoint, 0, function(point){
						var marker = new BMap.Marker(point);
						_this.map.addOverlay(marker);
						_this.map.centerAndZoom(point, _this.level); 
						var opts = {
						  width : 80,// 信息窗口宽度
						  height: 40// 信息窗口高度
						}
						var infoWindow = new BMap.InfoWindow("您的位置", opts);  // 创建信息窗口对象 
						_this.map.openInfoWindow(infoWindow,point); //开启信息窗口
						marker.addEventListener("click", function(){          
							_this.map.openInfoWindow(infoWindow,point); //开启信息窗口
						});
					});
				});
			},
			search : function() {
				var list = TEAM_DATA;
				var data;
				for(var i = 0; i < list.length; i++) {
					data = list[i];
					this.local.search(data.location);
				}
			},
			findData : function(loc) {
				var list = TEAM_DATA;
				var data;
				for(var i = 0; i < list.length; i++) {
					data = list[i];
					if(data.location == loc) {
						return data;
					}
				}
			},
			jump : function(id) {
				location.href = '<c:url value="/site/team/detail/" />' + id;
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
	border-radius: 50%;
	width: 120px;
	height: 120px; 
	background:#f00;
	position:absolute;
	left:50%;
	top:50%;
	margin-left:-60px;
	margin-top:-60px;
	text-align:center;
	line-height:120px;
	color:#fff;
	font-weight:bold;
	opacity:0.5;
}
</style>
</head>
<body>
<div class="header"><span><a href="javascript:history.go(-1);void 0;"><img src="<c:url value="/site/images/jt_fh.png" />">返回</a></span>球队</div>
<span class="dingw2"><a class="telmenu" href="<c:url value="/site/team/list" />"><img src="<c:url value="/site/images/yuez_ico.png" />"></a></span>
<div id="map"></div>
<div class="yuez_con info" style="position:absolute;width:95%;z-index:9999;">
    <dl class="hybs_dl">
		<dt class="teamPic"><img src=""><span></span></dt>
		<dd>
		<strong style="font-size:14px;"></strong>
		</dd>
	</dl>
	<ul class="hybs_ul">
		<li>发起人：<span class="creator"></span></li>
		<li>活动地点：<span class="location"></span></li>
		<li>成员数量：<span class="members"></span></li>
		<li>球队公告：<span class="slogan"></span></li>
		<li>球队简介：<span class="description"></span></li>
	</ul>
</div>
</body>
</html>
