package com.zmsport.iyuesai.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zmsport.iyuesai.mapper.Round;
import com.zmsport.iyuesai.mapper.RoundApply;
import com.zmsport.iyuesai.mapper.RoundApplyMapper;
import com.zmsport.iyuesai.mapper.RoundMapper;
import com.zmsport.iyuesai.mapper.TeamMapper;
import com.zmsport.iyuesai.mapper.UserMapper;

/**
 * 球局申请service实现
 * @author bilei
 *
 */
@Service
public class RoundApplyServiceImpl implements RoundApplyService {
	
	@Autowired
	private RoundApplyMapper mapper;
	
	@Autowired
	private UserMapper uMapper;
	
	@Autowired
	private RoundMapper rMapper;
	
	@Autowired
	private TeamMapper tMapper;

	@Override
	public List<RoundApply> getAllRoundApplys(long rid) {
		// TODO Auto-generated method stub
		List<RoundApply> list = mapper.getAllRoundApplys(rid);
		for(RoundApply ra : list) {
			ra.setUser(uMapper.findUserById(ra.getUid()));
		}
		return list;
	}

	@Override
	public void insert(RoundApply ra) {
		// TODO Auto-generated method stub
		mapper.insert(ra);
	}

	@Override
	public void updateStatus(int status, long id) {
		// TODO Auto-generated method stub
		mapper.updateStatus(status, id);
	}

	@Override
	public RoundApply getRoundApplyById(long id) {
		// TODO Auto-generated method stub
		return mapper.getRoundApplyById(id);
	}

	@Override
	public List<RoundApply> getRoundApplyByUid(long uid) {
		// TODO Auto-generated method stub
		List<RoundApply> list = mapper.getRoundApplyByUid(uid);
		Round round;
		for(RoundApply ra : list) {
			round = rMapper.findRoundById(ra.getRid());
			round.setTeam(tMapper.findTeamById(round.getTid()));
			round.setUser(uMapper.findUserById(round.getCreatorId()));
			round.setApplyNum(mapper.getRoundApplyRid(round.getId()).size());
			ra.setRound(round);
		}
		return list;
	}

	@Override
	public boolean isApply(long uid, long rid) {
		// TODO Auto-generated method stub
		return mapper.getRoundApplyByUidAndRid(uid, rid) != null;
	}

	@Override
	public int getMyRoundApplyNum(long uid) {
		// TODO Auto-generated method stub
		return mapper.getMyRoundApplyNum(uid);
	}

	@Override
	public List<RoundApply> getRoundAllApplyDetail( long id) {
		List<RoundApply> list = mapper.getRoundAllApplyDetail(id);
		for(RoundApply roundApply : list) {
			roundApply.setUser(uMapper.findUserById(roundApply.getUid()));
		}
		return list ;
	}

}
