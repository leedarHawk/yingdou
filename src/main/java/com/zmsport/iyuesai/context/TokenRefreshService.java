package com.zmsport.iyuesai.context;

import java.util.HashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.client.RestTemplate;
import com.zmsport.iyuesai.util.ConstantUtil;

/**
 * 更新access_token和jsapi_ticket服务
 * @author bilei
 *
 */
@Configuration
@EnableScheduling
public class TokenRefreshService {
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private RestTemplate restTemplate;
	
	/**
	 * 更新token
	 * 微信服务器每7200秒更新一次access_token和jsapi_ticket
	 * 服务器需提前更新access_token，执行间隔为7000秒
	 */
	@Scheduled(fixedDelay=ConstantUtil.REFRESH_INTERVAL)
	public void refresh() {
		log.info(Thread.currentThread().getName() + " 开始更新access_token和jsapi_ticket");
		HashMap entity = restTemplate.getForObject(ConstantUtil.ACCESS_TOKEN_URL, HashMap.class);
		if(entity != null  && entity.containsKey("access_token")) {
			ConstantUtil.ACCESS_TOKEN = entity.get("access_token").toString();
			
		}
		log.info(String.format("获取微信服务器access_token: %s", ConstantUtil.ACCESS_TOKEN));
		//获取jsapi_ticket
		entity = restTemplate.getForObject(String.format(ConstantUtil.JSAPI_TICKET_URL, ConstantUtil.ACCESS_TOKEN), HashMap.class);
		if(entity != null  && entity.containsKey("ticket")) {
			ConstantUtil.JSAPI_TICKET = entity.get("ticket").toString();
			
		}
		log.info(String.format("获取微信服务器jsapi_tiket: %s", ConstantUtil.JSAPI_TICKET));
	}
}
