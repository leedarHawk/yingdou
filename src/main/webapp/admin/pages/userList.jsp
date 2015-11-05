<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>	
<META content=text/html;charset=utf-8 http-equiv=Content-Type ></Meta>
<link rel="stylesheet" type="text/css" href="../css/backstage.css" />
<script type="text/javascript" src="<c:url value="/admin/js/jquery.min.js" />"></script>
<script type="text/javascript">
<!--
	$(function(){
		PageUtil.initPage();
	});
	var PageUtil = {
		del : function(id) {
			if(confirm("如果删除的是球队创建者，则球队将自动删除，是否继续?")) {
				window.location.href = "<c:url value="/admin/user/delete/" />" + id;
			}
		},
		toPage : function() {
			var page = $.trim($('#page').val());
			if(page.length > 0) {
				var reg = new RegExp("^[0-9]*$");
				if(!reg.test(page)) {
					$('#page').val('').focus();
					return;
				}
				window.location.href = '<c:url value="/admin/user/list?page=" />' + page;
			}
		},
		initPage :function() {
			var currentPage = <c:out value="${currentPage}" />;
			var totalPage = <c:out value="${totalPage}" />;
			var section = currentPage <= 10 ? 1 : Math.ceil(currentPage / 10);
			var minPage = (section - 1) * 10 + 1;
			var lastPage = (minPage + 9) < totalPage ? (minPage + 9) : totalPage;
			var txt;
			$('div.page a').each(function(){
				txt = $(this).text();
				if(txt.indexOf("页") < 0) {
					if(txt*1 >= minPage && txt <= lastPage) {
						$(this).show();
					}else {
						$(this).hide();
					}
				}
			});
		}
	};
//-->
</script>
<style type="text/css">
<!--
	a.btn {
		color:#00f;
	}
-->
</style>
<body>
<div class="main_right"  id="main_col1"  style="overflow:hidden;">
	<div class="hangy_qh2">
		<ul class="TabbedPanelsTabGroup">           
			<li class="TabbedPanelsTab TabbedPanelsTabSelected" >用户管理</li>
		</ul>
		<div class="TabbedPanelsContentGroup">
		
		<div class="TabbedPanelsContent"  id="main_col2" >
			<div class="riqi_sousuo">
				<!-- <span>日期：</span>
				<span>
				<input id="d13" class="input_riqi" type="text" onClick="WdatePicker()"/>
				<img class="riqi_img" src="images/rili.png" onClick="WdatePicker({el:'d13'})">
				</span>
				<span>至&nbsp;&nbsp;</span>
				<span>
				<input id="d14" class="input_riqi" type="text" onClick="WdatePicker()"/>
				<img class="riqi_img" src="images/rili.png" onClick="WdatePicker({el:'d14'})">
				</span>
				<input type="button" class="button_shaixuan" value="筛选" /><input type="text" class=" input_ss"  value="" placeholder="请输入你要搜索的关键字"/><input type="text" class=" input_ss"  value="" placeholder="请输入第二个关键字"/><input type="button" class="button_shaixuan" value="搜索" /> -->
			</div>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_renzheng">
				<tr>
					<td width="15%"><span class="tab_top">用户</span></td>
					<td width="5%"><span class="tab_top">性别</span></td>
					<td width="8%"><span class="tab_top">手机</span></td>
					<td width="8%"><span class="tab_top">qq</span></td>
					<td width="26%"><span class="tab_top">创建的球队</span></td>
					<td width="26%"><span class="tab_top">参加的球队</span></td>
					<td><span class="tab_top">操作</span></td>
				</tr>
				<c:forEach items="${list}" var="map">
					<tr>
						<td style="text-align:left;"><img src="<c:url value="${map.user.headPic}" />"  style="width:32px;margin:5px;" />${map.user.username}</td>
						<td>${map.user.sex}</td>
						<td>${map.user.mobile}</td>
						<td>${map.user.qq}</td>
						<td>${map.createdTeams}</td>
						<td>${map.joinedTeams}</td>
						<td><a class="btn" href="javascript:PageUtil.del(${map.user.id});void 0;">删除</a></td>
					</tr>
				</c:forEach>
			</table>
			<div class="page">
				<a href="<c:url value="/admin/user/list?page=1" />">首页</a>
				<c:if test="${currentPage > 1}">
		       		<a href="<c:url value="/admin/user/list?page=" />${currentPage-1}">上一页</a>
		       	</c:if>
				<c:forEach var="i" begin="1" end="${totalPage}" varStatus="status">
					<c:if test="${status.index == currentPage}">
			       		<a href="<c:url value="/admin/user/list?page=" />${status.index}" class="hover">${status.index}</a>
			       	</c:if>
			       	<c:if test="${status.index != currentPage}">
			       		<a href="<c:url value="/admin/user/list?page=" />${status.index}">${status.index}</a>
			       	</c:if>
				</c:forEach>
				<c:if test="${currentPage < totalPage}">
					<a href="<c:url value="/admin/user/list?page=" />${currentPage+1}">下一页</a>
				</c:if>
				<span>跳至<input id="page" class="fy_text" name="" type="text" /><a href="javascript:PageUtil.toPage();void 0;">确定</a></span></div>
		</div>
		</div>
		
		</div></div>
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