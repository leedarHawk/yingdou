package com.zmsport.iyuesai.service;

import java.util.List;

import com.zmsport.iyuesai.mapper.Game;

/**
 * 赛事相关服务
 * @author bilei
 *
 */
public interface GameService {
	
	/**
	 * 获取赛事总数
	 * @return
	 */
	public int getTotalNum();
	
	/**
	 * 获取未开始的赛事
	 * @return
	 */
	public List<Game> getNewGames();
	
	/**
	 * 查询赛事
	 * @param ids
	 * @return
	 */
	public List<Game> getGamesByIds(String ids);
	
	/**
	 * 获取不同状态的
	 * @param status
	 * @return
	 */
	public List<Game> getGames(int status,int page,int size);
	
	/**
	 * 发布赛事
	 * @param game
	 */
	public void publishGame(Game game);
	
	/**
	 * 修改赛事
	 * @param game
	 */
	public void updateGame(Game game);
	
	/**
	 * 查询某赛事
	 * @param id
	 * @return
	 */
	public Game getGamesById(long id);
	
	/**
	 * 删除赛事
	 * @param ids
	 */
	public void delete(String ids);
}
