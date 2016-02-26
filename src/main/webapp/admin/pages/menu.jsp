<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>
<META content=text/html;charset=utf-8 http-equiv=Content-Type ></Meta>
<link rel="stylesheet" type="text/css" href="../css/backstage.css" />
<script src="../js/jquery.min.js"></script>
<script src="../js/jquery-mousewheel.min.js"></script>
<body style="padding-left:20px;">
<div class="main_left" id="col1"  style="overflow:hidden;position: relative;">
	<div id="menu"  style="overflow:hidden;position: relative;top:0px;">
		<c:choose>
			<c:when test="${admin.type == 1}">
				<h1><a href="<c:url value="/admin/game/list" />" target="main" class="wen"><img src="../images/iocn_01a.png"/>     赛事管理</a><!-- <a href="" class="shu">12</a> --></h1>
				<div class="erjicaidan">
					<!-- <div style="padding: 10px 0;border-bottom: #4a4a4a solid 1px;">
                        <h2><a href="list.jsp" target="main">比赛列表</a></h2>
                    </div> -->
				</div>
				<h1><a href="<c:url value="/admin/challenge/list" />" target="main" class="wen"><img src="../images/iocn_01a.png"/>约战管理</a><!-- <a href="" class="shu">12</a> --></h1>
				<div class="erjicaidan">
					<!-- <div style="padding: 10px 0;border-bottom: #4a4a4a solid 1px;">
                        <h2><a href="list.jsp" target="main">约战</a></h2>
                    </div>
                    <div style="padding: 10px 0;border-bottom: #4a4a4a solid 1px;">
                        <h2><a href="list.jsp" target="main">球局</a></h2>
                    </div> -->
				</div>
				<h1><a href="<c:url value="/admin/team/list" />" target="main" class="wen"><img src="../images/iocn_01a.png"/>球队管理</a><!-- <a href="" class="shu">12</a> --></h1>
				<div  class="erjicaidan">
				</div>
				<h1><a href="<c:url value="/admin/order/list" />" target="main" class="wen"><img src="../images/iocn_01a.png"/>订单管理</a><!-- <a href="" class="shu">12</a> --></h1>
				<div class="erjicaidan">
						<%-- <div style="padding: 10px 0;border-bottom: #4a4a4a solid 1px;">
                            <h2><a href="<c:url value="/admin/order/list" />" target="main">官方赛事订单</a></h2>
                        </div> --%>
				</div>
				<h1><a href="<c:url value="/admin/user/list" />" target="main" class="wen"><img src="../images/iocn_01a.png"/>用户管理</a><!-- <a href="" class="shu">12</a> --></h1>
				<div class="erjicaidan">
				</div>
				<h1><a href="<c:url value="/admin/admin/list" />" target="main" class="wen"><img src="../images/iocn_01a.png"/>管理员</a><!-- <a href="" class="shu">12</a> --></h1>
				<div class="erjicaidan">
				</div>
				<h1><a href="<c:url value="/admin/city/list" />" target="main" class="wen"><img src="../images/iocn_01a.png"/>城市管理</a><!-- <a href="" class="shu">12</a> --></h1>
				<div class="erjicaidan">
				</div>
			</c:when>
			<c:otherwise>
				<%--<h1><a href="<c:url value="/admin/gameContent/list" />" target="main" class="wen"><img src="../images/iocn_01a.png"/>区域赛事信息管理</a><!-- <a href="" class="shu">12</a> --></h1>
				<div class="erjicaidan">
				</div>--%>
			</c:otherwise>
			<h1><a href="<c:url value="/admin/gameContent/list" />" target="main" class="wen"><img src="../images/iocn_01a.png"/>区域赛事信息管理</a><!-- <a href="" class="shu">12</a> --></h1>
			<div class="erjicaidan">
			</div>
		</c:choose>

		<!-- <h1><a href="javascript:;" target="main" class="wen"><img src="images/iocn_01a.png"/>审批管理</a><a href="" class="shu">12</a></h1>
		<div  class="erjicaidan">
			<div style="padding: 10px 0;border-bottom: #4a4a4a solid 1px;">
				<h2><a href="list.html" target="main">认证审批</a></h2>
				<h2><a href="list.html" target="main">申购审批</a></h2>
				<h2><a href="list.html" target="main">材料审批</a></h2>
				<h2><a href="list.html" target="main">材料审批</a></h2>
				<h2><a href="list.html" target="main">电子印章</a></h2>
				<h2><a href="list.html" target="main">认证审批</a></h2>
				<h2><a href="list.html" target="main">申购审批</a></h2>
				<h2><a href="list.html" target="main">材料审批</a></h2>
				<h2><a href="list.html" target="main">材料审批</a></h2>
				<h2><a href="list.html" target="main">电子印章</a></h2>
				<h2><a href="list.html" target="main">认证审批</a></h2>
				<h2><a href="list.html" target="main">申购审批</a></h2>
				<h2><a href="list.html" target="main">材料审批</a></h2>
				<h2><a href="list.html" target="main">材料审批</a></h2>
				<h2><a href="list.html" target="main">电子印章</a></h2>
				<h2><a href="list.html" target="main">认购绿色通道结束</a></h2>
			</div>
		</div>
		<h1><a href="javascript:;" target="main" class="wen"><img src="images/iocn_01a.png"/>审批管理</a><a href="" class="shu">12</a></h1>
		<div  class="erjicaidan">
			<div style="padding: 10px 0;border-bottom: #4a4a4a solid 1px;">
				<h2><a href="list.html" target="main">认证审批</a></h2>
				<h2><a href="list.html" target="main">申购审批</a></h2>
				<h2><a href="list.html" target="main">材料审批</a></h2>
				<h2><a href="list.html" target="main">材料审批</a></h2>
				<h2><a href="list.html" target="main">电子印章</a></h2>
				<h2><a href="list.html" target="main">认证审批</a></h2>
				<h2><a href="list.html" target="main">申购审批</a></h2>
				<h2><a href="list.html" target="main">材料审批</a></h2>
				<h2><a href="list.html" target="main">材料审批</a></h2>
				<h2><a href="list.html" target="main">电子印章</a></h2>
				<h2><a href="list.html" target="main">认证审批</a></h2>
				<h2><a href="list.html" target="main">申购审批</a></h2>
				<h2><a href="list.html" target="main">材料审批</a></h2>
				<h2><a href="list.html" target="main">材料审批</a></h2>
				<h2><a href="list.html" target="main">电子印章</a></h2>
				<h2><a href="list.html" target="main">认购绿色通道结束</a></h2>
			</div>
		</div> -->
	</div>
