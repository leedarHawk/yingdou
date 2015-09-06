package com.zmsport.iyuesai.service;

import java.util.List;
import com.zmsport.iyuesai.mapper.Score;

/**
 * 球队排行service
 * @author bilei
 *
 */
public interface ScoreService {

	/**
	 * 获取某赛事下球队排行
	 * @param gameId
	 * @return
	 */
	public List<Score> findTeamsByGameId(long gameId);
	
	/**
	 * 获取某赛事下球队排行信息
	 * @param gameId
	 * @return
	 */
	public List<Score> getTeamsByGameId(long gameId);
	
	/**
	 * 插入某只球队的排行数据
	 * @param score
	 */
	public void insert(Score score);
	
	/**
	 * 修改某只球队的排行数据
	 * @param score
	 */
	public void update(Score score);
	
}
