package com.zmsport.iyuesai.service;

import java.util.List;

import com.zmsport.iyuesai.mapper.UserScore;

/**
 * 球员排名service
 * @author bilei
 *
 */
public interface UserScoreService {
	
	/**
	 * 添加
	 * @param userScore
	 */
	public void insert(UserScore userScore);
	
	/**
	 * 返回某赛事的所有球员
	 * @param gameId
	 * @return
	 */
	public List<UserScore> rankUserByGameId(long gameId);
	
	/**
	 * 更新评分
	 * @param score
	 * @param id
	 */
	public void updateScore(int score, long id);
}
