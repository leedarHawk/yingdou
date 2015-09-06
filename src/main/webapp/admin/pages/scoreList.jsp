<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>	
<META content=text/html;charset=utf-8 http-equiv=Content-Type ></Meta>
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/css/backstage.css" />" />
<script type="text/javascript" src="<c:url value="/admin/js/jquery.min.js" />"></script>
<script type="text/javascript">
<!--
	var PageUtil = {
		update :function(id){
			var round = $.trim($('#' + id + ' input[name="round"]').val());
			var win = $.trim($('#' + id + ' input[name="win"]').val());
			var lose = $.trim($('#' + id + ' input[name="lose"]').val());
			if(round.length == 0 || win.length == 0 || lose.length == 0) {
				return;
			}
			var reg = new RegExp(/^\+?[1-9][0-9]*$/);
			if(!reg.test(round) || !reg.test(win) || !reg.test(lose)){  
		        alert("请输入数字!");  
		    } else {
		    	$.ajax({
		    		url : '<c:url value="/admin/score/update" />',
		    		data : {'round':round,'win':win,'lose':lose,'id':id},
		    		type : 'post',
		    		success : function(data) {
		    			console.log(data);
		    		}
		    	});
		    }
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
	td input {
		border:1px solid #c0c0c0;
	}
-->
</style>
<body>
<div class="main_right"  id="main_col1"  style="overflow:hidden;">
	<div class="hangy_qh2">
		<ul class="TabbedPanelsTabGroup">           
			<li class="TabbedPanelsTab TabbedPanelsTabSelected" >球队赛绩管理</li>
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
				<caption><c:out value="${gameName}" /> - 球队赛绩</caption>
				<tr>
					<td width="20%"><span class="tab_top">球队</span></td>
					<td width="15%"><span class="tab_top">比赛场次</span></td>
					<td width="15%"><span class="tab_top">胜</span></td>
					<td width="15%"><span class="tab_top">负</span></td>
					<td width="15%"><span class="tab_top">球员评分</span></td>
					<td><span class="tab_top">操作</span></td>
				</tr>
				<c:forEach items="${list}" var="score">
					<tr id="${score.id }">
						<td>${score.team.name}</td>
						<td><input type="text" name="round" value="${score.round}" /></td>
						<td><input type="text" name="win" value="${score.win}" /></td>
						<td><input type="text" name="lose" value="${score.lose}" /></td>
						<td><a href="<c:url value="/admin/userScore/edit/${score.gameId }/${score.team.id}" />">评分</a></td>
						<td><a class="btn" href="javascript:PageUtil.update(${score.id });void 0;">更新</a></td>
					</tr>
				</c:forEach>
			</table>
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