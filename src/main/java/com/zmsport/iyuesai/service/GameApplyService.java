package com.zmsport.iyuesai.service;

import java.util.List;
import java.util.Map;

import com.zmsport.iyuesai.mapper.GameApply;

/**
 * 赛事报名service
 * @author bilei
 *
 */
public interface GameApplyService {
	/**
	 * 获取某赛事报名列表
	 * @param gameId
	 * @return
	 */
	public List<GameApply> getApplyByGameId(long gameId);
	
	/**
	 * 获取赛事报名
	 * @param id
	 * @return
	 */
	public GameApply getApplyById(long id);
	
	/**
	 * 获取某赛事已经报名的球队id
	 * @param gameId
	 * @return
	 */
	public String getJoinedTeamIdsByGameId(long gameId);
	
	/**
	 * 获取已提交报名申请的状态
	 * @param gameId
	 * @param creatorId
	 * @return
	 */
	public int getStatusByGameIdAndCreatorId(long gameId, long creatorId);
	
	/**
	 * 添加报名信息
	 * @param gameApply
	 */
	public void add(GameApply gameApply);
	
	/**
	 * 改变审核状态
	 * @param status
	 * @param id
	 */
	public void updateStatus(int status, long id);
	
	/**
	 * 删除报名信息
	 * @param id
	 */
	public void delete(long id);
	
	/**
	 * 删除某赛事所有的报名信息
	 * @param gameId
	 */
	public void deleteByGameId(String gameIds);
	
	/**
	 * 更新状态
	 * @param creatorId
	 * @param gameId
	 */
	public void updateStatusByCreatorIdAndGameId(int status,long creatorId, long gameId);
	
	/**
	 * 获取赛事报名
	 * @param gameId
	 * @param creatorId
	 * @return
	 */
	public GameApply getApplyByGameIdAndCreatorId(long gameId, long creatorId);
	
	/**
	 * 我参加的赛事
	 * @param uid
	 * @return
	 */
	public List<Map> getMyGames(long uid);
	
	/**
	 * 删除用户相关信息
	 * @param creatorId
	 */
	public void deleteByCreatorId(long creatorId);
}
