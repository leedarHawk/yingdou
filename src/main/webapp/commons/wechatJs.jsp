<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
var jsApiList = ['chooseWXPay','chooseImage','uploadImage','downloadImage','previewImage'];
//微信js api
wx.config({
    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: '<c:out value="${jsConfig.appId}" />', // 必填，公众号的唯一标识
    timestamp: '<c:out value="${jsConfig.timestamp}" />', // 必填，生成签名的时间戳
    nonceStr: '<c:out value="${jsConfig.nonceStr}" />', // 必填，生成签名的随机串
    signature: '<c:out value="${jsConfig.signature}" />',// 必填，签名，见附录1
    jsApiList: jsApiList // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});
wx.ready(function() {
	wx.checkJsApi({
	    jsApiList:jsApiList, // 需要检测的JS接口列表，所有JS接口列表见附录2,
	    success: function(res) {
	    }
	});
});
</script>