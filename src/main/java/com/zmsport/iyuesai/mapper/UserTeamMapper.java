package com.zmsport.iyuesai.mapper;

import java.util.List;


/**
 * 用户和球队关联mapper
 * @author bilei
 *
 */
public interface UserTeamMapper {

	/**
	 * 添加
	 * @param ut
	 */
	public void insert(UserTeam ut);
	
	/**
	 * 修改用户的审批状态和处理时间
	 * @param ut
	 */
	public void updateStatus(UserTeam ut);
	
	/**
	 * 删除一条申请
	 * @param id
	 */
	public void delete(long id);
	
	/**
	 * 判断当前用户和当前球队的关系
	 * 已加入
	 * 正在审核
	 * 已拒绝
	 * @param uid
	 * @param tid
	 * @return
	 */
	public int getCurrentUserTeamStatus(long uid, int tid);
	
	/**
	 * 查询当前用户是否申请过当前球队
	 * @param uid
	 * @param tid
	 * @return
	 */
	public int checkCurrentUserTeam(long uid, int tid);
	
	/**
	 * 根据审批状态和球队id获取用户列表
	 * @param teamId
	 * @param status
	 * @return
	 */
	public List<UserTeam> findUserByStatusAndTeamId(int teamId, int status);
	
	/**
	 * 查询
	 * @param uid
	 * @param tid
	 * @return
	 */
	public UserTeam findByUidAndTid(long uid, int tid);
	
	/**
	 * 获取球队成员数量
	 * @return
	 */
	public int getMemberNum(int tid);
	
	/**
	 * 返回用户参加的球队id
	 * @param uid
	 * @param status
	 * @return
	 */
	public List<Integer> findTidsByUidAndStatus(long uid, int status);
	
	/**
	 * 删除用户相关信息
	 * @param uid
	 */
	public void deleteByUid(long uid);
}
