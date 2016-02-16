package com.zmsport.iyuesai.mapper;

import java.util.List;

/**
 * 管理员mapper
 * @author bilei
 *
 */
public interface AdminMapper {
	/**
	 * 根据管理员名称查询
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
	public List<Admin> getAdmins(int start, int end);
	
	/**
	 * 获取管理员总数
	 * @return
	 */
	public int getTotalNum();
	
	/**
	 * 插入
	 * @param admin
	 */
	//TODO ken add the type and city id
	// can't modified the xml files
	public void insert(Admin admin);
	
	/**
	 * 修改
	 * @param admin
	 */
	//TODO ken add the type and city id
	//can't modified the xml files
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
	public void delete(List<String> ids);
}
