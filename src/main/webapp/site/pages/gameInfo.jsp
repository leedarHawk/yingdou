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
<script type="text/javascript" src="<c:url value="/site/js/timeAgo.js" />"></script>
<script type="text/javascript">
	$(function(){
		DayUtil.getDay($("p.timeAgo"));
		PageUtil.init();
	});
	var PageUtil = {
			text : null,
			shortText : null,
			len : 100,
			init : function() {
				this.text = $.trim($('.ph_jshart').text());
				var len = this.text.length; 
				$('.ph_jshhide').hide();
				if(len > this.len) {
					this.shortText = this.text.substring(0,this.len) + "..."
					$('.ph_jshart').text(this.shortText);
				}else {
					$('.ph_jshmore').hide();
				}
			},
			showAll : function() {
				$('.ph_jshart').text(this.text);
				$('.ph_jshmore').hide();
				$('.ph_jshhide').show();
			},
			hide : function() {
				$('.ph_jshart').text(this.shortText);
				$('.ph_jshmore').show();
				$('.ph_jshhide').hide();
			}
	};
</script>
<style type="text/css">
	span.notice {
		background:#c0c0c0;
		display:inline-block;
		width:45%;
		color:#fff;
		height: 43px;
	    line-height: 43px;
	    font-size: 16px;
	    text-align: center;
	    margin: 0 auto;
	    border-radius: 5px;
	}
</style>
</head>

