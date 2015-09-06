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
		1
		<div class="TabbedPanelsContent"  id="main_col2" >
			
			<p class="cjxm_ming">项目信息</p>
			<ul class="tongdao">
				<li>
					<span class="ziduan">项目名称：</span>
					<div class="wen"><input type="text" class="input_cjxm2"></div>
				</li>
				<li>
					<span class="ziduan">项目简介：</span>
					<div class="wen"><textarea class="textarea_td"></textarea></div>
				</li>
				<li>
					<span class="ziduan">项目配图：</span>
					<div class="wen"><input type="text" class="input_cjxm">
						<a href="javascript:void(0);" class="btn_addPic"><span>浏览</span><input type="file" tabindex="3" title="支持jpg、jpeg、gif、png格式，文件小于5M" size="3" name="pic" class="filePrew"></a>
					</div>
				</li>
				<li>
					<span class="ziduan">联系方式：</span>
					<div class="wen"><input type="text" class="input_cjxm2"></div>
				</li>
				<li>
					<span class="ziduan">上传商业计划书：</span>
					<div class="wen"><input type="text" class="input_cjxm">
						<a href="javascript:void(0);" class="btn_addPic"><span>浏览</span><input type="file" tabindex="3" title="支持jpg、jpeg、gif、png格式，文件小于5M" size="3" name="pic" class="filePrew"></a>
					</div>
				</li>
				<li>
					<span class="ziduan">宣传视频地址：</span>
					<div class="wen"><input type="text" class="input_cjxm2"></div>
				</li>
			</ul>
			
			<p class="cjxm_ming">融资信息</p>
			<ul class="tongdao">
				<li>
					<span class="ziduan">项目估值：</span>
					<div class="wen"><input type="text" class="input_cjxm2"></div>
				</li>
				<li>
					<span class="ziduan">融资轮次：</span>
					<div class="wen"><select class="select_cjxm"><option>A轮</option><option>B轮</option><option>C轮</option></select></div>
				</li>
				<li>
					<span class="ziduan">股权出让比例：</span>
					<div class="wen"><input type="text" class="input_cjxm2"></div>
				</li>
				<li>
					<span class="ziduan">融资额度：</span>
					<div class="wen"><input type="text" class="input_cjxm2"></div>
				</li>
				<li>
					<span class="ziduan">融资周期：</span>
					<div class="wen"><input type="text" class="input_cjxm2"></div>
				</li>
			</ul>
			
			<p class="cjxm_ming">企业信息</p>
			<ul class="tongdao">
				<li>
					<span class="ziduan">公司名称：</span>
					<div class="wen"><input type="text" class="input_cjxm2"></div>
				</li>
				<li>
					<span class="ziduan">组织机构代码：</span>
					<div class="wen"><input type="text" class="input_cjxm2"></div>
				</li>
				<li>
					<span class="ziduan">营业执照：</span>
					<div class="wen"><input type="text" class="input_cjxm2"></div>
				</li>
				<li>
					<span class="ziduan">法人：</span>
					<div class="wen"><input type="text" class="input_cjxm2"></div>
				</li>
				<li>
					<span class="ziduan">法人身份证号码：</span>
					<div class="wen"><input type="text" class="input_cjxm2"></div>
				</li>
				<li>
					<span class="ziduan">身份证扫描件：</span>
					<div class="wen">
						<ul class="tongdao_shenfen">
							<li><p>正面</p><p class="img"><img src="images/img_04.jpg"></p>
								<a href="javascript:void(0);" class="btn_addPic"><span>选择文件</span><input type="file" tabindex="3" title="支持jpg、jpeg、gif、png格式，文件小于5M" size="3" name="pic" class="filePrew"></a>
							</li>
							<li><p>背面</p><p class="img"><img src="images/img_05.jpg"></p>
								<a href="javascript:void(0);" class="btn_addPic"><span>选择文件</span><input type="file" tabindex="3" title="支持jpg、jpeg、gif、png格式，文件小于5M" size="3" name="pic" class="filePrew"></a>
							</li>
						</ul>
					</div>
				</li>
				<li>
					<span class="ziduan">&nbsp;</span>
					<div class="wen"><input type="button" class="button_tongdao" value="创建项目"></div>
				</li>
			</ul>
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