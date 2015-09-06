package com.zmsport.iyuesai.mapper;

import java.util.List;

/**
 * 球员排行mapper
 * @author bilei
 *
 */
public interface UserScoreMapper {

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
