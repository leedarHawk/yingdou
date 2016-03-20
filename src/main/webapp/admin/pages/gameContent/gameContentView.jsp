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
				alert(gameContent) ;
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
			<li class="TabbedPanelsTab TabbedPanelsTabSelected" >赛事内容</li>
		</ul>
		<div class="TabbedPanelsContentGroup">
		<div class="TabbedPanelsContent"  id="main_col2" >
				<input type="hidden" name="content" />
				<ul class="tongdao">
					<li>
						<span class="ziduan"><span class="required">*</span>赛事：</span>
						<div class="wen">${game.name}</div>
					</li>
					<li>
						<span class="ziduan"><span class="required">*</span>标题：</span>
						<div class="wen">${gameContent.title }</div>
					</li>

					<li>
						<span class="ziduan">内容：</span>
						<div class="wen">
								<c:out value="${gameContent.content }"  escapeXml="false"/>
						</div>
					</li>

					<li>
						<span class="ziduan">&nbsp;</span>
						<div class="wen">
							<input type="button" class="button_tongdao" value="返回" onclick="javascript:window.location.href='<c:url value="/admin/gameContent/list" />'">
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