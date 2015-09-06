package com.zmsport.iyuesai.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zmsport.iyuesai.mapper.User;
import com.zmsport.iyuesai.mapper.UserMapper;

/**
 * 用户service实现
 * @author bilei
 *
 */
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper mapper;

	@Override
	public void insert(User user) {
		// TODO Auto-generated method stub
		mapper.insert(user);
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		mapper.update(user);
	}

	@Override
	public User findUserByUid(String uid) {
		// TODO Auto-generated method stub
		return mapper.findUserByUid(uid);
	}

	@Override
	public User findUserById(long id) {
		// TODO Auto-generated method stub
		return mapper.findUserById(id);
	}

}
