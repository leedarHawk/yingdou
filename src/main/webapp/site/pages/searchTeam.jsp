<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta name="format-detection" content="telephone=no" />
<title></title>
<link rel="stylesheet" href="<c:url value="/site/css/style.css" />" />
<script type="text/javascript" src="<c:url value="/site/js/jquery.js" />"></script>
<script type="text/javascript">
	var PageUtil = {
			init : function() {
				var width = $(window).width() - 114;
				$('input[name=team]').width(width);
				$('div.main2').addClass("white");
				$('input[name=team]').val('');
			},
			search : function() {
				var _this = this;
				var team = $.trim($('input[name=team]').val());
				if(team.length == 0) {
					return;
				}
				$.ajax({
					url : '<c:url value="/site/team/search" />',
					data : {name:team},
					success : function(res) {
						if(res.length == 0) {
							var div = $('div.noteam').clone();
							$('div.main2').empty().append(div).addClass("white");
							div.show();
						}else {
							var domain = '<c:out value="${domain}" />';
							$('div.main2').empty();
							var team;
							var dl;
							for(var p in res) {
								team = res[p];
								dl = $('dl.qiud_dl').clone();
								$('strong.teamName',dl).text(team.name);
								$('span.creator',dl).parent().html($('span.creator',dl).html() + team.creator.username);
								$('span.location',dl).parent().html($('span.location',dl).html() + team.location);
								$('span.members',dl).parent().html($('span.members',dl).html() + team.member.length);
								$('span.slogan',dl).parent().html($('span.slogan',dl).html() + (team.slogan.length == 0 ? '无' : team.slogan));
								$('span.description',dl).parent().html($('span.description',dl).html() + (team.description.length == 0 ? '无' : team.description));
								$('div.main2').append(dl).removeClass('white');
								(function(id){
									dl.fadeIn().click(function(){
										_this.jump(id);
									});
								})(team.id);
								$('img',dl).prop('src',domain + team.pic);
							}
							$('div.main2 dl:first').css({
								top:0
							});
						}
					}
				});
			},
			jump : function(teamId){
				location.href = '<c:url value="/site/team/detail/" />' + teamId;
			}
	};
</script>
<style type="text/css">
	div.search {
		height:50px;
		background:#f8f8f8;
	    border-bottom: 1px solid #dedede;
	    padding:2px;
	}
	div.search input {
		height:40px;
		border:1px solid #c0c0c0;
		text-align:center;
		line-height:100%;
		margin:0px 2px;
		
	}
	a.searchBtn {
		width:50px;
		height:50px;
		margin-left:2px;
	}
	a.returnBtn {
		width:50px;
		height:50px;
	}
	a.returnBtn img {
		width:14px;
		margin:0px 2px;
	}
	dl.hidden {
		display:none;
	}
	.white {
		background:#fff;
	}
	div.noteam {
		position:absolute;
		left:0px;
		width:100%;
		text-align:center;
		color:#c0c0c0;
		font-style:italic;
		display:none;
	}
</style>
</head>
<body>
	<div class="search">
		<a class="returnBtn" href="javascript:history.go(-1);void 0;"><img src="<c:url value="/site/images/jt_fh.png" />">返回</a>
		<input type="text" name="team" placeholder="查询球队" onblur="PageUtil.search()" />
		<a class="searchBtn" href="javascript:PageUtil.search();void 0;"><img alt="" src="<c:url value="/site/images/search.png" />"></a>
	</div>
	<div class="noteam">暂无此球队</div>
	<dl class="qiud_dl hidden">
	<dt><img class="teamPic" src=""></dt>
	<dd>
	<strong class="teamName"></strong>
	<ul>
	<li><span class="creator">发起人：</span></li>
	<li><span class="location">活动地点：</span></li>
	<li><span class="members">成员数量：</span></li>
	<li><span class="slogan">球队公告：</span></li>
	<li><span class="description">球队简介：</span></li>
	</ul>
	</dd>
	</dl>
	<div class="main2" style="padding-top:0px;">
	</div>
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
<script type="text/javascript">
	PageUtil.init();
</script>