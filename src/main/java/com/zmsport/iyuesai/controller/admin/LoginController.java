package com.zmsport.iyuesai.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zmsport.iyuesai.mapper.Admin;
import com.zmsport.iyuesai.service.AdminService;
import com.zmsport.iyuesai.util.EncryptUtil;

/**
 * 后台登录
 * @author bilei
 *
 */
@Controller
@RequestMapping("/admin")
public class LoginController {
	/**
	 * logger
	 */
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private AdminService service;
	
	/**
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping("/")
	public String toLogin() {
		return "/admin/login";
	}
	
	/*
	 * 跳转到主页
	 */
	@RequestMapping("/main")
	public String toMain(HttpServletRequest session) {
		session.setAttribute("talk", "shit!!!");
		return "/admin/pages/index";
	}
	
	/**
	 * 异步登录验证
	 * @param username
	 * @param password
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/login",produces={MediaType.APPLICATION_JSON_VALUE})
	public boolean login(HttpSession session,@RequestParam String username,@RequestParam String password) {
		boolean result = false;
		password = EncryptUtil.encryptMD5(password);
		Admin admin = service.findAdminByName(username);
		if(admin != null && admin.getPassword().equals(password)) {
			session.setAttribute("admin", admin);
			result = true;
			log.info("管理员{}登录",admin.getUsername());
		}
		return result;
	}
	
	/**
	 * 退出
	 * @param session
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		Admin admin = (Admin)session.getAttribute("admin");
		session.removeAttribute("admin");
		log.info("管理员{}退出",admin.getUsername());
		return "redirect:/admin";
	}
}
