package com.zmsport.iyuesai.interceptor;

import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.zmsport.iyuesai.mapper.User;
import com.zmsport.iyuesai.service.UserService;
import com.zmsport.iyuesai.util.ConstantUtil;

/**
 * 微信权限拦截器
 * @author bilei
 *
 */
public class SiteAuthorityInterceptor extends HandlerInterceptorAdapter {

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private UserService service;
	
	@Autowired
	private MappingJackson2HttpMessageConverter converter;
	
	/**
	 * 预处理
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		//时间戳
		request.setAttribute("_time", System.currentTimeMillis());
		String userAgent = request.getHeader("User-Agent");
//		if(!userAgent.toLowerCase().contains("micromessenger")) {
//			//非微信浏览器直接跳转
//			log.info("非微信浏览器访问,浏览器信息:{}", userAgent);
//			//虚拟用户
//			User user = new User();
//			user.setId(0);
//			user.setUsername("未知用户");
//			user.setRegisterTime(new Timestamp(System.currentTimeMillis()));
//			request.getSession().setAttribute("user", user);
//			return true;
//		}
		//判断用户是否已经微信授权登录
		if(request.getSession().getAttribute("user") != null) {
			return true;
		}else {
			if(request.getRequestURI().contains("site/wechat/createOrder")) {
				//微信支付回调单独处理
				return true;
			}
			//获取要访问的请求路径，作为微信登录的回调路径
			StringBuffer requestUrl = request.getRequestURL();
			String domain = requestUrl.delete(requestUrl.length() - request.getRequestURI().length(), requestUrl.length()) + request.getServletContext().getContextPath();
			request.getServletContext().setAttribute("domain", domain);
			//第一步：用户已经同意授权，获取code
			if(request.getRequestURI().contains("wechatLoginConfirm") && request.getParameter("code") != null) {
				String url;
				//第二步：通过code换取网页授权access_token
				String code = request.getParameter("code");
				StringHttpMessageConverter converter = new StringHttpMessageConverter(Charset.forName("utf-8"));
				List<HttpMessageConverter<?>> converters = new ArrayList<HttpMessageConverter<?>>();
				converters.add(converter);
				restTemplate.setMessageConverters(converters);
				String result = restTemplate.getForObject(String.format(ConstantUtil.WECHAT_ACCESS_TOKEN_URL, code), String.class);
				JSONObject json = JSONObject.fromObject(result);
				String access_token = json.getString("access_token");
				String openid = json.getString("openid");
				//第三步 拉取用户信息
				result = restTemplate.getForObject(String.format(ConstantUtil.WECHAT_GET_USER_INFO_URL, access_token,openid), String.class);
				json = JSONObject.fromObject(result);
				Pattern emoji = Pattern.compile("[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\u2600-\u27ff]",
				         							Pattern.UNICODE_CASE | Pattern.CASE_INSENSITIVE) ;
				String nickName = json.getString("nickname");
				Matcher matcher = emoji.matcher(nickName);
				nickName = matcher.replaceAll("");
				String sex = json.getString("sex");
				String province = json.getString("province");
				String city = json.getString("city");
				String country = json.getString("country");
				String headimgurl = json.getString("headimgurl");
				User user = service.findUserByUid(openid);
				if(user != null) {
					//用户已经注册，仅需直接登录
					//检查用户头像是否改变，若是，则更新用户头像
					if(!headimgurl.equals(user.getHeadPic())) {
						user.setHeadPic(headimgurl);
					}
					//跳转到比赛列表
					//url = "/site/game/list";
					url = requestUrl.toString();

				}else {
					//用户未注册，跳转到设置页面
					user = new User();
					user.setCity(city);
					user.setProvince(province);
					user.setCountry(country);
					user.setUid(openid);
					user.setUsername(nickName);
					user.setSex(sex.equals("1") ? "男" : "女");
					user.setHeadPic(headimgurl);
					user.setRegisterTime(new Timestamp(System.currentTimeMillis()));
					service.insert(user);
					//跳转到用户设置
					//url = "/site/user/settings";
					url = requestUrl.toString();
				}
				request.getSession().setAttribute("user", user);
				response.sendRedirect(domain + url);
				return false;
			}
			String url = domain + "/site/wechatLoginConfirm";
			//跳转到微信登录授权页面
			response.sendRedirect(String.format(ConstantUtil.WECHAT_AUTH_URL, URLEncoder.encode(url, "UTF-8")));
			return false;
		}
	}
}
