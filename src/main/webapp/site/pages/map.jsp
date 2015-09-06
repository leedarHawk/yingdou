<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta name="format-detection" content="telephone=no" />
<title></title>
<link rel="stylesheet" href="<c:url value="/site/css/style.css" />" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=yukxov4aBQUGowvyGuS5lD5t"></script>
<script type="text/javascript" src="<c:url value="/site/js/jquery.js" />"></script>
<script type="text/javascript">
	var PageUtil = {
			map : null,
			local : null,
			init : function() {
				var height = $(window).height() - $('div.search').height();
				var width = $(window).width() - 114;
				$('#map').height(height);
				$('input[name=location]').width(width);
				this.initMap();
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
			},
			search : function() {
				var location = $.trim($('input[name=location]').val());
				if(location.length == 0) {
					return;
				}
				this.local.search(location);
			},
			add : function() {
				var text = $('a.add:eq(1)').attr('data-title');
				alert(text);
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
</head>
<body>
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
		<a class="returnBtn" href=""><img src="<c:url value="/site/images/jt_fh.png" />">返回</a>
		<input type="text" name="location" placeholder="查询地点" onblur="PageUtil.search()" />
		<a class="searchBtn" href="javascript:PageUtil.search();void 0;"><img alt="" src="<c:url value="/site/images/search.png" />"></a>
	</div>
	<div id="map"></div>
</body>
</html>
<script type="text/javascript">
	PageUtil.init();
</script>