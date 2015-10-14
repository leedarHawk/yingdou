package com.zmsport.iyuesai.controller.site;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

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
	public String wechatLoginConfirm(HttpServletRequest request) {
//		HttpServletRequest request = null;
		System.out.println(" wechatLoginConfirm firstUrl is ----> " + request.getSession().getAttribute("firstUrl").toString());

		String firstUrl = null;
		if (request.getSession().getAttribute("firstUrl")!=null) {
			firstUrl = request.getSession().getAttribute("firstUrl").toString();
			System.out.println("firstUrl is ----> " + firstUrl);
		}

		if (firstUrl!=null){
			request.getSession().removeAttribute("firstUrl");
			return "redirect:" + firstUrl;
		}
		return "redirect:/site/game/list";

	}
}
