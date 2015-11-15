package com.zmsport.iyuesai.service;

import java.util.List;

import com.zmsport.iyuesai.mapper.Challenge;

/**
 * 约战service
 * @author bilei
 *
 */
public interface ChallengeService {

	/**
	 * 删除用户的信息
	 * @param uid
	 */
	public void delete(long uid);
	
	/**
	 * 获取所有约战信息
	 * @return
	 */
	public List<Challenge> getAllChallenges(long uid);
	
	/**
	 * 获取所有约战信息
	 * @return
	 */
	public List<Challenge> getChallengesByPage(int page, int size);
	
	/**
	 * 获取某球队的约战记录（已结束）
	 * @param teamId
	 * @return
	 */
	public List<Challenge> findChallengesByTeamId(int teamId);
	
	/**
	 * 获取某球队的约战记录（所有）
	 * @param teamId
	 * @return
	 */
	public List<Challenge> findAllChallengesByTeamId(int teamId);
	
	/**
	 * 添加
	 * @param challenge
	 */
	public void insert(Challenge challenge);
	
	/**
	 * 改变约战状态
	 * @param status
	 */
	public void updateStatus(int status, long challengeId);
	
	/**
	 * 修改对战球队id
	 * @param guestTeamId
	 */
	public void updateGuestTeamId(int guestTeamId, long challengeId);
	
	/**
	 * 获取约战
	 * @param id
	 * @return
	 */
	public Challenge getChallenge(long id);
	
	/**
	 * 获取总数
	 * @return
	 */
	public int getTotalNum();
	
	/**
	 * 更新比分
	 * @param score
	 * @param id
	 */
	public void updateScore(String score, long id);
	
	/**
	 * 获取我所有的约战申请球队的总数
	 * @param uid
	 * @return
	 */
	public int getMyTeamChallengeNum(long uid);

	/**
	 *
	 * @param id
	 * @return
	 */
	public List<Challenge> getChallegeDetailByid( long id) ;


}
