package com.zmsport.iyuesai.mapper;

import java.util.List;

/**
 * 球队排行榜mapper
 * @author bilei
 *
 */
public interface ScoreMapper {

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
