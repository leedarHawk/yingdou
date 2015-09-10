package com.zmsport.iyuesai.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zmsport.iyuesai.mapper.Team;
import com.zmsport.iyuesai.mapper.TeamMapper;
import com.zmsport.iyuesai.mapper.User;
import com.zmsport.iyuesai.mapper.UserMapper;
import com.zmsport.iyuesai.mapper.UserTeam;
/**
 * 球队service实现
 * @author bilei
 *
 */
@Service
public class TeamServiceImpl implements TeamService {

	@Autowired
	private TeamMapper mapper;
	
	@Autowired 
	private UserMapper uMapper;
	
	@Override
	public Team findTeamById(int id) {
		// TODO Auto-generated method stub
		Team team = mapper.findTeamById(id);
		team.setMember(mapper.findUsersByTeamId(id,UserTeam.STATUS_CONFIRMED));
		return team;
	}

	@Override
	public void insert(Team team) {
		// TODO Auto-generated method stub
		mapper.insert(team);
	}

	@Override
	public void update(Team team) {
		// TODO Auto-generated method stub
		mapper.upate(team);
	}

	@Override
	public List<Team> findTeamByCreatorId(long creatorId) {
		// TODO Auto-generated method stub
		List<Team> list = mapper.findTeamByCreatorId(creatorId);
		for(Team t : list) {
			t.setCreator(uMapper.findUserById(t.getCreatorId()));
			t.setMember(mapper.findUsersByTeamId(t.getId(), UserTeam.STATUS_CONFIRMED));
		}
		return list;
	}

	@Override
	public List<Team> getAllTeams() {
		// TODO Auto-generated method stub
		List<Team> list =  mapper.getAllTeams();
		for(Team team : list) {
			team.setCreator(uMapper.findUserById(team.getCreatorId()));
			team.setMember(mapper.findUsersByTeamId(team.getId(), UserTeam.STATUS_CONFIRMED));
		}
		return list;
	}

	@Override
	public List<User> findUsersByTeamId(int id, int status) {
		// TODO Auto-generated method stub
		return mapper.findUsersByTeamId(id,status);
	}

	@Override
	public List<User> findNewUsers(int id, long timeLine) {
		// TODO Auto-generated method stub
		Timestamp time = new Timestamp(System.currentTimeMillis() - timeLine);
		return mapper.findNewUsers(id, time);
	}

	@Override
	public List<User> findOldUsers(int id, long timeLine) {
		// TODO Auto-generated method stub
		Timestamp time = new Timestamp(System.currentTimeMillis() - timeLine);
		return mapper.findOldUsers(id, time);
	}

	@Override
	public List<User> findAllTeamsByPage(int page, int size) {
		// TODO Auto-generated method stub
		return mapper.findAllTeamsByPage(--page*size, size);
	}

	@Override
	public int getTotalNum() {
		// TODO Auto-generated method stub
		return mapper.getTotalNum();
	}
	
	@Override
	public void delete(String ids) {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList<String>();
		String[] s = ids.split(",");
		for(String temp : s) {
			list.add(temp);
		}
		mapper.delete(list);
	}

	@Override
	public List<Team> getTeamsByIds(String ids) {
		// TODO Auto-generated method stub
		List<String> idList = new ArrayList<String>();
		String[] s = ids.split(",");
		for(String temp : s) {
			idList.add(temp);
		}
		List<Team> list =  mapper.getTeamsByIds(idList);
		for(Team team : list) {
			team.setCreator(uMapper.findUserById(team.getCreatorId()));
			team.setMember(mapper.findUsersByTeamId(team.getId(), UserTeam.STATUS_CONFIRMED));
		}
		return list;
	}

	@Override
	public void like(int id) {
		// TODO Auto-generated method stub
		mapper.like(id);
	}

	@Override
	public void deleteByUid(long uid) {
		// TODO Auto-generated method stub
		
	}
}
