package com.zmsport.iyuesai.mapper;

import java.sql.Timestamp;

/**
 * 单场比赛
 * @author bilei
 *
 */
public class Match {

	/**
	 * 比赛未开始
	 */
	public static final int STATUS_NOT_START = 0;
	
	/**
	 * 比赛进行中
	 */
	public static final int STATUS_IS_STARTING = 1;
	
	/**
	 * 比赛结束
	 */
	public static final int STATUS_FINISHED = 2;
	
	/**
	 * id
	 */
	private int id;
	
	/**
	 * 主队id
	 */
	private int hostTeamId;
	
	/**
	 * 客队id
	 */
	private int guestTeamId;
	
	/**
	 * 比赛时间
	 */
	private Timestamp time;
	
	/**
	 * 比赛地点
	 */
	private String location;
	
	/**
	 * 报名费用
	 */
	private String fee;
	
	/**
	 * 比赛状态
	 */
	private int status;
	
	/**
	 * 比赛成绩
	 */
	private String score;
	
	/**
	 * 创建者id
	 */
	private long creatorId;
	
	/**
	 * 创建者类型
	 */
	private int creatorType;
	
	/**
	 * 关联的赛事id
	 */
	private long gameId;

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the hostTeamId
	 */
	public int getHostTeamId() {
		return hostTeamId;
	}

	/**
	 * @param hostTeamId the hostTeamId to set
	 */
	public void setHostTeamId(int hostTeamId) {
		this.hostTeamId = hostTeamId;
	}

	/**
	 * @return the guestTeamId
	 */
	public int getGuestTeamId() {
		return guestTeamId;
	}

	/**
	 * @param guestTeamId the guestTeamId to set
	 */
	public void setGuestTeamId(int guestTeamId) {
		this.guestTeamId = guestTeamId;
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
	 * @return the location
	 */
	public String getLocation() {
		return location;
	}

	/**
	 * @param location the location to set
	 */
	public void setLocation(String location) {
		this.location = location;
	}

	/**
	 * @return the fee
	 */
	public String getFee() {
		return fee;
	}

	/**
	 * @param fee the fee to set
	 */
	public void setFee(String fee) {
		this.fee = fee;
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

	/**
	 * @return the score
	 */
	public String getScore() {
		return score;
	}

	/**
	 * @param score the score to set
	 */
	public void setScore(String score) {
		this.score = score;
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
	 * @return the creatorType
	 */
	public int getCreatorType() {
		return creatorType;
	}

	/**
	 * @param creatorType the creatorType to set
	 */
	public void setCreatorType(int creatorType) {
		this.creatorType = creatorType;
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
}
