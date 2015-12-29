<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="../../commons/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0, maximum-scale=1,user-scalable=yes" />
	<meta name="format-detection" content="telephone=no" />
	<div id='wx_pic' style='margin:0 auto;display:none;'>
		<img src='/site/images/yingdoulogo.jpg' />
	</div>
	<title>快来加入我的超级战队吧 ！</title>
	<link rel="stylesheet" href="<c:url value="/site/css/style.css" />" />
	<script type="text/javascript" src="<c:url value="/site/js/jquery.js" />"></script>
	<%@ include file="../../commons/wechatJs.jsp"%>
	<script type="text/javascript">
		var PageUtil = {
			domain : '<c:out value="${domain}" />',
			files : [],
			media : [],
			init : function() {
				$('.qd_sctp li').each(function(){
					if($(this).prop('id') == 'add') {
						return;
					}
					$(this).height($('img',this).width());
				});
			},
			chooseImage : function() {
				this.media.length = 0;
				if('<c:out value="${ids}" />'.indexOf('${user.id}') < 0) {
					AlertUtil.show("Oops~您不是球队成员喔");
					return;
				}
				var _this = this;
				wx.chooseImage({
					sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
					sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
					success: function (res) {
						var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
						_this.upload(localIds);
					}
				});
			},
			/**
			 * 同步上传
			 */
			upload : function(ids) {
				LoadingUtil.show();
				var _this = this;
				var mediaId = ids.pop();
				wx.uploadImage({
					localId: mediaId, // 需要上传的图片的本地ID，由chooseImage接口获得
					isShowProgressTips: 0, // 默认为1，显示进度提示
					success: function (res) {
						var serverId = res.serverId; // 返回图片的服务器端ID
						_this.media.push(serverId);
						if(ids.length > 0) {
							_this.upload(ids);
						}else {
							_this.saveToServer();
						}
					}
				});
			},
			saveToServer : function() {
				var _this = this;
				var dir = "<c:url value="${team.pic}" />".split("/logo")[0].split('team/')[1];
				if (!dir){
					dir = (new Date()).valueOf();
				}
				var medias = this.media.join(",");
				$.ajax({
					url : '<c:url value="/site/wechat/download" />',
					data : {dir:dir,medias:medias,creatorId:<c:out value="${team.creatorId}" />,teamId:<c:out value="${team.id}" />},
					success : function(data) {
						if(data.length == 0) {
							return;
						}
						var li,album,picUrl;
						for(var i = 0; i < data.length; i++) {
							album = data[i];
							picUrl = _this.domain + album.pic;
							(function(album,picUrl){
								li = $('<li style="overflow:hidden;margin-bottom:2px;position:relative;"><a><img src=""></a></li>').prop("id","li_" + album.id);
								$('#add').before(li);
								$('img',li).prop('src', picUrl);
								$('a',li).prop('id',album.id);
								li.height(li.width());
								_this.files.push(picUrl);
								$('a',li).bind('click',function(){
									_this.preview(picUrl);
								});
								<c:if test="${team.creatorId == user.id }">
								li.append($('<div style="position:absolute;bottom:0px;left:0px;width:100%;height:26px;line-height:26px;opacity:0.7;background:#fff;color:#f00;text-align:center;" onclick=PageUtil.delPic(' + album.id + ',"' + picUrl + '")>删除</div>'));
								</c:if>
							})(album,picUrl)
						}
						LoadingUtil.hide();
					}
				});
			},
			preview : function(url) {
				var _this = this;
				wx.previewImage({
					current: url, // 当前显示图片的http链接
					urls: _this.files // 需要预览的图片http链接列表
				});
			},
			like : function() {
				var _this = this;
				$('a.likes').prop('href','');
				$.ajax({
					url : '<c:url value="/site/team/like/${team.id}" />',
					type : 'post',
					success : function(res) {
						$('p a.likes').html('<img src="<c:url value="/site/images/xin.png" />" width="18">' + res);
						$('a.likes').prop('href','javascript:PageUtil.like();void 0;');
					}
				});
			},
			dismiss : function(url) {
				if(confirm("确定解散球队?")) {
					location.href = url;
				}
			},
			delPic : function(id,pic) {
				var _this = this;
				if(confirm("确定删除?")) {
					$.ajax({
						url : "<c:url value='/site/team/delPic'/>",
						data : {id:id,pic:pic},
						success : function(res) {
							if(res == 'ok') {
								$('#li_' + id).remove();
								for(var i in _this.files) {
									if(_this.files[i].indexOf(pic) > -1) {
										_this.files.splice(i,1);
										break;
									}
								}
							}

						}
					});
				}
			}
		}
	</script>
	<style type="text/css">
		#add a {
			display:inline-block;
			width:100%;
			height:100%;
		}
		p a img {
			margin-right:2px;
		}
	</style>
