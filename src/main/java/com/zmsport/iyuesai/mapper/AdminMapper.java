package com.zmsport.iyuesai.mapper;
/**
 * 管理员mapper
 * @author bilei
 *
 */
public interface AdminMapper {
	/**
	 * 根据用户查询
	 * @param username
	 * @return
	 */
	public Admin findAdminByName(String username);
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
}
