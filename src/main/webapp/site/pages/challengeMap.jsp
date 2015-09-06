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
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=yukxov4aBQUGowvyGuS5lD5t"></script>
<script type="text/javascript" src="<c:url value="/site/js/jquery.js" />" ></script>
<script src="<c:url value="/site/js/jquery.hoverIntent.minified.js" />" type="text/javascript"></script>
</head>

<body>
<div class="header"><span><a href=""><img src="<c:url value="/site/images/jt_fh.png" />">返回</a></span>约战<font><a href="">发布约战</a></font></div>
<div class="main3">

	<script type="text/javascript" src="<c:url value="/site/js/qh.js" />" ></script>
	<!--切换内容开始0-->
	<div id="TabbedPanels2" class="hangy_qh5">
		<ul class="TabbedPanelsTabGroup">        
			<li class="TabbedPanelsTab" tabindex="0">比赛</li>
			<li class="TabbedPanelsTab" tabindex="0">球局</li>
		</ul>
		<div class="TabbedPanelsContentGroup">
		<!--比赛-->
		<div class="TabbedPanelsContent">
<span class="dingw2"><a class="telmenu"><img src="images/dingw.png"></a></span>
<script type="text/javascript" language="javascript">
 $(function(){
        var config1={
        over:function(){
             var obj=$(this);
           obj.find('.a_1').addClass('hover');
            obj.find('div').slideDown('slow');
        },
        out:function(){
              var obj=$(this);
            obj.find('.a_1').removeClass('hover');
            obj.find('div').slideUp('slow');
        },
        timeout:0
        };
		var config2={
        over:function(){
             var obj=$(this);
           obj.find('.a_2').addClass('hover');
            obj.find('div').slideDown('slow');
        },
        out:function(){
              var obj=$(this);
            obj.find('.a_2').removeClass('hover');
            obj.find('div').slideUp('slow');
        },
        timeout:0
        };
 
        $('.change1').hoverIntent(config1);
		 $('.change2').hoverIntent(config2);
		
   });
</script>
<script type="text/javascript" src="js/kuoer.js" ></script>
<div id="nav">
<div class="yuez_con" style=" position:absolute;width:95%;z-index:9999;">
    <dl class="hybs_dl">
	<dt><img src="images/in_tp2.jpg">樱木花道队</dt>
	<dd>
	<strong>VS</strong>
	<p>等待应战</p>
	</dd>
	<dt><img src="images/tx_no.png"><input class="lv_btn" id="btnshow" onClick="showdiv();" name="" type="button" value="应战" ></dt>
	</dl>
	<ul class="hybs_ul">
	<li>时间：2015年9月12日 18:00</li>
	<li>裁判：待定</li>
	<li>地点：北京体育大学</li>
	<li>费用：¥400(AA)</li>
	</ul>
</div>
</div>
<div class="map"><img src="images/map.jpg"></div>
		</div>

		<!--球局-->
		<div class="TabbedPanelsContent">
<span class="dingw2"><a href=""><img src="images/yuez_ico.png"></a></span>
<div class="map"><img src="images/map.jpg"></div>
		</div>

		</div>
	<script type="text/javascript">
	var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels2");
	</script>
	</div>
	<!--切换内容 结束0-->	   
</div>


</body>
</html>
