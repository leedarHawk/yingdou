<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>
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
				$('textarea[name="content"]').focus();
				$('form').submit(function(){
					if(!_this.check()) {
						return false;
					}
				});
			},
			check : function() {
				var content = $.trim($('textarea[name="content"]').val());
				if(content.length == 0) {
					alert("请输入公告内�?);
					$('textarea[name="content"]').focus();
					return false;
				}
				return true;
			}
	};
//-->
</script>
<body>
<div class="main_right"  id="main_col1"  style="overflow:hidden;">
	<div class="hangy_qh2">
		<ul class="TabbedPanelsTabGroup"> 
			<c:if test="${editType == 'update' }">
				<li class="TabbedPanelsTab TabbedPanelsTabSelected" >修改赛事公告</li>
			</c:if>        
			<c:if test="${editType == 'add' }">
				<li class="TabbedPanelsTab TabbedPanelsTabSelected" >新建赛事公告</li>
			</c:if>
		</ul>
		<div class="TabbedPanelsContentGroup">
		<div class="TabbedPanelsContent"  id="main_col2" >
			<c:if test="${editType == 'update' }">
				<form action="<c:url value="/admin/gameAnnouncement/update" />" method="post">
				<input type="hidden" name="id" value="${gameAnnouncement.id}" />
			</c:if>        
			<c:if test="${editType == 'add' }">
				<form action="<c:url value="/admin/gameAnnouncement/add" />" method="post">
			</c:if>
				<input type="hidden" name="gameId" value="${gameId}" />
				<ul class="tongdao">
					<li>
						<span class="ziduan">公告标题�?/span>
						<input type="text" name="annoTitle" value="${gameAnnouncement.annoTitle}" style="border:1px solid gray;width:250px;"/>
					</li>
					<li>
						<span class="ziduan">公告内容�?/span>
						<div class="wen">

							<!--<textarea name="content" class="textarea_td">-->
							<!-- 加载编辑器的容器 -->
							<script id="container" name="content" type="text/plain">
								<c:out value="${gameAnnouncement.content }" escapeXml="false"/>
    						</script>
							<!-- 配置文件 -->
							<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
							<!-- 编辑器源码文�?-->
							<script type="text/javascript" src="/ueditor/ueditor.all.js"></script>
							<!-- 实例化编辑器 -->
							<script type="text/javascript">

								var ue = UE.getEditor('container',{
									//这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
									//toolbars:[['FullScreen', 'Source', 'Undo', 'Redo','Bold','test']],
									//关闭elementPath
									elementPathEnabled:false,
									//默认的编辑区域高�?
									//autoHeightEnabled: true,
									//autoFloatEnabled: true
								});



							</script>

							<!--</textarea>-->
						</div>
					</li>
					<li>
						<div class="wen">
							<input type="submit" class="button_tongdao" value="确定">
							<input type="button" class="button_tongdao" value="返回" onclick="javascript:window.location.href='<c:url value="/admin/gameAnnouncement/list?gameId=${gameId}" />'">
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