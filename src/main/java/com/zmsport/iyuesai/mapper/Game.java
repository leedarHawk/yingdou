package com.zmsport.iyuesai.mapper;

import java.sql.Timestamp;

/**
 * 赛事
 * @author bilei
 *
 */
public class Game {
	
	/**
	 * 比赛未开始
	 */
	public final static int STATUS_NOT_START = 0;
	
	/**
	 * 比赛进行中
	 */
	public final static int STATUS_IS_START = 1;
	
	/**
	 * 比赛已结束
	 */
	public final static int STATUS_IS_FINISHED = 2;
	
	/**
	 * 管理员创建
	 */
	public final static int CREATE_TYPE_ADMIN = 0;
	
	/**
	 * 用户创建
	 */
	public final static int CREATE_TYPE_USER = 1;
	
	/**
	 * id
	 */
	private long id;
	
	/**
	 * 赛事名称
	 */
	private String name;
	
	/**
	 * 比赛时间
	 */
	private String duration;
	
	/**
	 * 比赛地点
	 */
	private String location;
	
	/**
	 * 报名费用
	 */
	private int fee;
	
	/**
	 * 赛事简介
	 */
	private String description;
	
	/**
	 * 赛事logo、图片
	 */
	private String pic;
	
	/**
	 * 赛事状态
	 */
	private int status;
	
	/**
	 * 赛事创建类型
	 */
	private int createType;
	
	/**
	 * 创建人
	 */
	private long creator;
	
	/**
	 * 赛事创建时间
	 */
	private Timestamp createTime;
	
	/**
	 * 参加球队名额
	 */
	private int teamNum;

	private int cityId ;

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
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the duration
	 */
	public String getDuration() {
		return duration;
	}

	/**
	 * @param duration the duration to set
	 */
	public void setDuration(String duration) {
		this.duration = duration;
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
	public int getFee() {
		return fee;
	}

	/**
	 * @param fee the fee to set
	 */
	public void setFee(int fee) {
		this.fee = fee;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the pic
	 */
	public String getPic() {
		return pic;
	}

	/**
	 * @param pic the pic to set
	 */
	public void setPic(String pic) {
		this.pic = pic;
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
	 * @return the createType
	 */
	public int getCreateType() {
		return createType;
	}

	/**
	 * @param createType the createType to set
	 */
	public void setCreateType(int createType) {
		this.createType = createType;
	}

	/**
	 * @return the creator
	 */
	public long getCreator() {
		return creator;
	}

	/**
	 * @param creator the creator to set
	 */
	public void setCreator(long creator) {
		this.creator = creator;
	}

	/**
	 * @return the createTime
	 */
	public Timestamp getCreateTime() {
		return createTime;
	}

	/**
	 * @param createTime the createTime to set
	 */
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	/**
	 * @return the teamNum
	 */
	public int getTeamNum() {
		return teamNum;
	}

	/**
	 * @param teamNum the teamNum to set
	 */
	public void setTeamNum(int teamNum) {
		this.teamNum = teamNum;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
}