</div>
<script>
$("#menu .wen").click(function(){
	var $next = $(this).parent().next();
	var has = $next.hasClass("hasClass");
	if(!has){
		$next.addClass("hasClass");
		$next.slideUp("slow",function(){
			addScroll();
		});
	}else{
		$next.slideDown("slow",function(){
			$next.removeClass("hasClass");
			addScroll();
		});
	}
});
$("#menu .erjicaidan h2 a").click(function(){
	$("#menu .erjicaidan h2 a").removeClass("hover");
	$(this).addClass("hover");
	$("#menu .wen").removeClass("hover");
	$(this).parents(".erjicaidan").prev().find(".wen").addClass("hover");
});

function addScroll(){
	$('#col1').unbind("mousewheel");
	var height =$("#menu").css("height").replace("px","")/1;
	var content_height = $("#col1").css("height").replace("px","")/1;
	var scroll = height-content_height;
	if(scroll<=0){
		 $("#menu").animate({"top":"0px"},300);
		return;
	}
	var s = true;
	$('#col1').mousewheel(function(event, delta, deltaX, deltaY) { 
		if(!s){
			return;
		}
		s = false;
	    if (window.console && console.log) {  
	         console.log(delta, deltaX, deltaY);  
	    } 
	    var top = $("#menu").css("top").replace("px","")/1;
	    top=top+deltaY*160;
	    
	    if(top<-1*scroll&&deltaY<0){
	    	top=-1*scroll-30;
	    }
	    if(top>0){
	    	top=0;
	    }
	    $("#menu").animate({"top":top+"px"},300,function(){
	    	s = true;
	    });
	}); 
}

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
document.getElementById("col1").style.height=(getPageSize_iframe()[3]-20)+"px";
//document.getElementById("menu").style.height=(getPageSize_iframe()[3]-50)+"px";
addScroll();
</script>
</body>