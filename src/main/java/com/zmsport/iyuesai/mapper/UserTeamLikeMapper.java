package com.zmsport.iyuesai.mapper;

/**
 * 用户对球队点赞记录mapper
 * @author bilei
 *
 */
public interface UserTeamLikeMapper {
	
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
	public int findLike(long uid, int tid);

}
