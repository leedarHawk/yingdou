<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../commons/taglibs.jsp"%>
<META content=text/html;charset=utf-8 http-equiv=Content-Type ></Meta>
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/css/backstage.css" />" />
<script type="text/javascript" src="<c:url value="/admin/js/jquery.min.js" />"></script>
<script type="text/javascript">
<!--
	$(function(){
		PageUtil.init();
	});
	var PageUtil = {
			init : function() {
				var _this = this;
				$('input[name="username"]').focus();
				$('form').submit(function(){
					if(!_this.check()) {
						return false;
					}
					return true;
				});
			},
			check : function() {
				var cityName = $.trim($('input[name="cityName"]').val());
				if(cityName.length == 0) {
					alert("请输入城市名称");
					$('input[name="cityName"]').focus();
					return false;
				}
				var result = true;
			    $.ajax({
					url : '<c:url value="/admin/city/checkCity" />',
					async:false, 
					data : {cityName:cityName},
					success : function(res) {
						if(res == 'false' && cityName != '<c:out value="${city.cityName}" />' && '<c:out value="${city.cityName}" />'.length > 0) {
							alert("城市" + cityName + "已存在");
							$('input[name="cityName"]').focus();
							result = false;
						}
					}
				});
			    return result;
			}
	};
//-->
</script>
<body>
<div class="main_right"  id="main_col1"  style="overflow:hidden;">
	<div class="hangy_qh2">
		<ul class="TabbedPanelsTabGroup"> 
			<c:if test="${editType == 'update' }">
				<li class="TabbedPanelsTab TabbedPanelsTabSelected" >修改城市</li>
			</c:if>        
			<c:if test="${editType == 'add' }">
				<li class="TabbedPanelsTab TabbedPanelsTabSelected" >新建城市</li>
			</c:if>
		</ul>
		<div class="TabbedPanelsContentGroup">
		<div class="TabbedPanelsContent"  id="main_col2" >
			<c:if test="${editType == 'update' }">
				<form action="<c:url value="/admin/city/updateCity" />" method="post">
				<input type="hidden" name="id" value="${city.id}" />
			</c:if>        
			<c:if test="${editType == 'add' }">
				<form action="<c:url value="/admin/city/addCity" />" method="post">
			</c:if>
				<ul class="tongdao">
					<c:if test="${editType == 'add' }">
						<li>
							<span class="ziduan"><span class="required">*</span>城市名称：</span>
							<div class="wen"><input type="text" name="cityName" class="input_cjxm2"></div>
						</li>
					</c:if>
					<c:if test="${editType == 'update' }">
						<li>
							<span class="ziduan"><span class="required">*</span>城市名称：</span>
							<div class="wen"><input type="text" name="cityName" class="input_cjxm2" value="<c:out value="${city.cityName }" />"></div>
						</li>
					</c:if>
					<li>
						<span class="ziduan">&nbsp;</span>
						<div class="wen">
							<input type="submit" class="button_tongdao" value="确定">
							<input type="button" class="button_tongdao" value="返回" onclick="javascript:window.location.href='<c:url value="/admin/city/list" />'">
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