</head>

<body>
<%@ include file="../../commons/alert.jsp"%>
<div class="header"><span><a href=" <c:url value="/site/team/list" /> "><img src="<c:url value="/site/images/jt_fh.png" />">返回</a></span></div>
<div class="main4">
	<script type="text/javascript" src="<c:url value="/site/js/qh.js" />" ></script>
	<!--切换内容开始0-->
	<div id="TabbedPanels1" class="hangy_qh1">
		<ul class="TabbedPanelsTabGroup">
			<li class="TabbedPanelsTab" tabindex="0">球队主页</li>
			<li class="TabbedPanelsTab" tabindex="0">约战记录</li>
			<li class="TabbedPanelsTab" tabindex="0">球队相册</li>
		</ul>
		<div class="TabbedPanelsContentGroup">
			<div class="TabbedPanelsContent">
				<div class="huibg">
					<dl class="hy_toptx">
						<dt><img src="<c:url value="${team.pic}" />"></dt>
					</dl>
					<dl class="ph_jsh">
						<dt><c:out value="${team.name}" /></dt>
						<dd>
							<p>活动地点：<c:out value="${team.location}" /></p>
							<p>约战次数：${fn:length(challengeList)}次</p>
							<p><a class="likes" href="javascript:PageUtil.like();void 0;"><img src="<c:url value="/site/images/xin.png" />" width="18"><c:out value="${team.likes }" /></a></p>
							<c:if test="${team.members == -1 }">
								<c:choose>
									<c:when test="${status==-1 && team.creatorId != user.id}">
										<span><a href="<c:url value="/site/team/join/${team.id }" />">我要加入</a></span>
									</c:when>
									<c:when test="${status==0}">
										<b class="hui_btn">正在审核</b>
									</c:when>
									<c:when test="${status==1}">
										<b class="hui_btn">已加入</b>
									</c:when>
									<c:when test="${status==2}">
										<b class="hui_btn">已拒绝</b>
									</c:when>
									<c:when test="${team.creatorId==user.id}">
										<b class="hui_btn">已加入</b>
									</c:when>
								</c:choose>
							</c:if>
							<c:if test="${user.id == team.creatorId }">
								<span><a href="<c:url value="/site/team/toUpdate/${team.id }" />" style="color:#fff;">修改</a></span>
								<span><a href="javascript:PageUtil.dismiss('<c:url value="/site/team/delete?ids=${team.id }" />');void 0;" style="color:#fff;">解散</a></span>
							</c:if>

							<c:if test="${team.members > -1 }">
								<c:if test="${team.members == memberNum }">
									<b class="hui_btn">名额已满</b>
								</c:if>
								<c:if test="${team.members > memberNum }">
									<c:choose>
										<c:when test="${status==-1 && team.creatorId != user.id}">
											<span><a href="<c:url value="/site/team/join/${team.id }" />">我要加入</a></span>
										</c:when>
										<c:when test="${status==0}">
											<b class="hui_btn">正在审核</b>
										</c:when>
										<c:when test="${status==1}">
											<b class="hui_btn">已加入</b>
										</c:when>
										<c:when test="${status==2}">
											<b class="hui_btn">已拒绝</b>
										</c:when>
										<c:when test="${team.creatorId==user.id}">
											<b class="hui_btn">已加入</b>
										</c:when>
									</c:choose>
								</c:if>
							</c:if>
						</dd>
					</dl>

					<div class="ph_jshdl02">
						<p class="ph_jshtit">球队公告</p>
						<div class="ph_jshart"><c:out value="${team.slogan}" /></div>
					</div>

					<div class="ph_jshdl02">
						<p class="ph_jshtit">球队简介</p>
						<div class="ph_jshart"><c:out value="${team.description}" /></div>
					</div>

					<div class="ph_jshdl02">
						<p class="ph_jshtit"><c:if test="${team.creatorId == user.id }"><a href="<c:url value="/site/team/allMembers?teamId=${team.id }" />">管理成员</a></c:if>球队成员(${fn:length(list)})</p>
						<ul class="ph_txul">
							<c:forEach items="${list }" var="user" varStatus="status">
								<c:if test="${status.count < 100 }">
									<li><a href="<c:url value="/site/user/info/${user.id}" />"><img src="<c:url value="${user.headPic }" />">${user.username}</a></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>

				</div>
			</div>


			<div class="TabbedPanelsContent">
				<c:forEach items="${challengeList }" var="challenge">
					<div class="yuez_con">
						<dl class="hybs_dl">
							<dt>
								<img src="<c:url value="${challenge.host.pic }" />"><c:out value="${challenge.host.name }" />
							</dt>
							<dd>
								<c:if test="${empty challenge.guest }">
									<strong>VS</strong>
									<p>等待应战</p>
								</c:if>
								<c:if test="${not empty challenge.guest }">
									<c:if test="${challenge.status==1 }">
										<strong>VS</strong>
										<p>等待上传比分</p>
									</c:if>
									<c:if test="${challenge.status==2 }">
										<strong>${challenge.score }</strong>
										<p>比赛完成</p>
									</c:if>
								</c:if>
							</dd>
							<dt>
								<c:if test="${empty challenge.guest }">
							<div style="position:relative;"><c:if test="${challenge.creatorId == user.id }"><a href="<c:url value="/site/challenge/acceptInfoList/${challenge.id }" />"><div class="circle">${challenge.count }</div></a></c:if><img src="<c:url value="/site/images/tx_no.png" />"></div>
							
							</c:if>
							<c:if test="${not empty challenge.guest }">
								<img src="<c:url value="${challenge.guest.pic }" />"><c:out value="${challenge.guest.name }" />
							</c:if>
							</dt>
						</dl>
						<ul class="hybs_ul">
							<li>时间：<fmt:formatDate value="${challenge.time}" type="both" pattern="yyyy年MM月dd日 HH:mm"/></li>
							<li>裁判：<c:if test="${challenge.needReferee == 1 }">待定</c:if><c:if test="${challenge.needReferee == 0 }">无</c:if></li>
							<li>地点：<c:out value="${challenge.location }" /></li>
							<li>费用：<c:if test="${challenge.feeType == 0 }">免费</c:if><c:if test="${challenge.feeType == 1 }">¥<c:out value="${challenge.fee }" />(AA)</c:if></li>
						</ul>
					</div>
				</c:forEach>

			</div>


			<div class="TabbedPanelsContent">
				<%-- <dl class="hy_toptx">
				<dt><img src="<c:url value="${team.pic}" />"></dt>
				</dl>
				<dl class="ph_jsh">
				<dt>硬斗沈阳—3V3占地为王挑战赛</dt>
				<dd>
				<p>活动地点：沈阳体育中心</p>
				<p>约战次数：10次</p>
				<p><img src="images/xin.png" width="18">231</p>
				<span><a href="">我要加入</a></span>
				<!--<b class="hui_btn">等待批准</b>-->
				</dd>
				</dl> --%>

				<ul class="qd_sctp">
					<c:forEach items="${albumList}" var="album">
						<li style= "overflow:hidden;margin-bottom:2px;position:relative;" id="li_${album.id }">
							<a href="javascript:PageUtil.preview('<c:out value="${domain }" /><c:out value="${album.pic }" />');void 0;" id="<c:out value="${album.id }" />"><img src="<c:url value="${album.pic }" />"></a>
							<c:if test="${team.creatorId == user.id }">
								<div style="position:absolute;bottom:0px;left:0px;width:100%;height:30px;opacity:0.7;background:#fff;color:#f00;text-align:center;" onclick="PageUtil.delPic(<c:out value="${album.id }" />,'<c:out value="${album.pic }" />')">删除</div>
							</c:if>
						</li>
						<script type="text/javascript">
							PageUtil.files.push('<c:out value="${domain }" /><c:out value="${album.pic }" />');
						</script>
					</c:forEach>
					<li id="add"><a href="javascript:PageUtil.chooseImage();void 0;"><img src="<c:url value="/site/images/sc_tj.jpg" />"></a></li>
				</ul>
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
		<li class="nav01"><a href="<c:url value="/site/game/list" />">比赛</a></li>
		<li class="nav02"><a href="<c:url value="/site/challenge/list" />">约战</a></li>
		<li class="nav03"><a class="hover" href="<c:url value="/site/team/list" />">球队</a></li>
		<li class="nav04"><a href="<c:url value="/site/user/path/me" />">我</a></li>
	</ul>
</div>
</body>
</html>
<script type="text/javascript">
	<!--
	PageUtil.init();
	//-->
</script>
