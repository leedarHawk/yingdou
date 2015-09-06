package com.zmsport.iyuesai.service;

import com.zmsport.iyuesai.mapper.Admin;

/**
 * 管理员相关服务
 * @author bilei
 *
 */
public interface AdminService {
	/**
	 * 查询管理员
	 * @param username
	 * @return
	 */
	public Admin findAdminByName(String username);
}
