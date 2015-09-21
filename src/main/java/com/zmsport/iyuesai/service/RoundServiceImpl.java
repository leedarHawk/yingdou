package com.zmsport.iyuesai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zmsport.iyuesai.mapper.Round;
import com.zmsport.iyuesai.mapper.RoundApply;
import com.zmsport.iyuesai.mapper.RoundApplyMapper;
import com.zmsport.iyuesai.mapper.RoundMapper;
import com.zmsport.iyuesai.mapper.TeamMapper;
import com.zmsport.iyuesai.mapper.UserMapper;

@Service
public class RoundServiceImpl implements RoundService {

	@Autowired
	private RoundMapper mapper;
	
	@Autowired
	private UserMapper uMapper;
	
	@Autowired
	private RoundApplyMapper raMapper;
	
	@Autowired
	private TeamMapper tMapper;
	
	@Override
	public List<Round> getAllRounds(long uid) {
		// TODO Auto-generated method stub
		List<Round> list = mapper.getAllRounds(uid);
		for(Round round : list) {
			round.setUser(uMapper.findUserById(round.getCreatorId()));
			round.setApplyNum(raMapper.getRoundApplyRid(round.getId()).size());
		}
		return list;
	}

	@Override
	public void insert(Round round) {
		// TODO Auto-generated method stub
		mapper.insert(round);
		//创建球局时，作为创始人自动在球局申请表中添加一条记录
		RoundApply ra = new RoundApply();
		ra.setRid(round.getId());
		ra.setStatus(RoundApply.STATUS_OK);
		ra.setUid(round.getCreatorId());
		ra.setUsername(uMapper.findUserById(round.getCreatorId()).getUsername());
		raMapper.insert(ra);
	}

	@Override
	public void updateMembers(long id) {
		// TODO Auto-generated method stub
		mapper.updateMembers(id);
	}

	@Override
	public Round findRoundById(long id) {
		// TODO Auto-generated method stub
		return mapper.findRoundById(id);
	}

	@Override
	public List<Round> getAllRoundsNew(long uid) {
		// TODO Auto-generated method stub
		List<Round> list = mapper.getAllRoundsNew(uid);
		for(Round round : list) {
			round.setUser(uMapper.findUserById(round.getCreatorId()));
			round.setApplyNum(raMapper.getRoundApplyRid(round.getId()).size());
			if(round.getTid() > 0) {
				round.setTeam(tMapper.findTeamById(round.getTid()));
			}
		}
		return list;
	}

}
