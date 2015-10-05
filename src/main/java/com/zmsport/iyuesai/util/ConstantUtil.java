package com.zmsport.iyuesai.util;

/**
 * 常量类
 * @author bilei
 *
 */
public final class ConstantUtil {

	/**
	 * 微信公众号应用id
	 */
	public static final String APP_ID = "wx1f6fbe657881aae5";
	
	/**
	 * 商户号id
	 */
	public static final String MCH_ID = "1259331201";
	
	/**
	 * 商户支付密钥
	 */
	public static final String MCH_KEY = "zW3473xhqJoesYl47Ijcwb32O6B7lzaT";
	
	/**
	 * 微信公众号应用密钥
	 */
	public static final String APP_SECRET = "27a4971265b834738ceaf8c209cb006c";
	
	/**
	 * 微信公众号access_token获取url
	 */
	public static final String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + APP_ID + "&secret=" + APP_SECRET;
	
	/**
	 * 更新access_token间隔(豪秒)
	 */
	public static final int REFRESH_INTERVAL = 7000 * 1000;
	
	/**
	 * 微信access_token过期时间
	 */
	public static long EXPIRED_TIME = 0;
	
	/**
	 * access_token
	 */
	public static String ACCESS_TOKEN;
	
	/**
	 * 微信公众jsapi_ticket获取url
	 */
	public static final String JSAPI_TICKET_URL = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi";
	
	/**
	 * jsapi_ticket
	 */
	public static String JSAPI_TICKET;
	
	/**
	 * 微信授权登录url
	 */
	public static final String WECHAT_AUTH_URL = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + APP_ID
										+ "&redirect_uri=%s&response_type=code&scope=snsapi_userinfo"
										+ "&state=STATE#wechat_redirect";
	
	/**
	 * 微信授权登录获取access_token url
	 */
	public static final String WECHAT_ACCESS_TOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + APP_ID
														+ "&secret=" + APP_SECRET
														+ "&code=%s&grant_type=authorization_code";
	
	/**
	 * 微信获取用户信息
	 */
	public static final String WECHAT_GET_USER_INFO_URL = "https://api.weixin.qq.com/sns/userinfo?access_token=%s&openid=%s&lang=zh_CN";
	
	/**
	 * 微信支付统一支付接口
	 */
	public static final String WECHAT_PAY_UNIFIED_ORDER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
	
	/**
	 * 下载微信上传的多媒体文件url
	 */
	public static final String WECHAT_MEDIA_DOWNLOAD_URL = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=%s&media_id=%s";
	
	/**
	 * 球队新老成员时间线
	 * 1个月
	 */
	public static final long TEAM_USERS_TIME_LINE = 1 * 30 * 24 * 60 * 60 * 1000;
}
