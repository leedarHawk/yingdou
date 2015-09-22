<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>	
<META content=text/html;charset=utf-8 http-equiv=Content-Type ></Meta>
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/css/backstage.css" />" />
<script type="text/javascript" src="<c:url value="/admin/js/jquery.min.js" />"></script>
<script type="text/javascript">
<!--
	$(function(){
		//PageUtil.init();
	});
	var PageUtil = {
		init :function(){
			$('input.headBox').click(function(){
				var status = $(this).prop('checked');
				$('input.bodyBox').prop('checked',status);
			});
			$('input.bodyBox').each(function(){
				$(this).click(function(){
					var status = true;
					$('input.bodyBox').each(function(){
						status = status && $(this).prop('checked');
					});
					$('input.headBox').prop("checked",status);
				});
			})
		},
		del : function(id) {
			if(confirm("是否删除?")) {
				window.location.href = "<c:url value="/admin/gameAnnouncement/delete/" />" + id+ "/" + <c:out value="${game.id}" />;
			}
		},
		delMulti : function() {
			var ids = [];
			$('input.bodyBox').each(function(){
				if($(this).prop('checked')) {
					ids.push($(this).val());
				}
			})
			if(ids.length == 0) {
				return;
			}
			ids = ids.join(",");
			if(confirm("是否删除?")) {
				window.location.href = "<c:url value="/admin/gameAnnouncement/delete/" />" + ids + "/" + <c:out value="${game.id}" />;
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
				window.location.href = '<c:url value="/admin/gameAnnouncement/list?page=" />' + page + '&gameId=${game.id}';
			}
		},
		initCheck : function(status,id) {
			$.ajax({
				url : '<c:url value="/admin/gameApply/check" />',
				data : {'id':id, 'status':status},
				type : "post",
				success : function(result) {
					console.dir(result);
					if(result == 1) {
						//允许
						$('#' + id + ' td.check').html('<span style=color:#c0c0c0>已允许</span>');
						$('#' + id + ' td.status').text('待支付');
					}else {
						//拒绝
						$('#' + id + ' td.check').html('<span style=color:#c0c0c0>已拒绝</span>');
						$('#' + id + ' td.status').text('已拒绝');
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
	table caption {
		margin:5px 0px;
		font-size:14px;
		font-weight:bold;
	}
-->
</style>
<body>
<div class="main_right"  id="main_col1"  style="overflow:hidden;">
	<div class="hangy_qh2">
		<ul class="TabbedPanelsTabGroup">           
			<li class="TabbedPanelsTab TabbedPanelsTabSelected" >赛事报名管理</li>
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
			<div class="yhtz">
				<a href="<c:url value="/admin/game/list" />" class="lvse_btn">返回</a>
			</div>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_renzheng">
				<caption><c:out value="${game.name}" />报名信息</caption>
				<tr>
					<!-- <td width="10%" style="background:#e7e7e7;"><input class="headBox" style="vertical-align:middle;" type="checkbox" /></td> -->
					<td width="10%"><span class="tab_top">报名人</span></td>
					<td width="15%"><span class="tab_top">报名球队</span></td>
					<td width="10%"><span class="tab_top">电话</span></td>
					<td width="10%"><span class="tab_top">qq</span></td>
					<td width="13%"><span class="tab_top">备用联系人</span></td>
					<td width="13%"><span class="tab_top">备用联系人电话</span></td>
					<td width="10%"><span class="tab_top">状态</span></td>
					<td width="10%"><span class="tab_top">报名时间</span></td>
					<td><span class="tab_top">审核</span></td>
				</tr>
				<c:forEach items="${list}" var="gameApply">
					<tr id="<c:out value="${gameApply.id }" />">
						<%-- <td><input class="bodyBox" style="vertical-align:middle;" value="${gameApply.id}" type="checkbox" /></td> --%>
						<td>${gameApply.creator}</td>
						<td>${gameApply.team}</td>
						<td>${gameApply.mobile}</td>
						<td>${gameApply.qq}</td>
						<td>${gameApply.bakContactor}</td>
						<td>${gameApply.bakMobile}</td>
						<c:choose>
							<c:when test="${gameApply.status == 0 }">
								<td class="status">待审核</td>
							</c:when>
							<c:when test="${gameApply.status == 1 }">
								<td class="status">待支付</td>
							</c:when>
							<c:when test="${gameApply.status == 2 }">
								<td class="status">报名成功</td>
							</c:when>
							<c:when test="${gameApply.status == 3 }">
								<td class="status">已拒绝</td>
							</c:when>
						</c:choose>
						<td>${gameApply.time}</td>
						<c:choose>
							<c:when test="${not empty game.fee }">
								<c:if test="${gameApply.status == 0 }">
									<td class="check"><a class="btn" href="javascript:PageUtil.initCheck(1,${gameApply.id });void 0;">允许</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn" href="javascript:PageUtil.initCheck(3,${gameApply.id });void 0;">拒绝</a></td>
								</c:if>
								<c:if test="${gameApply.status != 3 && gameApply.status > 0}">
									<td class="check"><span style="color:#c0c0c0;">已允许</span></td>
								</c:if>
								<c:if test="${gameApply.status == 3 }">
									<td class="check"><span style="color:#c0c0c0;">已拒绝</span></td>
								</c:if>
							</c:when>
							<c:when test="${empty game.fee }">
								<c:if test="${gameApply.status == 0 }">
									<td class="check"><a class="btn" href="javascript:PageUtil.initCheck(2,${gameApply.id });void 0;">允许</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn" href="javascript:PageUtil.initCheck(3,${gameApply.id });void 0;">拒绝</a></td>
								</c:if>
								<c:if test="${gameApply.status != 3 && gameApply.status > 0}">
									<td class="check"><span style="color:#c0c0c0;">已允许</span></td>
								</c:if>
								<c:if test="${gameApply.status == 3 }">
									<td class="check"><span style="color:#c0c0c0;">已拒绝</span></td>
								</c:if>
							</c:when>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
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