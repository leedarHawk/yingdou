<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>	
<META content=text/html;charset=utf-8 http-equiv=Content-Type ></Meta>
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/css/backstage.css" />" />
<script type="text/javascript" src="<c:url value="/admin/js/jquery.min.js" />"></script>
<style type="text/css">
<!--
	a.btn {
		color:#00f;
	}
	table caption {
		margin:5px 0px;
		font-size:14px;
		font-weight:bold;
	}
	td input {
		border:1px solid #c0c0c0;
	}
-->
</style>
<script type="text/javascript">
<!--
	var PageUtil = {
		toPage : function() {
			var page = $.trim($('#page').val());
			if(page.length > 0) {
				var reg = new RegExp("^[0-9]*$");
				if(!reg.test(page)) {
					$('#page').val('').focus();
					return;
				}
				window.location.href = '<c:url value="/admin/challenge/list?page=" />' + page;
			}
		},
		update : function(cid) {
			var score = $.trim($('input.input_' + cid).val());
			if(score.length == 0) {
				return;
			}
			$.ajax({
				url : '<c:url value="/admin/challenge/update" />',
				data : {id:cid,score:score},
				type : 'post',
				success : function(res) {
					if(res == 'ok') {
						alert('更新成功');
					}
				}
			});
		}
	};
//-->
</script>
<body>
<div class="main_right"  id="main_col1"  style="overflow:hidden;">
	<div class="hangy_qh2">
		<ul class="TabbedPanelsTabGroup">           
			<li class="TabbedPanelsTab TabbedPanelsTabSelected" >约战列表</li>
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
					<td width="15%"><span class="tab_top">主队</span></td>
					<td width="15%"><span class="tab_top">客队</span></td>
					<td width="12%"><span class="tab_top">比分</span></td>
					<td width="12%"><span class="tab_top">时间</span></td>
					<td width="6%"><span class="tab_top">裁判</span></td>
					<td width="20%"><span class="tab_top">地点</span></td>
					<td width="11%"><span class="tab_top">费用</span></td>
					<td width="19%"><span class="tab_top">操作</span></td>
				</tr>
				<c:forEach items="${list}" var="challenge">
					<tr>
						<td>${challenge.host.name}</td>
						<td>${challenge.guest.name}</td>
						<td><input style="width:100%;height:100%;text-align:center;border:none;" placeholder="输入比分" class="input_${challenge.id }" type="text" name="score" value="${challenge.score }" /></td>
						<td><fmt:formatDate value="${challenge.time}" type="both" pattern="yyyy年MM月dd日 HH:mm"/></td>
						<td><c:if test="${challenge.needReferee == 1 }">待定</c:if><c:if test="${challenge.needReferee == 0 }">无</c:if></td>
						<td>${challenge.location}</td>
						<td><c:if test="${challenge.feeType == 0 }">免费</c:if><c:if test="${challenge.feeType == 1 }">¥<c:out value="${challenge.fee }" />(AA)</c:if></td>
						<td><a href="javascript:PageUtil.update(${challenge.id });void 0;">更新</a></td>
					</tr>
				</c:forEach>
			</table>
			<div class="page">
					<c:if test="${currentPage > 1}">
			       		<a href="<c:url value="/admin/challenge/list?page=" />${currentPage-1}">上一页</a>
			       	</c:if>
					<c:forEach var="i" begin="1" end="${totalPage}" varStatus="status">
						<c:if test="${status.index == currentPage}">
				       		<a href="<c:url value="/admin/challenge/list?page=" />${status.index}" class="hover">${status.index}</a>
				       	</c:if>
				       	<c:if test="${status.index != currentPage}">
				       		<a href="<c:url value="/admin/challenge/list?page=" />${status.index}">${status.index}</a>
				       	</c:if>
					</c:forEach>
					<c:if test="${currentPage < totalPage}">
						<a href="<c:url value="/admin/challenge/list?page=" />${currentPage+1}">下一页</a>
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