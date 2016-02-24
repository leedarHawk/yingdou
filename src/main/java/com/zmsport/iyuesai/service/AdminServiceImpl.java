package com.zmsport.iyuesai.service;

import java.util.Arrays;
import java.util.List;
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

	@Override
	public List<Admin> getAdmins(int page, int pageSize) {
		// TODO Auto-generated method stub
		return mapper.getAdmins(--page * pageSize, pageSize);
	}

	@Override
	public void insert(Admin admin) {
		// TODO Auto-generated method stub
		mapper.insert(admin);
	}

	@Override
	public void update(Admin admin) {
		// TODO Auto-generated method stub
		mapper.update(admin);
	}

	@Override
	public int getTotalNum() {
		// TODO Auto-generated method stub
		return mapper.getTotalNum();
	}

	@Override
	public Admin findAdminById(long id) {
		// TODO Auto-generated method stub
		return mapper.findAdminById(id);
	}

	@Override
	public void delete(String ids) {
		// TODO Auto-generated method stub
		mapper.delete(Arrays.asList(ids.split(",")));
	}

	public void changeStatus(Admin admin){
		mapper.changeStatus(admin);
	}

}
