package com.zmsport.iyuesai.mapper;

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
}
