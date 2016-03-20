package com.zmsport.iyuesai.service;

import java.util.List;

import com.zmsport.iyuesai.mapper.Team;
import com.zmsport.iyuesai.mapper.User;
/**
 * 球队service
 * @author bilei
 *
 */
public interface TeamService {
	
	/**
	 * 查询球队
	 * @param id
	 * @return
	 */
	public Team findTeamById(int id);
	
	/**
	 * 球队点赞
	 * @param id
	 */
	public void like(int id);
	
	/**
	 * 球队取消点赞
	 * @param id
	 */
	public void unlike(int id);
	
	/**
	 * 插入球队
	 * @param team
	 */
	public void insert(Team team);
	
	/**
	 * 修改球队
	 * @param team
	 */
	public void update(Team team);
	
	/**
	 * 查询某创始人的球队
	 */
	public List<Team> findTeamByCreatorId(long creatorId);
	
	/**
	 * 获取所有的球队
	 * @return
	 */
	public List<Team> getAllTeams();
	
	/**
	 * 获取球队下不同审批状态的球员
	 * @param id
	 * @return
	 */
	public List<User> findUsersByTeamId(int id, int status);
	
	/**
	 * 获取球队下的成员id
	 * @param teamId
	 * @return
	 */
	public String findMembersIds(int teamId);
	
	/**
	 * 获取球队的新成员
	 */
	public List<User> findNewUsers(int id, long timeLine);
	
	/**
	 * 获取球队的老成员
	 */
	public List<User> findOldUsers(int id, long timeLine);
	
	/**
	 * 按时间排序获取所有球队分页显示
	 * @param page
	 * @param size
	 * @return
	 */
	public List<User> findAllTeamsByPage(int page, int size, int status);
	
	/**
	 * 获取球队总数
	 * @return
	 */
	public int getTotalNum(int status);
	
	/**
	 * 删除球队
	 * @param ids
	 */
	public void delete(String ids);
	
	/**
	 * 查询赛事
	 * @param ids
	 * @return
	 */
	public List<Team> getTeamsByIds(String ids);
	
	/**
	 * 删除用户相关信息
	 * @param uid
	 */
	public void deleteByUid(long uid);
	
	/**
	 * 按名称查询球队
	 * @param name
	 * @return
	 */
	public List<Team> getAllTeamsByName(String name);


	int getZoneTotalNum(long cityId, int status);


	List<Team> findAllZoneTeamsByPage(int page, int size, int status, long cityId);
}
