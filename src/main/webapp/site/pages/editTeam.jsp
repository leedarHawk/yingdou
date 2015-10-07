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
<script type="text/javascript" src="<c:url value="/site/js/jquery.js" />"></script>
<style type="text/css">
.zhc_gh{ 
	background:url(<c:url value="/site/images/zhaox.png" />) no-repeat center;
	width:65px; 
	height:65px; 
	text-indent:-9999px; 
	margin-left:3px; 
	float:left;
}
input.members {
	display:none;
}
</style>
<script type="text/javascript">
	var EPageUtil = {
			init : function() {
				var _this = this;
				$('#mapPage').hide();
				$('a.fab_a').click(function(){
					PageUtil.initMap();
					$('#infoPage').fadeOut();
					$('#mapPage').fadeIn();
				});
				$('input[name="limit"]').click(function(index){
					if($('input[name="limit"]:eq(1)').prop('checked')) {
						$('input.members').show();
					}
					if($('input[name="limit"]:eq(0)').prop('checked')) {
						$('input.members').hide();
					}
				});
				this.initCam();
				$('form').submit(function(){
					if(!_this.check()) {
						return false;
					}
				});
			},
			check : function() {
				//处理“需要参加者留下”信息
				var candidateItems = [];
				$('input.candidate').each(function(){
					if($(this).prop('checked')) {
						candidateItems.push($(this).val());
					}
				});
				$('input[name="candidateItems"]').val(candidateItems.join(','));
				//处理成员数量
				if($('input[name="limit"]:eq(0)').prop('checked')) {
					$('input[name="members"]').val(-1);
				}
				/* var file = $.trim($('input[name="file"]').val());
				if(file.length == 0) {
					AlertUtil.show("请上传球队头像");
					return false;
				} */
				var name = $.trim($('input[name="name"]').val());
				if(name.length == 0) {
					AlertUtil.show("请输入球队名称");
					return false;
				}
				var slogan = $.trim($('input[name="slogan"]').val());
				if(slogan.length == 0) {
					AlertUtil.show("请输入球队公告");
					return false;
				}
				var location = $.trim($('input[name="location"]').val());
				if(location.length == 0) {
					AlertUtil.show("请输入球队活动地点");
					return false;
				}
				var description = $.trim($('textarea[name="description"]').val());
				if(description.length == 0) {
					AlertUtil.show("请输入球队简介");
					return false;
				}
				return true;
			},
			/**
			 * 初始化拍照
			 */
			initCam : function() {
				var _this = this;
				$('#get-pic').change(function(e){
					// Get a reference to the taken picture or chosen file
		            var files = event.target.files,
		                isImage,
		                fileReader;
		            if (files && files.length > 0) {
		                _this.file = files[0];
		                console.log(_this.file.name)
		                isImage = /image\/.*/i;
		                if(!_this.file.type.match(isImage)) {
		                	console.log("非图片文件");
		                	return;
		                }
		                try {
		                	 fileReader = new FileReader();
		                     fileReader.onload = function (event) {
		                         $('#head-pic').attr('src',event.target.result);
		                         console.log(event.target.result);
		                     };
		                     fileReader.readAsDataURL(_this.file);
		                }
		                catch (e) {
		                	 var error = document.querySelector("#error");
		                     if (error) {
		                         error.innerHTML = "Neither createObjectURL or FileReader are supported";
		                     }
		                }
		            }
				});
			}
	};
	window.onload = function() {
		EPageUtil.init();
	}
</script>
</head>

