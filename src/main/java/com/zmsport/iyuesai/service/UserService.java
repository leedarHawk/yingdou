package com.zmsport.iyuesai.service;

import java.util.List;

import com.zmsport.iyuesai.mapper.User;

/**
 * 用户service
 * @author bilei
 *
 */
public interface UserService {
	
	/**
	 * 添加用户
	 * @param user
	 */
	public void insert(User user);
	
	/**
	 * 修改用户
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
