package com.zmsport.iyuesai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zmsport.iyuesai.mapper.Score;
import com.zmsport.iyuesai.mapper.ScoreMapper;

/**
 * 球队排行service实现
 * @author bilei
 *
 */
@Service
public class ScoreServiceImpl implements ScoreService {
	
	@Autowired
	private ScoreMapper mapper;

	@Override
	public List<Score> findTeamsByGameId(long gameId) {
		// TODO Auto-generated method stub
		return mapper.findTeamsByGameId(gameId);
	}

	@Override
	public List<Score> getTeamsByGameId(long gameId) {
		// TODO Auto-generated method stub
		return mapper.getTeamsByGameId(gameId);
	}

	@Override
	public void insert(Score score) {
		// TODO Auto-generated method stub
		mapper.insert(score);
	}

	@Override
	public void update(Score score) {
		// TODO Auto-generated method stub
		mapper.update(score);
	}

}
