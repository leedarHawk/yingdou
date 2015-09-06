package com.zmsport.iyuesai.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zmsport.iyuesai.mapper.Admin;
import com.zmsport.iyuesai.mapper.AdminMapper;

/**
 * @author bilei
 *
 */
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	/**
	 * 查询管理员
	 */
	@Override
	public Admin findAdminByName(String username) {
		// TODO Auto-generated method stub
		return mapper.findAdminByName(username);
	}

}
