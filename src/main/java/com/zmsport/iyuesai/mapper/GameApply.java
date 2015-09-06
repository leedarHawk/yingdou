package com.zmsport.iyuesai.mapper;

import java.sql.Timestamp;

/**
 * 赛事报名
 * @author bilei
 *
 */
public class GameApply {
	
	/**
	 * 审核中
	 */
	public static final int STATUS_CONFIRMING = 0;
	
	/**
	 * 审核通过,去支付
	 */
	public static final int STATUS_CONFIRMED = 1;
	
	/**
	 * 已经报名
	 */
	public static final int STATUS_APPLY_SUCCESS = 2;
	
	/**
	 * 审核没通过
	 */
	public static final int STATUS_NOT_CONFIRMED = 3;
	
	/**
	 * id
	 */
	private long id;
	
	/**
	 * 赛事id
	 */
	private long gameId;
	
	/**
	 * 球队创始人id
	 */
	private long creatorId;
	
	/**
	 * 球队创始人
	 */
	private String creator;
	
	/**
	 * 球队id
	 */
	private int teamId;
	
	/**
	 * 球队
	 */
	private String team;
	
	/**
	 * 联系电话
	 */
	private String mobile;
	
	/**
	 * qq
	 */
	private String qq;
	
	/**
	 * 备用联系人姓名
	 */
	private String bakContactor;
	
	/**
	 * 备用联系人电话
	 */
	private String bakMobile;
	
	/**
	 * 报名时间
	 */
	private Timestamp time;
	
	/**
	 * 审核状态
	 */
	private int status;

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return the gameId
	 */
	public long getGameId() {
		return gameId;
	}

	/**
	 * @param gameId the gameId to set
	 */
	public void setGameId(long gameId) {
		this.gameId = gameId;
	}

	/**
	 * @return the creatorId
	 */
	public long getCreatorId() {
		return creatorId;
	}

	/**
	 * @param creatorId the creatorId to set
	 */
	public void setCreatorId(long creatorId) {
		this.creatorId = creatorId;
	}

	/**
	 * @return the teamId
	 */
	public int getTeamId() {
		return teamId;
	}

	/**
	 * @param teamId the teamId to set
	 */
	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * @return the qq
	 */
	public String getQq() {
		return qq;
	}

	/**
	 * @param qq the qq to set
	 */
	public void setQq(String qq) {
		this.qq = qq;
	}

	/**
	 * @return the bakContactor
	 */
	public String getBakContactor() {
		return bakContactor;
	}

	/**
	 * @param bakContactor the bakContactor to set
	 */
	public void setBakContactor(String bakContactor) {
		this.bakContactor = bakContactor;
	}

	/**
	 * @return the bakMobile
	 */
	public String getBakMobile() {
		return bakMobile;
	}

	/**
	 * @param bakMobile the bakMobile to set
	 */
	public void setBakMobile(String bakMobile) {
		this.bakMobile = bakMobile;
	}

	/**
	 * @return the creator
	 */
	public String getCreator() {
		return creator;
	}

	/**
	 * @param creator the creator to set
	 */
	public void setCreator(String creator) {
		this.creator = creator;
	}

	/**
	 * @return the team
	 */
	public String getTeam() {
		return team;
	}

	/**
	 * @param team the team to set
	 */
	public void setTeam(String team) {
		this.team = team;
	}

	/**
	 * @return the time
	 */
	public Timestamp getTime() {
		return time;
	}

	/**
	 * @param time the time to set
	 */
	public void setTime(Timestamp time) {
		this.time = time;
	}

	/**
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(int status) {
		this.status = status;
	}
}
