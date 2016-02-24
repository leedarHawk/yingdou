package com.zmsport.iyuesai.service;

import java.util.List;

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
	
	/**
	 * 分页获取管理员列表
	 * @param start
	 * @param end
	 * @return
	 */
	public List<Admin> getAdmins(int page, int pageSize);
	
	/**
	 * 获取管理员总数
	 * @return
	 */
	public int getTotalNum();
	
	/**
	 * 插入
	 * @param admin
	 */
	public void insert(Admin admin);
	
	/**
	 * 修改
	 * @param admin
	 */
	public void update(Admin admin);
	
	/**
	 * 查找管理员
	 * @param id
	 * @return
	 */
	public Admin findAdminById(long id);
	
	/**
	 * 删除管理员
	 * @param ids
	 */
	public void delete(String ids);

	void changeStatus(Admin admin);
}