<body>
<%@ include file="../../commons/alert.jsp"%>
<div id="infoPage">
<div class="header"><span><a href="<c:url value="/site/team/list" />"><img src="<c:url value="/site/images/jt_fh.png" />">返回</a></span></div>
<div class="main3">
<form action="<c:url value="/site/team/create" />" method="post" enctype="multipart/form-data">
	<div class="chj_tx">
		<img id="head-pic" src="<c:url value="/site/images/tx_mr.jpg" />">
		<span><input id="get-pic" type="file" name="file" class="zhc_gh" accept="image/*" /></span>
	</div>
	<input type="hidden" name="creatorId" value="${user.id}" />
	<input type="hidden" name="candidateItems" value="" />
	<div style="text-align:center;color:#fff;background:#c0c0c0;">只能上传本地照片</div>
	<table width="90%" border="0" cellspacing="5" cellpadding="0">
	  <tr>
	    <td width="43%" height="40" align="right">*发起人：</td>
	    <td width="57%" height="40"><c:out value="${user.username}" /></td>
	  </tr>
	  <tr>
	    <td height="40" align="right">*球队名称：</td>
	    <td height="40"><input name="name" type="text" class="fab_text"></td>
	  </tr>
	  <tr>
	    <td height="40" align="right">*球队公告：</td>
	    <td height="40"><input name="slogan" type="text" class="fab_text" maxlength="30"></td>
	  </tr>
	  <tr>
	    <td height="40" align="right">*活动地点：</td>
	    <td height="40"><a href="#" class="fab_a">进入地图查找</a></td>
	  </tr>
	  <tr>
	    <td height="40" align="right">&nbsp;</td>
	    <td height="40"><input name="location" type="text" class="fab_text" placeholder="手动录入"></td>
	  </tr>
	  <tr>
	    <td height="40" align="right">*成员数量：</td>
	    <td height="40"><label>不限<input name="limit" checked="true" type="radio" value="0" class="fx_kuang"></label></td>
	  </tr>
	  <tr>
	    <td height="40" align="right">&nbsp;</td>
	    <td height="40"><label>限定<input name="limit" type="radio" value="1" class="fx_kuang"></label><input name="members" type="text" class="fab_text2 members" value="" placeholder="成员数量"></td>
	  </tr>
	  <tr>
	    <td height="40" align="right" valign="top">*球队简介：</td>
	    <td height="40" valign="top"><textarea class="fab_textare" name="description" cols="" rows="" onkeyup="value=value.substr(0,30);"></textarea></td>
	  </tr>
	  <tr>
	    <td height="40" align="right">需要参加者留下：</td>
	    <td height="40"><label>姓名<input name="" type="checkbox" value="username" class="fx_kuang candidate"></label></td>
	  </tr>
	  <tr>
	    <td height="40" align="right">&nbsp;</td>
	    <td height="40"><label>身高<input name="" type="checkbox" value="height" class="fx_kuang candidate"></label></td>
	  </tr>
	  <tr>
	    <td height="40" align="right">&nbsp;</td>
	    <td height="40"><label>体重<input name="" type="checkbox" value="weight" class="fx_kuang candidate"></label></td>
	  </tr>
	  <tr>
	    <td height="40" align="right">&nbsp;</td>
	    <td height="40"><label>手机<input name="" type="checkbox" value="mobile" class="fx_kuang candidate"></label></td>
	  </tr>
	  <tr>
	    <td height="40" align="right">&nbsp;</td>
	    <td height="40"><label>QQ&nbsp;<input name="" type="checkbox" value="qq" class="fx_kuang candidate"></label></td>
	  </tr>
	  <tr>
	    <td height="40" align="right">是否需要审核：</td>
	    <td height="40"><label>是<input name="needConfirm" checked="true" type="radio" value="1" class="fx_kuang"></label><span style=" margin-left:40px;"><label>否<input name="needConfirm" type="radio" value="0" class="fx_kuang"></label></span></td>
	  </tr>
	</table>
	<div class="bot_btn"><input class="lv_btn" name="" type="submit" value="创建"></div>
</form>
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
				$('input[name=queryLocation]').val('');
				if(navigator.geolocation.getCurrentPosition) {
					navigator.geolocation.getCurrentPosition(function(position){
						var currentLat = position.coords.latitude; 
						var currentLon = position.coords.longitude; 
						var gpsPoint = new BMap.Point(currentLon, currentLat); 
						BMap.Convertor.translate(gpsPoint, 0, function(point){
							_this.map = new BMap.Map("map");  
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
</div>
<div style="height:65px;"></div>
<div class="footer">
<ul>
<li class="nav01"><a href="<c:url value="/site/game/list" />">比赛</a></li>
<li class="nav02"><a href="<c:url value="/site/challenge/list" />">约战</a></li>
<li class="nav03"><a class="hover" href="<c:url value="/site/team/list" />">球队</a></li>
<li class="nav04"><a href="<c:url value="/site/user/path/me" />">我</a></li>
</ul>
</div>
</body>
</html>
