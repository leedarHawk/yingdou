<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
	$(function(){
		AlertUtil.init();
	});
	var AlertUtil = {
			init : function() {
				$('div.button button').click(function(){
					$('#alertWindow').hide();
					$('#bg').hide();
				});
			},
			show : function(msg) {
				$('#alertWindow div.alertContent').html(msg);
				$('#alertWindow').show();
				$('#bg').show();
			}
	};
	var LoadingUtil = {
			show : function() {
				$('#loadingWindow').show();
				$('#bg').show();
			},
			hide : function() {
				$('#loadingWindow').hide();
				$('#bg').hide();
			}
	};
//-->
</script>
<style type="text/css">
<!--
	#loadingWindow,#alertWindow {
		display:none;
		width:220px;
		height:140px;
		border:1px solid #c0c0c0;
		font-size:14px;
		position:fixed;
		top:50%;
		left:50%;
		margin-left:-110px;
		margin-top:-70px;
		z-index:102;
		background:#fff;
	}
	div.headBar {
		height:30px;
		border-bottom:1px solid #c0c0c0;
		background:#f8f8f8;
		line-height:30px;
		padding-left:5px;
		font-weight:bold;
	}
	div.alertContent {
		height:60px;
		line-height:60px;
		text-align:center;
	}
	#alertWindow div.button {
		text-align:center;
	}
	#alertWindow div.button button{
		background:#f8f8f8;
		border:1px solid #c0c0c0;
		height:32px;
	}
	#bg {
		display: none;
		position: fixed;
		top: 0%;
		left: 0%;
		width: 100%;
		height: 100%;
		background-color: black;
		z-index: 101;
		-moz-opacity: 0.7;
		opacity: .70;
		filter: alpha(opacity = 70);
	}
-->
</style>
<div id="bg"></div>
<div id="alertWindow">
	<div class="headBar">提示</div>
	<div class="alertContent"></div>
	<div class="button">
		<button>确定</button>
	</div>
</div>

<div id="loadingWindow">
	<div class="headBar">上传中...</div>
	<div class="alertContent"><img alt="" src="<c:url value="/site/images/loading.gif" />"></div>
</div>