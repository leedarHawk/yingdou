package com.zmsport.iyuesai.service;

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

}
