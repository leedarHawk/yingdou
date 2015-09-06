<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<META content=text/html;charset=utf-8 http-equiv=Content-Type ></Meta>
<link rel="stylesheet" type="text/css" href="../css/backstage.css" />
<body>
<div class="main_right"  id="main_col1"  style="overflow:hidden;">
	<div class="hangy_qh2">
		<ul class="TabbedPanelsTabGroup">           
			<li class="TabbedPanelsTab TabbedPanelsTabSelected" >创建项目</li>
		</ul>
		<div class="TabbedPanelsContentGroup">
		<!--1-->
		
		<div class="TabbedPanelsContent"  id="main_col2" >
			<div class="riqi_sousuo">
				<span>日期：</span>
				<span>
				<input id="d13" class="input_riqi" type="text" onClick="WdatePicker()"/>
				<img class="riqi_img" src="images/rili.png" onClick="WdatePicker({el:'d13'})">
				</span>
				<span>至&nbsp;&nbsp;</span>
				<span>
				<input id="d14" class="input_riqi" type="text" onClick="WdatePicker()"/>
				<img class="riqi_img" src="images/rili.png" onClick="WdatePicker({el:'d14'})">
				</span>
				<input type="button" class="button_shaixuan" value="筛选" /><input type="text" class=" input_ss"  value="" placeholder="请输入你要搜索的关键字"/><input type="text" class=" input_ss"  value="" placeholder="请输入第二个关键字"/><input type="button" class="button_shaixuan" value="搜索" />
			</div>
			<div class="yhtz"><a href="" class="lvse_btn">导出</a></div>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_renzheng">
				<tr>
					<td width="10%"><span class="tab_top">编号</span></td>
					<td width="10%"><span class="tab_top">审批结果</span></td>
					<td width="10%"><span class="tab_top">申请时间</span></td>
					<td width="10%"><span class="tab_top">认证人</span></td>
					<td width="10%"><span class="tab_top">身份证号</span></td>
					<td width="10%"><span class="tab_top">归属</span></td>
					<td width="10%"><span class="tab_top">手机号</span></td>
					<td width="10%"><span class="tab_top">审批时间</span></td>
					<td width="10%"><span class="tab_top">审批人</span></td>
					<td><span class="tab_top">备注</span></td>
				</tr>
				<tr>
					<td>01</td>
					<td>通过</td>
					<td>2015年6月19日</td>
					<td>张三丰</td>
					<td>345645678954212354</td>
					<td>北京</td>
					<td>12345456987</td>
					<td>2015年6月19日</td>
					<td>李四</td>
					<td>无</td>
				</tr>
				<tr>
					<td>01</td>
					<td>通过</td>
					<td>2015年6月19日</td>
					<td>张三丰</td>
					<td>345645678954212354</td>
					<td>北京</td>
					<td>12345456987</td>
					<td>2015年6月19日</td>
					<td>李四</td>
					<td>无</td>
				</tr><tr>
					<td>01</td>
					<td>通过</td>
					<td>2015年6月19日</td>
					<td>张三丰</td>
					<td>345645678954212354</td>
					<td>北京</td>
					<td>12345456987</td>
					<td>2015年6月19日</td>
					<td>李四</td>
					<td>无</td>
				</tr><tr>
					<td>01</td>
					<td>通过</td>
					<td>2015年6月19日</td>
					<td>张三丰</td>
					<td>345645678954212354</td>
					<td>北京</td>
					<td>12345456987</td>
					<td>2015年6月19日</td>
					<td>李四</td>
					<td>无</td>
				</tr><tr>
					<td>01</td>
					<td>通过</td>
					<td>2015年6月19日</td>
					<td>张三丰</td>
					<td>345645678954212354</td>
					<td>北京</td>
					<td>12345456987</td>
					<td>2015年6月19日</td>
					<td>李四</td>
					<td>无</td>
				</tr><tr>
					<td>01</td>
					<td>通过</td>
					<td>2015年6月19日</td>
					<td>张三丰</td>
					<td>345645678954212354</td>
					<td>北京</td>
					<td>12345456987</td>
					<td>2015年6月19日</td>
					<td>李四</td>
					<td>无</td>
				</tr><tr>
					<td>01</td>
					<td>通过</td>
					<td>2015年6月19日</td>
					<td>张三丰</td>
					<td>345645678954212354</td>
					<td>北京</td>
					<td>12345456987</td>
					<td>2015年6月19日</td>
					<td>李四</td>
					<td>无</td>
				</tr>
				<tr>
					<td>02</td>
					<td>不通过</td>
					<td>2015年6月19日</td>
					<td>张三丰</td>
					<td>345645678954212354</td>
					<td>北京</td>
					<td>12345456987</td>
					<td>2015年6月19日</td>
					<td>李四</td>
					<td>身份证扫描不符合要求</td>
				</tr>
				<tr>
					<td>03</td>
					<td>通过</td>
					<td>2015年6月19日</td>
					<td>张三丰</td>
					<td>345645678954212354</td>
					<td>北京</td>
					<td>12345456987</td>
					<td>2015年6月19日</td>
					<td>李四</td>
					<td>无</td>
				</tr>
				<tr>
					<td>04</td>
					<td>不通过</td>
					<td>2015年6月19日</td>
					<td>张三丰</td>
					<td>345645678954212354</td>
					<td>北京</td>
					<td>12345456987</td>
					<td>2015年6月19日</td>
					<td>李四</td>
					<td>身份证扫描不符合要求</td>
				</tr>
				<tr>
					<td>05</td>
					<td>不通过</td>
					<td>2015年6月19日</td>
					<td>张三丰</td>
					<td>345645678954212354</td>
					<td>北京</td>
					<td>12345456987</td>
					<td>2015年6月19日</td>
					<td>李四</td>
					<td>身份证扫描不符合要求</td>
				</tr>
			</table>
			<div class="page"><a href="">上一页</a><a href="" class="hover">1</a><a href="">2</a><a href="">3</a><a href="">4</a><a href="">5</a><a href="">下一页</a><span>跳至<input class="fy_text" name="" type="text" /><a href="">确定</a></span></div>
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