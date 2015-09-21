package com.zmsport.iyuesai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zmsport.iyuesai.mapper.AcceptInfoMapper;
import com.zmsport.iyuesai.mapper.Challenge;
import com.zmsport.iyuesai.mapper.ChallengeMapper;
import com.zmsport.iyuesai.mapper.TeamMapper;

/**
 * 约战service实现
 * @author bilei
 *
 */
@Service
public class ChallengeServiceImpl implements ChallengeService {

	@Autowired
	private ChallengeMapper mapper;
	
	@Autowired
	private TeamMapper tMapper;
	
	@Autowired
	private AcceptInfoMapper aiMapper;
	
	@Override
	public void delete(long uid) {
		// TODO Auto-generated method stub
		mapper.delete(uid);
	}

	@Override
	public List<Challenge> getAllChallenges(long uid) {
		// TODO Auto-generated method stub
		List<Challenge> list = mapper.getAllChallenges(uid);
		for(Challenge c : list) {
			c.setHost(tMapper.findTeamById(c.getTeamId()));
			c.setGuest(tMapper.findTeamById(c.getGuestTeamId()));
			c.setCount(aiMapper.findAcceptInfoByChallengeId(c.getId()).size());
		}
		return list;
	}

	@Override
	public void insert(Challenge challenge) {
		// TODO Auto-generated method stub
		mapper.insert(challenge);
	}

	@Override
	public void updateStatus(int status, long challengeId) {
		// TODO Auto-generated method stub
		mapper.updateStatus(status, challengeId);
	}

	@Override
	public void updateGuestTeamId(int guestTeamId, long challengeId) {
		// TODO Auto-generated method stub
		mapper.updateGuestTeamId(guestTeamId,challengeId);
	}

	@Override
	public Challenge getChallenge(long id) {
		// TODO Auto-generated method stub
		return mapper.getChallenge(id);
	}

	@Override
	public List<Challenge> findChallengesByTeamId(int teamId) {
		// TODO Auto-generated method stub
		List<Challenge> list = mapper.findChallengesByTeamId(teamId);
		for(Challenge c : list) {
			c.setHost(tMapper.findTeamById(c.getTeamId()));
			c.setGuest(tMapper.findTeamById(c.getGuestTeamId()));
		}
		return list;
	}

	@Override
	public List<Challenge> getChallengesByPage(int page, int size) {
		// TODO Auto-generated method stub
		List<Challenge> list = mapper.getChallengesByPage(--page * size, size);
		for(Challenge c : list) {
			c.setHost(tMapper.findTeamById(c.getTeamId()));
			c.setGuest(tMapper.findTeamById(c.getGuestTeamId()));
			c.setCount(aiMapper.findAcceptInfoByChallengeId(c.getId()).size());
		}
		return list;
	}

	@Override
	public int getTotalNum() {
		// TODO Auto-generated method stub
		return mapper.getTotalNum();
	}

	@Override
	public void updateScore(String score, long id) {
		// TODO Auto-generated method stub
		mapper.updateScore(score, id);
	}

	@Override
	public List<Challenge> findAllChallengesByTeamId(int teamId) {
		// TODO Auto-generated method stub
		List<Challenge> list = mapper.findAllChallengesByTeamId(teamId);
		for(Challenge c : list) {
			c.setHost(tMapper.findTeamById(c.getTeamId()));
			c.setGuest(tMapper.findTeamById(c.getGuestTeamId()));
		}
		return list;
	}

}
