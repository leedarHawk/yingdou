package com.zmsport.iyuesai.interceptor;

import java.util.HashMap;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.zmsport.iyuesai.service.UserService;
import com.zmsport.iyuesai.util.ConstantUtil;

/**
 * 微信js api配置拦截器
 * @author bilei
 *
 */
public class SiteWechatJsapiInterceptor extends HandlerInterceptorAdapter {

	private Logger log = LoggerFactory.getLogger(getClass());
	
	/**
	 * 预处理
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		//公众号的唯一标识
		HashMap<String,String> config = new HashMap<String,String>();
		config.put("appId", ConstantUtil.APP_ID);
		//生成签名的时间戳
		config.put("timestamp", String.valueOf(System.currentTimeMillis()));
		//生成签名的随机串
		config.put("nonceStr", UUID.randomUUID().toString().substring(0, 30));
		//签名
		StringBuilder sb = new StringBuilder();
		sb.append("jsapi_ticket=").append(ConstantUtil.JSAPI_TICKET).append("&").append("noncestr=")
		  .append(config.get("nonceStr")).append("&").append("timestamp=").append(config.get("timestamp"))
		  .append("&url=").append(request.getRequestURL());
		log.info("微信签名原始字符串:{}",sb.toString());
		config.put("signature", DigestUtils.sha1Hex(sb.toString()));
		request.setAttribute("jsConfig", config);
		return true;
	}
}
