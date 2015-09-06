package com.zmsport.iyuesai.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/**
 * 后台管理权限拦截器
 * @author bilei
 *
 */
public class AdminAuthorityInterceptor extends HandlerInterceptorAdapter {

	/**
	 * 预处理
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		String url = request.getRequestURL().toString();
		//判断用户是否已经登录
		if(request.getSession().getAttribute("admin") != null) {
			//处理登录页面默认跳转到主页面
			if(url.endsWith("/admin/") || url.endsWith("/admin")) {
				request.getRequestDispatcher("/admin/main").forward(request, response);
				return false;
			}
			return true;
		}else {
			//如果是跳转到登录页面就继续执行
			if(url.endsWith("/admin/") || url.endsWith("/admin")) {
				return true;
			}else if(url.endsWith("/admin/login")) {
				return true;
			}else {
				response.sendRedirect(request.getContextPath() + "/admin");
				return false;
			}
		}
	}
}
