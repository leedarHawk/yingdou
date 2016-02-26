<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>
<META content=text/html;charset=utf-8 http-equiv=Content-Type ></Meta>
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/css/backstage.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/css/jquery-ui.min.css" />" />
<script type="text/javascript" src="<c:url value="/admin/js/jquery.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/jquery-ui.min.js" />"></script>
<script type="text/javascript">
<!--
	$(function(){
		PageUtil.init();
	});
	var PageUtil = {
			fileType : "jpg,jpeg,png,gif,bmp",
			init : function() {
				//add date picker
				$('input[name="duration"]').datepicker({
							dateFormat: 'yy-mm-dd',//日期格式
							monthNames: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],
							dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
							dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],
							dayNamesMin: ['日','一','二','三','四','五','六'],
							minDate: 0
						}
				);
				var _this = this;
				this.handleUpload();
				$('input[name="name"]').focus();
				if($('input[name="fee"]').val() == 0) {
					$('input[name="fee"]').val("");
				}
				$('form').submit(function(){
					if(!_this.check()) {
						return false;
					}
					if($('input[name="fee"]').val().length == 0) {
						$('input[name="fee"]').val(0);
					}
					if($('input[name="teamNum"]').val().length == 0) {
						$('input[name="teamNum"]').val(0);
					}
				});
			},
			check : function() {


				var name = $.trim($('input[name="name"]').val());
				if(name.length == 0) {
					alert("请输入赛事名称");
					$('input[name="name"]').focus();
					return false;
				}
				var cityId = $.trim($('#cityId').val());
				if(cityId == -1) {
					alert("请选择城市");
					$('cityId').focus();
					return false;
				}

				var duration = $.trim($('input[name="duration"]').val());
				if(duration.length == 0) {
					alert("请输入赛事时间");
					$('input[name="duration"]').focus();
					return false;
				}
				var location = $.trim($('input[name="location"]').val());
				if(location.length == 0) {
					alert("请输入赛事地点");
					$('input[name="location"]').focus();
					return false;
				}
				var reg = new RegExp("^[0-9]*$");
				var fee = $.trim($('input[name="fee"]').val());
				if(name.length > 0 && !reg.test(fee)) {
					alert("报名费用应为数字格式");
					$('input[name="fee"]').focus();
					return false;
				}
				var pic = $.trim($('input[name="tempPic"]').val());
				var type = pic.split(".")[1];
				if(pic.length == 0) {
					alert("请上传赛事配图");
					return false;
				}
				if(this.fileType.indexOf(type) == -1) {
					alert("请上传图片格式的文件(jpg,jpeg,png,gif,bmp)");
					return false;
				}
				return true;
			},
			handleUpload : function() {
				var _this = this;
				$('input[name="file"]').change(function(){
					var val = $(this).val();
					$('input[name="tempPic"]').val(val);
				});
			}
	};
