<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>
<META content=text/html;charset=utf-8 http-equiv=Content-Type ></Meta>
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/css/backstage.css" />" />
<script type="text/javascript" src="<c:url value="/admin/js/jquery.min.js" />"></script>
<script type="text/javascript">
<!--
	$(function(){
		PageUtil.init();
	});
	var PageUtil = {
			init : function() {
				var _this = this;
				$('input[name="username"]').focus();
				$('form').submit(function(){
					if(!_this.check()) {
						return false;
					}
					return true;
				});
				var editType = '${editType}' ;
				if(editType == 'add'){
					$('input[name="username"]').val('') ;
					$('input[name="password"]').val('') ;
				}
			},
			check : function() {
				var username = $.trim($('input[name="username"]').val());
				if(username.length == 0) {
					alert("请输入管理员名称");
					$('input[name="username"]').focus();
					return false;
				}
				var result = true;
			    $.ajax({
					url : '<c:url value="/admin/admin/checkAdmin" />',
					async:false, 
					data : {username:username},
					success : function(res) {
						if(res == 'false' && username != '<c:out value="${admin.username}" />' && '<c:out value="${admin.username}" />'.length > 0) {
							alert("管理员" + username + "已存在");
							$('input[name="username"]').focus();
							result = false;
						}
						<c:if test="${editType == 'add'}">
							var password = $.trim($('input[name="password"]').val());
							if(password.length == 0) {
								alert("请输入密码");
								$('input[name="password"]').focus();
								result = false;
							}
							var cPassword = $.trim($('input[name="cPassword"]').val());
							if(cPassword.length == 0) {
								alert("请输入确认密码");
								$('input[name="cPassword"]').focus();
								result = false;
							}
							if(password != cPassword) {
								alert("两次输入的密码不一致");
								$('input[name="cPassword"]').focus();
								result = false;
							}
						</c:if>
						<c:if test="${editType == 'update'}">
							var oPassword = $.trim($('input[name="oPassword"]').val());
							if(oPassword.length == 0) {
								alert("请输入旧密码");
								$('input[name="oPassword"]').focus();
								result = false;
							}
							$.ajax({
								url : '<c:url value="/admin/admin/checkPwd" />',
								data : {password:oPassword, id:<c:out value="${admin.id}" />},
								async:false, 
								success : function(res) {
									if(res == 'false') {
										alert("旧密码不正确");
										$('input[name="oPassword"]').focus();
										result = false;
									}else {
										var password = $.trim($('input[name="password"]').val());
										if(password.length == 0) {
											alert("请输入密码");
											$('input[name="password"]').focus();
											result = false;
										}
										var cPassword = $.trim($('input[name="cPassword"]').val());
										if(cPassword.length == 0) {
											alert("请输入确认密码");
											$('input[name="cPassword"]').focus();
											result = false;
										}
										if(password != cPassword) {
											alert("两次输入的密码不一致");
											$('input[name="cPassword"]').focus();
											result = false;
										}
									}
								}
							});
						</c:if>
					}
				});
			    return result;
			}
	};
//-->
</script>
<body>
<div class="main_right"  id="main_col1"  style="overflow:hidden;">
	<div class="hangy_qh2">
		<ul class="TabbedPanelsTabGroup"> 
			<c:if test="${editType == 'update' }">
				<li class="TabbedPanelsTab TabbedPanelsTabSelected" >修改管理员</li>
			</c:if>        
			<c:if test="${editType == 'add' }">
				<li class="TabbedPanelsTab TabbedPanelsTabSelected" >新建管理员</li>
			</c:if>
		</ul>
		<div class="TabbedPanelsContentGroup">
		<div class="TabbedPanelsContent"  id="main_col2" >
			<c:if test="${editType == 'update' }">
				<form action="<c:url value="/admin/admin/updateAdmin" />" method="post">
				<input type="hidden" name="id" value="${admin.id}" />
			</c:if>        
			<c:if test="${editType == 'add' }">
				<form action="<c:url value="/admin/admin/addAdmin" />" method="post">
			</c:if>
				<ul class="tongdao">
					<c:if test="${editType == 'add' }">
						<li>
							<span class="ziduan"><span class="required">*</span>管理员：</span>
							<div class="wen"><input type="text" name="username" class="input_cjxm2"></div>
						</li>
						<li>
							<span class="ziduan"><span class="required">*</span>所有区域：</span>
							<div class="wen">
								<select class="input_cjxm2" name="cityId">
									<option value="-1">请选择</option>
									<option value="0">系统管理员</option>
									<c:forEach items="${cityList}" var="city">
										<option value="${city.id}">${city.cityName}</option>
									</c:forEach>
								</select>
							</div>
						</li>

						<li>
							<span class="ziduan"><span class="required">*</span>设置密码：</span>
							<div class="wen"><input type="password" name="password" class="input_cjxm2" /></div>
						</li>
						<li>
							<span class="ziduan"><span class="required">*</span>确认密码：</span>
							<div class="wen"><input type="password" name="cPassword" class="input_cjxm2" /></div>
						</li>
					</c:if>
					<c:if test="${editType == 'update' }">
						<li>
							<span class="ziduan"><span class="required">*</span>管理员：</span>
							<div class="wen"><input type="text" name="username" class="input_cjxm2" value="<c:out value="${admin.username }" />"></div>
						</li>
						<li>
							<span class="ziduan"><span class="required">*</span>所有区域：</span>
							<div class="wen">
								<select class="input_cjxm2" name="cityId">
									<option value="-1">请选择</option>
									<option value="0" <c:if test="${admin.type == 1}">>selected</c:if>系统管理员</option>
									<c:forEach items="${cityList}" var="city">
										<option value="${city.id}"
											<c:if test="${admin.cityId == city.id}">selected </c:if>
										>${city.cityName}</option>
									</c:forEach>
								</select>
							</div>
						</li>
						<li>
							<span class="ziduan"><span class="required">*</span>旧密码：</span>
							<div class="wen"><input type="password" name="oPassword" class="input_cjxm2" /></div>
						</li>
						<li>
							<span class="ziduan"><span class="required">*</span>新密码：</span>
							<div class="wen"><input type="password" name="password" class="input_cjxm2" /></div>
						</li>
						<li>
							<span class="ziduan"><span class="required">*</span>确认新密码：</span>
							<div class="wen"><input type="password" name="cPassword" class="input_cjxm2" /></div>
						</li>
					</c:if>
					<li>
						<span class="ziduan">&nbsp;</span>
						<div class="wen">
							<input type="submit" class="button_tongdao" value="确定">
							<input type="button" class="button_tongdao" value="返回" onclick="javascript:window.location.href='<c:url value="/admin/admin/list" />'">
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