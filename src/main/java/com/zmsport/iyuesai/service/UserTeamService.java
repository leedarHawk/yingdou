package com.zmsport.iyuesai.service;

import java.util.List;

import com.zmsport.iyuesai.mapper.User;
import com.zmsport.iyuesai.mapper.UserTeam;

/**
 * 用户和球队关联service
 * @author bilei
 *
 */
public interface UserTeamService {

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
	 * 根据审批状态和球队id获取用户列表
	 * @param teamId
	 * @param status
	 * @return
	 */
	public List<User> findUserByStatusAndTeamId(int teamId, int status);
	
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
	public String findTidsByUidAndStatus(long uid, int status);
	
	/**
	 * 删除用户相关信息
	 * @param uid
	 */
	public void deleteByUid(long uid);
	
	/**
	 * 获取某球队的加入申请列表
	 * @param tid
	 * @return
	 */
	public List<UserTeam> findApplicantsByTid(int tid);
}
