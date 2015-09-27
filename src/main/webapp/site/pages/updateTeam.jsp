<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0, maximum-scale=1,user-scalable=yes" />
<meta name="format-detection" content="telephone=no" />
<title></title>
<link rel="stylesheet" href="<c:url value="/site/css/style.css" />" />
<script type="text/javascript" src="<c:url value="/site/js/jquery.js" />"></script>
<style type="text/css">
	.zhc_gh{ 
		background:url(<c:url value="/site/images/zhaox.png" />) no-repeat center;
		width:65px; 
		height:65px; 
		text-indent:-9999px; 
		margin-left:3px; 
		float:left;
	}
</style>
<script type="text/javascript">
	$(function(){
		PageUtil.init();
	});
	var PageUtil = {
			init : function() {
				var _this = this;
				$('input.lv_btn').click(function(){
					_this.update();
				});
				this.initCam();
				$('form').submit(function(){
					return _this.check();
				});
			},
			check : function() {
				var slogan = $.trim($('input[name="slogan"]').val());
				if(slogan.length == 0) {
					AlertUtil.show("请输入球队公告");
					return false;
				}
				var description = $.trim($('textarea[name="description"]').val());
				if(description.length == 0) {
					AlertUtil.show("请输入球队简介");
					return false;
				}
				return true;
			},
			/**
			 * 初始化拍照
			 */
			initCam : function() {
				var _this = this;
				$('#get-pic').change(function(e){
					// Get a reference to the taken picture or chosen file
		            var files = event.target.files,
		                isImage,
		                fileReader;
		            if (files && files.length > 0) {
		                _this.file = files[0];
		                console.log(_this.file.name)
		                isImage = /image\/.*/i;
		                if(!_this.file.type.match(isImage)) {
		                	console.log("非图片文件");
		                	return;
		                }
		                try {
		                	 fileReader = new FileReader();
		                     fileReader.onload = function (event) {
		                         $('#head-pic').attr('src',event.target.result);
		                         console.log(event.target.result);
		                     };
		                     fileReader.readAsDataURL(_this.file);
		                }
		                catch (e) {
		                	 var error = document.querySelector("#error");
		                     if (error) {
		                         error.innerHTML = "Neither createObjectURL or FileReader are supported";
		                     }
		                }
		            }
				});
			}
	};
</script>
</head>

<body>
<%@ include file="../../commons/alert.jsp"%>
<div class="header"><span><a href="javascript:history.go(-1);void 0;"><img src="<c:url value="/site/images/jt_fh.png" />">返回</a></span>修改球队</div>
<div class="main3">
<form action="<c:url value="/site/team/update" />" method="post" enctype="multipart/form-data">
<div class="chj_tx">
	<img id="head-pic" src="<c:url value="${team.pic}" />">
	<span><input id="get-pic" type="file" name="file" class="zhc_gh" accept="image/*" /></span>
</div>
<input type="hidden" name="teamId" value="${team.id}" />
<div class="jiaq_h1"><c:out value="${team.name }" /></div>
<div style="text-align:center;color:#fff;background:#c0c0c0;margin-bottom:10px;">只能上传本地照片</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="50" align="right">球队公告：</td>
    <td height="50"><input name="slogan" type="text" class="fab_text" value="<c:out value="${team.slogan }" />"></td>
  </tr>
  <tr>
    <td height="90" align="right" valign="top">球队简介：</td>
    <td><textarea class="fab_textare" name="description" cols="" rows=""><c:out value="${team.description }" /></textarea></td>
  </tr>
</table>
	<div class="bot_btn"><input class="lv_btn" name="" type="submit" value="确定"></div>
</form>
</div>
<div style="height:60px;"></div>
<div class="footer">
<ul>
<li class="nav01"><a href="<c:url value="/site/game/list" />">比赛</a></li>
<li class="nav02"><a href="<c:url value="/site/challenge/list" />">约战</a></li>
<li class="nav03"><a class="hover" href="<c:url value="/site/team/list" />">球队</a></li>
<li class="nav04"><a href="<c:url value="/site/user/path/me" />">我</a></li>
</ul>
</div>

</body>
</html>