<body>
<div class="header"><span><a href="<c:url value="/site/game/list" />"><img src="<c:url value="/site/images/jt_fh.png" />">返回</a></span></div>
<div class="main3">

	<script type="text/javascript" src="<c:url value="/site/js/qh.js" />" ></script>
	<!--切换内容开始0-->
	<div id="TabbedPanels1" class="hangy_qh1">
		<ul class="TabbedPanelsTabGroup">        
			<li class="TabbedPanelsTab" tabindex="0">赛事简介</li>
			<li class="TabbedPanelsTab" tabindex="0">赛事公告</li>
			<li class="TabbedPanelsTab" tabindex="0">排行榜</li>
		</ul>
		<div class="TabbedPanelsContentGroup">
		<div class="TabbedPanelsContent">
		    <div class="huibg">
				<div class="ph_ggtp"><img src="<c:url value="${game.pic}" />"></div>
				<dl class="ph_jsh">
				<dt><c:out value="${game.name }" /></dt>
				<dd>
				<p>比赛时间：<c:out value="${game.duration }" /></p>
				<p>比赛地点：<c:out value="${game.location }" /></p>
				<p>报名费：¥<c:out value="${game.fee }" /></p>
				<c:choose>
					<c:when test="${game.teamNum > 0 && fn:length(teamList) < game.teamNum}">
						<c:if test="${isCreator == true }">
							<c:choose>
								<c:when test="${status == -1 }">
									<span><a href="<c:url value="/site/game/candidate/${game.id}" />">我要报名</a></span>
								</c:when>
								<c:when test="${status == 0 }">
									<span class="notice">审核中</span>
								</c:when>
								<c:when test="${status == 1 }">
									<span><a href="<c:url value="/site/pages/pay.html?gameName=" /><c:out value="${game.name }" />&gameId=<c:out value="${game.id }" />&fee=<c:out value="${game.fee }" />">去支付</a></span>
								</c:when>
								<c:when test="${status == 2 }">
									<span class="notice">已报名</span>
								</c:when>
								<c:when test="${status == 3 }">
									<span class="notice">审核不通过</span>
								</c:when>
							</c:choose>
						</c:if>
						<c:if test="${isCreator == false }">
							<span class="notice">您还没有球队</span>
						</c:if>
					</c:when>
					<c:when test="${game.teamNum > 0 && fn:length(teamList) == game.teamNum}">
							<span class="notice">名额已满</span>
					</c:when>
					<c:otherwise>
						<c:if test="${isCreator == true }">
							<c:choose>
								<c:when test="${status == -1 }">
									<span><a href="<c:url value="/site/game/candidate/${game.id}" />">我要报名</a></span>
								</c:when>
								<c:when test="${status == 0 }">
									<span class="notice">审核中</span>
								</c:when>
								<c:when test="${status == 1 }">
									<span><a href="<c:url value="/site/pages/pay.html?gameName=" /><c:out value="${game.name }" />&gameId=<c:out value="${game.id }" />&fee=<c:out value="${game.fee }" />">去支付</a></span>
								</c:when>
								<c:when test="${status == 2 }">
									<span class="notice">已报名</span>
								</c:when>
								<c:when test="${status == 3 }">
									<span class="notice">审核不通过</span>
								</c:when>
							</c:choose>
						</c:if>
						<c:if test="${isCreator == false }">
							<span class="notice">您还没有球队</span>
						</c:if>
					</c:otherwise>
				</c:choose>
				</dd>
				</dl>
				
				<div class="ph_jshdl02">
				<p class="ph_jshtit"><c:if test="${fn:length(teamList) > 0 }"><a href="">全部</a></c:if>已报名/名额（${fn:length(teamList)}/<c:if test="${game.teamNum == 0 }">不限）</p></c:if><c:if test="${game.teamNum != 0 }"><c:out value="${game.teamNum }" />）</p></c:if>
				<ul class="ph_txul">
				<c:forEach items="${teamList }" var="team" varStatus="counter">
					<c:if test="${counter.count < 9 }">
						<li><a href=""><img src="<c:url value="${team.pic }" />"><c:out value="${team.name }" /></a></li>
					</c:if>
				</c:forEach>
				</ul>
				</div>
				
				<div class="ph_jshdl02">
				<p class="ph_jshtit">赛事简介</p>
				<div class="ph_jshart">
					<c:out value="${game.description }" />
				</div>
				<p class="ph_jshmore"><a href="javascript:PageUtil.showAll();void 0;">查看全部</a></p>
				<p class="ph_jshhide"><a href="javascript:PageUtil.hide();void 0;">收起</a></p>
				</div>
			</div>
		</div>
		

		<div class="TabbedPanelsContent">
				<div class="ph_ggtp">
				<a href=""><img src="<c:url value="${game.pic}" />">
				<span><c:url value="${game.name}" />&nbsp;&nbsp;&nbsp;<c:url value="${game.duration}" /></span>
				</a>
				</div>
				<c:forEach items="${gameAnnouncementList}" var="gameAnnouncement">
					<div class="ph_ggart">
						<c:out value="${gameAnnouncement.content}" />
						<p class="ph_huidate timeAgo"><c:out value="${gameAnnouncement.time}" /></p>
					</div>
				</c:forEach>
				<div style="height:10px;"></div>
		</div>
		
		
		<div class="TabbedPanelsContent">
		<!--排行-->
		<div id="TabbedPanels2" class="hangy_qh2">
		<ul class="TabbedPanelsTabGroup">        
			<li class="TabbedPanelsTab" tabindex="0">球队排行榜</li>
			<li class="TabbedPanelsTab" tabindex="0">球员排行榜</li>
		</ul>
		<div class="TabbedPanelsContentGroup">
		<!--球队排行-->
		<div class="TabbedPanelsContent">
			<c:forEach items="${teamScoreList}" var="score" varStatus="status">
				<dl class="qiud_paim">
					<dt><span>${status.index + 1 }</span><a href="<c:url value="/site/team/detail/${score.team.id }" />"><img src="<c:url value="${score.team.pic }" />"></a></dt>
						<dd>
							<ul>
								<li><span>球队：</span>${score.team.name }</li>
								<li><span>比赛场次：</span>${score.round}场</li>
								<li><span>战绩：</span>${score.win}胜${score.lose}负</li>
								<li><span>胜率：</span><c:if test="${score.round > 0 }"><fmt:formatNumber value="${score.win/score.round}" type="percent" /></c:if></li>
							</ul>
						</dd>
				</dl>
			</c:forEach>
		</div>
		<!--球员排行-->
		<div class="TabbedPanelsContent">
			<c:forEach items="${userScoreList }" var="score" varStatus="status">
				<dl class="qiud_paim">
					<dt><span>${status.index+1 }</span><a href="<c:url value="/site/user/info/${score.user.id }" />"><img src="<c:url value="${score.user.headPic }" />"></a></dt>
					<dd>
						<ul>
							<li><span>昵称：</span>${score.user.username }</li>
							<li><span>所属球队：</span>${score.teamName }</li>
							<li><span>位置：</span>${score.user.position }&nbsp;</li>
							<li><span>得分：</span>${score.score }分</li>
						</ul>
					</dd>
				</dl>
			</c:forEach>
		</div>

		<div class="TabbedPanelsContent">
			
			
		</div>
		</div>
	<script type="text/javascript">
	var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels2");
	</script>
	</div>		
		</div>		
		
		</div>
	<script type="text/javascript">
	var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
	</script>
	</div>
	<!--切换内容 结束0-->	   
</div>
<div style="height:50px;"></div>
<div class="footer">
<ul>
<li class="nav01"><a class="hover" href="<c:url value="/site/game/list" />">比赛</a></li>
<li class="nav02"><a href="<c:url value="/site/challenge/list" />">约战</a></li>
<li class="nav03"><a href="<c:url value="/site/team/list" />">球队</a></li>
<li class="nav04"><a href="<c:url value="/site/user/path/me" />">我</a></li>
</ul>
</div>

</body>
</html>
