<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../commons/taglibs.jsp"%>
<META content=text/html;charset=utf-8 http-equiv=Content-Type ></Meta>
<link rel="stylesheet" type="text/css" href="../css/backstage.css" />
<script type="text/javascript" src="<c:url value="/admin/js/jquery.min.js" />"></script>
<script type="text/javascript">
<!--
	$(function(){
		PageUtil.init();
		PageUtil.initPage();
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
			var teamNum;
			$('td.teamNum').each(function(){
				teamNum = $(this).text(); 
				$(this).text(teamNum == '0' ? '不限' : teamNum);
			});
		},
		del : function(id) {
			if(confirm("是否删除?")) {
				window.location.href = "<c:url value="/admin/gameContent/deleteGameContent" />?ids=" + id;
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
				window.location.href = "<c:url value="/admin/gameContent/deleteGameContent" />?ids=" + ids;
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
				window.location.href = '<c:url value="/admin/gameContent/list?page=" />' + page;
			}
		},
		search:function(){
			var status = $.trim($("#status").val());
			window.location.href = '<c:url value="/admin/gameContent/list?status=" />' + status;
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
			<li class="TabbedPanelsTab TabbedPanelsTabSelected" >赛事内容管理</li>
		</ul>
		<div class="TabbedPanelsContentGroup">
		
		<div class="TabbedPanelsContent"  id="main_col2" >
			<div class="riqi_sousuo">
				 <span>状态：</span>
				<span>
					<select name="status" id="status">
						<option>---请选择---</option>
						<option value="1" <c:if test="${status == 1}">selected</c:if>>有效</option>
						<option value="0" <c:if test="${status == 0}">selected</c:if>>无效</option>
					</select>
				</span>
				<!--<span>至&nbsp;&nbsp;</span>
				<span>
				<input id="d14" class="input_riqi" type="text" onClick="WdatePicker()"/>
				<img class="riqi_img" src="images/rili.png" onClick="WdatePicker({el:'d14'})">
				</span>
				<input type="button" class="button_shaixuan" value="筛选" />
				<input type="text" class=" input_ss"  value="" placeholder="请输入你要搜索的关键字"/>
				<input type="text" class=" input_ss"  value="" placeholder="请输入第二个关键字"/>-->
				<input type="button" class="button_shaixuan" value="搜索" onclick="PageUtil.search();"/>
			</div>
			<div class="yhtz">
				<a href="<c:url value="/admin/gameContent/edit/add/0" />" class="lvse_btn">新建</a>
				<a href="javascript:PageUtil.delMulti();void 0;" class="lvse_btn">删除</a>
			</div>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_renzheng">
				<tr>
					<td width="4%" style="background:#e7e7e7;"><input class="headBox" style="vertical-align:middle;" type="checkbox" /></td>
					<td width="20%"><span class="tab_top">赛事</span></td>
					<td width="17%"><span class="tab_top">信息标题</span></td>
					<td width="17%"><span class="tab_top">信息内容</span></td>
					<c:if test="${admin.cityId  == 0}">
						<td width="6%"><span class="tab_top">创建者</span></td>
						<td width="8%"><span class="tab_top">球队所属城市</span></td>
					</c:if>
					<td width="6%"><span class="tab_top">创建时间</span></td>
					<td width="6%"><span class="tab_top">状态</span></td>
					<td><span class="tab_top">操作</span></td>
				</tr>
				<c:forEach items="${list}" var="gameContent">
					<tr>
						<td><input class="bodyBox" style="vertical-align:middle;" value="${gameContent.id}" type="checkbox" /></td>
						<td>${gameContent.gameName}</td>
						<td>${gameContent.title}</td>
						<td>${gameContent.content}</td>
						<c:if test="${admin.cityId  == 0}">
							<td>${gameContent.creator}</td>
							<td>${gameContent.cityName}</td>
						</c:if>

						<td>
							<fmt:formatDate value="${gameContent.createDate}" pattern="yyyy-MM-dd"/>
						</td>
						<td>
							<c:choose>

								<c:when test="${gameContent.status == 1}">
									有效
								</c:when>
								<c:otherwise>
									无效
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<a class="btn" href="<c:url value="/admin/gameContent/view?ids=${gameContent.id}" />">查看</a>
							<a class="btn" href="<c:url value="/admin/gameContent/edit/update/${gameContent.id}" />">编辑</a>
							<a class="btn" href="<c:url value="/admin/gameContent/changeStatus?ids=${gameContent.id}" />">更改状态</a>
							<a class="btn" href="javascript:PageUtil.del(${gameContent.id});void 0;">删除</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<div class="page">
				<a href="<c:url value="/admin/game/list?page=" />">首页</a>
				<c:if test="${currentPage > 1}">
		       		<a href="<c:url value="/admin/game/list?page=" />${currentPage-1}">上一页</a>
		       	</c:if>
				<c:forEach var="i" begin="1" end="${totalPage}" varStatus="status">
					<c:if test="${status.index == currentPage}">
			       		<a href="<c:url value="/admin/game/list?page=" />${status.index}" class="hover">${status.index}</a>
			       	</c:if>
			       	<c:if test="${status.index != currentPage}">
			       		<a href="<c:url value="/admin/game/list?page=" />${status.index}">${status.index}</a>
			       	</c:if>
				</c:forEach>
				<c:if test="${currentPage < totalPage}">
					<a href="<c:url value="/admin/game/list?page=" />${currentPage+1}">下一页</a>
				</c:if>
				<a href="<c:url value="/admin/game/list?page=" />${currentPage+1}">尾页</a>
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