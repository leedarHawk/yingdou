package com.zmsport.iyuesai.service;

import java.util.List;
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

	@Override
	public void delete(long uid) {
		// TODO Auto-generated method stub
		//用户是否是球队创始人
		mapper.delete(uid);
	}

	@Override
	public List<User> findAllUsers(int page, int size) {
		// TODO Auto-generated method stub
		return mapper.findAllUsers(page, size);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getTotalCount();
	}

}
