package com.zmsport.iyuesai.mapper;

import java.util.List;

/**
 * 赛事mapper
 * @author bilei
 *
 */
public interface GameMapper {

	/**
	 * 获取赛事总数
	 * @return
	 */
	public int getTotalNum();
	
	/**
	 * 查询赛事
	 * @param ids
	 * @return
	 */
	public List<Game> getGamesByIds(List<String> ids);
	
	/**
	 * 获取不同状态的赛事
	 * @param status
	 * @return
	 */
	public List<Game> getGamesByStatus(int status,int start,int size);
	
	/**
	 * 获取管理员创建的未开始的赛事
	 * @return
	 */
	public List<Game> getNewGamesByAdmin();
	
	/**
	 * 获取用户创建的未开始的赛事
	 * @return
	 */
	public List<Game> getNewGamesByUser();
	
	/**
	 * 发布赛事
	 * @param game
	 */
	public void insert(Game game);
	
	/**
	 * 修改赛事
	 * @param game
	 */
	public void update(Game game);
	
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
	public void delete(List<String> ids);
}
