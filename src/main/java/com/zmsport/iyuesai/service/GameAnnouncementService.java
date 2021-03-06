package com.zmsport.iyuesai.service;

import java.util.List;

import com.zmsport.iyuesai.mapper.GameAnnouncement;

/**
 * 赛事公告service
 * @author bilei
 *
 */
public interface GameAnnouncementService {

	/**
	 * 获取赛事公告
	 * @param gameId
	 * @return
	 */
	public List<GameAnnouncement> findAnnouncementByGameId(long gameId, int page, int size);
	
	/**
	 * 获取某赛事所有公告
	 * @param gameId
	 * @return
	 */
	public List<GameAnnouncement> findAllAnnouncementByGameId(long gameId);
	
	/**
	 * 获取赛事公告
	 * @param id
	 * @return
	 */
	public GameAnnouncement findAnnouncementById(long id);
	
	/**
	 * 获取赛事公告总数
	 * @return
	 */
	public int getTotalNum(long gameId);
	
	/**
	 * 增加
	 * @param gameAnnouncement
	 */
	public void insert(GameAnnouncement gameAnnouncement);
	
	/**
	 * 修改
	 * @param gameAnnouncement
	 */
	public void update(GameAnnouncement gameAnnouncement);
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids);
	
	/**
	 * 删除某赛事所有的公告
	 * @param gameId
	 */
	public void deleteByGameId(String gameIds);
}
