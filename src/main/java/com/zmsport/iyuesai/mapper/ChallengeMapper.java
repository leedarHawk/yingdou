package com.zmsport.iyuesai.mapper;

import java.util.List;

/**
 * 约战mapper
 * @author bilei
 *
 */
public interface ChallengeMapper {

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
	 * 添加
	 * @param challenge
	 */
	public void insert(Challenge challenge);
	
	/**
	 * 改变约战状态
	 * @param status
	 */
	public void updateStatus(int status);
	
	/**
	 * 修改对战球队id
	 * @param guestTeamId
	 */
	public void updateGuestTeamId(int guestTeamId);
	
	/**
	 * 获取约战
	 * @param id
	 * @return
	 */
	public Challenge getChallenge(long id);
	
}
