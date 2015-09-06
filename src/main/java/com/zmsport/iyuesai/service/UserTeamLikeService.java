package com.zmsport.iyuesai.service;

import com.zmsport.iyuesai.mapper.UserTeamLike;

/**
 * 用户对球队的点赞记录service
 * @author bilei
 *
 */
public interface UserTeamLikeService {
	
	/**
	 * 插入
	 * @param utl
	 */
	public void insert(UserTeamLike utl);
	
	/**
	 * 找到用户的点赞记录
	 * @param uid
	 * @param tid
	 * @return
	 */
	public int alreadyLiked(long uid, int tid);
}
