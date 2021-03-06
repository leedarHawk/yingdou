<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../commons/taglibs.jsp"%>
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


				var title = $.trim($('input[name="title"]').val());
				if(title.length == 0) {
					alert("请输入信息标题");
					$('input[name="name"]').focus();
					return false;
				}
				var gameContent = ue.getContent();
				$('input[name="content"]').val(gameContent);

				if(gameContent.length == 0) {
					alert("请输入信息内容");
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
				<li class="TabbedPanelsTab TabbedPanelsTabSelected" >修改赛事内容</li>
			</c:if>        
			<c:if test="${editType == 'add' }">
				<li class="TabbedPanelsTab TabbedPanelsTabSelected" >新建赛事内容</li>
			</c:if>
		</ul>
		<div class="TabbedPanelsContentGroup">
		<div class="TabbedPanelsContent"  id="main_col2" >
			<c:if test="${editType == 'update' }">
				<form action="<c:url value="/admin/gameContent/updateGameContent" />" method="post">
				<input type="hidden" name="id" value="${gameContent.id}" />
			</c:if>
			<c:if test="${editType == 'add' }">
				<form action="<c:url value="/admin/gameContent/addGameContent" />" method="post">
			</c:if>
				<input type="hidden" name="content" />
				<ul class="tongdao">
					<li>
						<span class="ziduan"><span class="required">*</span>赛事：</span>
						<div class="wen">
							<%--<input type="text" name="name" class="input_cjxm2" value="<c:out value="${game.name }" />">--%>
							<select name="gameId" class="input_cjxm2">
								<option value="0">请选择</option>
								<c:forEach items="${gameList}" var="game">
									<option value="${game.id}"
										<c:if test="${gameContent.gameId == game.id}">selected</c:if>
									>${game.name}</option>
								</c:forEach>
							</select>
						</div>
					</li>
					<li>
						<span class="ziduan"><span class="required">*</span>标题：</span>
						<div class="wen"><input type="text" name="title" class="input_cjxm2" value="<c:out value="${gameContent.title }" />"></div>
					</li>

					<li>
						<span class="ziduan">内容：</span>
						<div class="wen">

							<!--<textarea name="content" class="textarea_td">-->
							<!-- 加载编辑器的容器 -->
							<script id="container" name="description" type="text/plain">
								<c:out value="${gameContent.content }"  escapeXml="false"/>
    						</script>
							<!-- 配置文件 -->
							<script type="text/javascript" src="<%=request.getContextPath()%>/ueditor/ueditor.config.js"></script>
							<!-- 编辑器源码文件-->
							<script type="text/javascript" src="<%=request.getContextPath()%>/ueditor/ueditor.all.js"></script>
							<!-- 实例化编辑器 -->
							<script type="text/javascript">

								var ue = UE.getEditor('container',{
									//这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
									toolbars:[['FullScreen', 'Source', 'Undo', 'Redo','Bold','simpleupload','insertimage','music','insertvideo']],
									//关闭elementPath
									//elementPathEnabled:false,
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