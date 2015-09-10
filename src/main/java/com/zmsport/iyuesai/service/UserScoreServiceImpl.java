package com.zmsport.iyuesai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zmsport.iyuesai.mapper.UserScore;
import com.zmsport.iyuesai.mapper.UserScoreMapper;

/**
 * 球员排名service实现
 * @author bilei
 *
 */
@Service
public class UserScoreServiceImpl implements UserScoreService {
	
	@Autowired
	private UserScoreMapper mapper;

	@Override
	public void insert(UserScore userScore) {
		// TODO Auto-generated method stub
		mapper.insert(userScore);
	}

	@Override
	public List<UserScore> rankUserByGameId(long gameId) {
		// TODO Auto-generated method stub
		return mapper.rankUserByGameId(gameId);
	}

	@Override
	public void updateScore(int score, long id) {
		// TODO Auto-generated method stub
		mapper.updateScore(score, id);
	}

	@Override
	public void deleteByUid(long uid) {
		// TODO Auto-generated method stub
		mapper.deleteByUid(uid);
	}

}
