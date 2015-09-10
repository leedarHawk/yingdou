package com.zmsport.iyuesai.mapper;

import java.util.List;

/**
 * 用户mapper
 * @author bilei
 *
 */
public interface UserMapper {
	
	/**
	 * 插入
	 * @param user
	 */
	public void insert(User user);
	
	/**
	 * 修改
	 * @param user
	 */
	public void update(User user);
	
	/**
	 * 查询用户
	 * @param uid
	 * @return
	 */
	public User findUserByUid(String uid);
	
	/**
	 * 查询用户
	 * @param id
	 * @return
	 */
	public User findUserById(long id);
	
	/**
	 * 删除用户
	 * 删除用相关的一切
	 * @param uid
	 */
	public void delete (long uid);
	
	/**
	 * 获取所有用户
	 * @return
	 */
	public List<User> findAllUsers(int page, int size);
	
	/**
	 * 获取用户总数
	 */
	public int getTotalCount();
}
