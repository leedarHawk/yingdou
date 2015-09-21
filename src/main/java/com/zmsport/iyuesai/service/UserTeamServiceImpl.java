package com.zmsport.iyuesai.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.zmsport.iyuesai.mapper.User;
import com.zmsport.iyuesai.mapper.UserMapper;
import com.zmsport.iyuesai.mapper.UserTeam;
import com.zmsport.iyuesai.mapper.UserTeamMapper;
/**
 * 用户和球队关联实现
 * @author bilei
 *
 */
@Service
public class UserTeamServiceImpl implements UserTeamService {

	@Autowired
	private UserTeamMapper mapper;
	
	@Autowired
	private UserMapper uMapper;
	
	@Override
	public void insert(UserTeam ut) {
		// TODO Auto-generated method stub
		mapper.insert(ut);
	}

	@Override
	public int getCurrentUserTeamStatus(long uid, int tid) {
		// TODO Auto-generated method stub
		if(mapper.checkCurrentUserTeam(uid, tid) == 0) {
			return -1;
		}
		return mapper.getCurrentUserTeamStatus(uid, tid);
	}

	@Override
	public void updateStatus(UserTeam ut) {
		// TODO Auto-generated method stub
		mapper.updateStatus(ut);
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		mapper.delete(id);
	}

	@Override
	public List<User> findUserByStatusAndTeamId(int teamId, int status) {
		// TODO Auto-generated method stub
		List<UserTeam> list = mapper.findUserByStatusAndTeamId(teamId, status);
		List<User> uList = new ArrayList<User>();
		for(UserTeam ut : list) {
			uList.add(uMapper.findUserById(ut.getUid()));
		}
		return uList;
	}

	@Override
	public UserTeam findByUidAndTid(long uid, int tid) {
		// TODO Auto-generated method stub
		return mapper.findByUidAndTid(uid, tid);
	}

	@Override
	public int getMemberNum(int tid) {
		// TODO Auto-generated method stub
		return mapper.getMemberNum(tid);
	}

	@Override
	public String findTidsByUidAndStatus(long uid, int status) {
		// TODO Auto-generated method stub
		List<Integer> list = mapper.findTidsByUidAndStatus(uid, status);
		String[] s = new String[list.size()];
		for(int i = 0; i < list.size(); i++) {
			s[i] = list.get(i).toString();
		}
		return StringUtils.arrayToCommaDelimitedString(s);
	}

	@Override
	public void deleteByUid(long uid) {
		// TODO Auto-generated method stub
		mapper.deleteByUid(uid);
	}

	@Override
	public List<UserTeam> findApplicantsByTid(int tid) {
		// TODO Auto-generated method stub
		return mapper.findApplicantsByTid(tid);
	}

}
