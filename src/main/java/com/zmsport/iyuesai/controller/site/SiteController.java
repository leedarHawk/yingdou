package com.zmsport.iyuesai.controller.site;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 主站controller
 * @author bilei
 *
 */
@Controller
@RequestMapping("/site")
public class SiteController {
	
	/**
	 * logger
	 */
	private Logger log = LoggerFactory.getLogger(getClass());
	
	/**
	 * 获取赛事列表
	 * @return
	 */
	@RequestMapping(value="/wechatLoginConfirm", method=RequestMethod.GET)
	public String wechatLoginConfirm() {
		return "redirect:/site/game/list";
	}
}
