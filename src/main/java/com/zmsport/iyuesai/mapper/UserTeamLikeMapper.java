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
	
	/**
	 * 删除用户相关信息
	 * @param uid
	 */
	public void deleteByUid(long uid);
	
	/**
	 * 删除用户对球队的点赞记录
	 * @param tid
	 * @param uid
	 */
	public void deleteLike(int tid, long uid);

}