//-->
</script>
<body>
<div class="main_right"  id="main_col1"  style="overflow:hidden;">
	<div class="hangy_qh2">
		<ul class="TabbedPanelsTabGroup"> 
			<c:if test="${editType == 'update' }">
				<li class="TabbedPanelsTab TabbedPanelsTabSelected" >修改赛事</li>
			</c:if>        
			<c:if test="${editType == 'add' }">
				<li class="TabbedPanelsTab TabbedPanelsTabSelected" >新建赛事</li>
			</c:if>
		</ul>
		<div class="TabbedPanelsContentGroup">
		<div class="TabbedPanelsContent"  id="main_col2" >
			<c:if test="${editType == 'update' }">
				<form action="<c:url value="/admin/game/updateGame" />" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${game.id}" />
				<input type="hidden" name="pic" value="${game.pic}" />
			</c:if>        
			<c:if test="${editType == 'add' }">
				<form action="<c:url value="/admin/game/addGame" />" method="post" enctype="multipart/form-data">
			</c:if>
				<ul class="tongdao">
					<li>
						<span class="ziduan"><span class="required">*</span>赛事名称：</span>
						<div class="wen"><input type="text" name="name" class="input_cjxm2" value="<c:out value="${game.name }" />"></div>
					</li>
					<li>
						<span class="ziduan"><span class="required">*</span>赛事城市：</span>
						<div class="wen">
							<select class="input_cjxm2" name="cityId" id="cityId">
								<option value="-1">请选择</option>
								<c:forEach items="${cityList}" var="city">
									<option value="${city.id}"
										<c:if test="${game.cityId == city.id}">selected</c:if>
									>${city.cityName}</option>
								</c:forEach>
							</select>
						</div>
					</li>
					<li>
						<span class="ziduan"><span class="required">*</span>赛事时间：</span>
						<div class="wen"><input type="text" name="duration" class="input_cjxm2" value="<c:out value="${game.duration }" />"></div>
					</li>
					<li>
						<span class="ziduan"><span class="required">*</span>赛事地点：</span>
						<div class="wen"><input type="text" name="location" class="input_cjxm2" value="<c:out value="${game.location }" />"></div>
					</li>
					<li>
						<span class="ziduan">报名费用：</span>
						<div class="wen"><input type="text" name="fee" class="input_cjxm2" value="<c:out value="${game.fee }" />"></div>
					</li>
					<li>
						<span class="ziduan">球队名额：</span>
						<div class="wen"><input type="text" name="teamNum" class="input_cjxm2" value="<c:out value="${game.teamNum }" />"></div>
					</li>
					<c:if test="${editType == 'update' }">
						<li>
							<span class="ziduan">&nbsp;</span>
							<div class="wen">
								<img src="<c:url value="${game.pic}" />" style="width:320px;"/>
							</div>
						</li>
					</c:if>
					<li>
						<span class="ziduan"><span class="required">*</span>赛事配图：</span>
						<div class="wen"><input readonly type="text" name="tempPic" class="input_cjxm" value="<c:out value="${game.pic }" />">
							<a href="javascript:void(0);" class="btn_addPic"><span>浏览</span><input type="file" name="file" tabindex="3" title="支持jpg、jpeg、gif、png格式，文件小于5M" size="3" class="filePrew"></a>
						</div>
					</li>

					<li>
						<span class="ziduan">赛事简介：</span>
						<div class="wen">

							<!--<textarea name="content" class="textarea_td">-->
							<!-- 加载编辑器的容器 -->
							<script id="container" name="description" type="text/plain">
								<c:out value="${game.description }"  escapeXml="false"/>
    						</script>
							<!-- 配置文件 -->
							<script type="text/javascript" src="<%=request.getContextPath()%>/ueditor/ueditor.config.js"></script>
							<!-- 编辑器源码文件-->
							<script type="text/javascript" src="<%=request.getContextPath()%>/ueditor/ueditor.all.js"></script>
							<!-- 实例化编辑器 -->
							<script type="text/javascript">

								var ue = UE.getEditor('container',{
									//这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
									toolbars:[['FullScreen', 'Source', 'Undo', 'Redo','Bold']],
									//关闭elementPath
									elementPathEnabled:false,
									//默认的编辑区域高级
									initialFrameHeight:320,
									initialFrameWidth:320
								});

							</script>

							<!--</textarea>-->
						</div>
					</li>

					<li>
						<span class="ziduan">&nbsp;</span>
						<div class="wen">
							<input type="submit" class="button_tongdao" value="确定">
							<input type="button" class="button_tongdao" value="返回" onclick="javascript:window.location.href='<c:url value="/admin/game/list" />'">
						</div>
					</li>
				</ul>
			</form>
		</div>
		
		</div>
		
		</div> </div>
<script>
function getPageSize_iframe() {
	var xScroll, yScroll;
	if (window.innerHeight && window.scrollMaxY) {
		xScroll = document.body.scrollWidth;
		yScroll = window.innerHeight + window.scrollMaxY;
	} else if (document.body.scrollHeight > document.body.offsetHeight) {
		xScroll = document.body.scrollWidth;
		yScroll = document.body.scrollHeight;
	} else {
		xScroll = document.body.offsetWidth;
		yScroll = document.body.offsetHeight;
	}
	var windowWidth, windowHeight;
	if (self.innerHeight) {
		windowWidth = self.innerWidth;
		windowHeight = self.innerHeight;
	} else if (document.documentElement
			&& document.documentElement.clientHeight) {
		windowWidth = document.documentElement.clientWidth;
		windowHeight = document.documentElement.clientHeight;
	} else if (document.body) {
		windowWidth = document.body.clientWidth;
		windowHeight = document.body.clientHeight;
	}
	if (yScroll < windowHeight) {
		pageHeight = windowHeight;
	} else {
		pageHeight = yScroll;
	}
	if (xScroll < windowWidth) {
		pageWidth = windowWidth;
	} else {
		pageWidth = xScroll;
	}
	arrayPageSize = new Array(pageWidth, pageHeight, windowWidth, windowHeight,
			xScroll, yScroll)
	return arrayPageSize;
}
document.getElementById("main_col1").style.height=(getPageSize_iframe()[3]-20)+"px";
document.getElementById("main_col2").style.height=(getPageSize_iframe()[3]-120)+"px";
</script>
</body>