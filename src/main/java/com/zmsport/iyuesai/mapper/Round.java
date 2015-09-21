package com.zmsport.iyuesai.mapper;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * 球局
 * @author bilei
 *
 */
public class Round {
	
	/**
	 * 免费
	 */
	public static final int FEE_TYPE_FREE = 0;
	
	/**
	 * AA
	 */
	public static final int FEE_TYPE_AA = 1;
	
	/**
	 * 招募人数不限
	 */
	public static final int ENROLL_TYPE_NO_LIMIT = 0;
	
	/**
	 * 招募人数限制
	 */
	public static final int ENROLL_TYPE_LIMIT = 1;

	/**
	 * id
	 */
	private long id;
	
	/**
	 * 创建人id
	 */
	private long creatorId;
	
	/**
	 * 用户
	 */
	private User user;
	
	/**
	 * 球队id
	 */
	private int tid;
	
	/**
	 * 球队
	 */
	private Team team;
	
	/**
	 * 球局名称
	 */
	private String name;
	
	/**
	 * 开始时间
	 */
	private Timestamp startTime;
	
	/**
	 * 结束时间
	 */
	private Timestamp endTime;
	
	/**
	 * 地点
	 */
	private String location;
	
	/**
	 * 费用类型
	 */
	private int feeType;
	
	/**
	 * 费用
	 */
	private int fee;
	
	/**
	 * 招募类型
	 */
	private int enrollType;
	
	/**
	 * 招募人数
	 */
	private int enrollLimit;
	
	/**
	 * 手机
	 */
	private String mobile;
	
	/**
	 * 需要参加者
	 */
	private String contact;
	
	/**
	 * 已有人数
	 */
	private int members;
	
	/**
	 * 发布时间
	 */
	private Date time;

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
	 * @return the team
	 */
	public Team getTeam() {
		return team;
	}

	/**
	 * @param team the team to set
	 */
	public void setTeam(Team team) {
		this.team = team;
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
	 * @return the startTime
	 */
	public Timestamp getStartTime() {
		return startTime;
	}

	/**
	 * @param startTime the startTime to set
	 */
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	/**
	 * @return the endTime
	 */
	public Timestamp getEndTime() {
		return endTime;
	}

	/**
	 * @param endTime the endTime to set
	 */
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
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
	 * @return the feeType
	 */
	public int getFeeType() {
		return feeType;
	}

	/**
	 * @param feeType the feeType to set
	 */
	public void setFeeType(int feeType) {
		this.feeType = feeType;
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
	 * @return the enrollType
	 */
	public int getEnrollType() {
		return enrollType;
	}

	/**
	 * @param enrollType the enrollType to set
	 */
	public void setEnrollType(int enrollType) {
		this.enrollType = enrollType;
	}

	/**
	 * @return the enrollLimit
	 */
	public int getEnrollLimit() {
		return enrollLimit;
	}

	/**
	 * @param enrollLimit the enrollLimit to set
	 */
	public void setEnrollLimit(int enrollLimit) {
		this.enrollLimit = enrollLimit;
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
	 * @return the contact
	 */
	public String getContact() {
		return contact;
	}

	/**
	 * @param contact the contact to set
	 */
	public void setContact(String contact) {
		this.contact = contact;
	}

	/**
	 * @return the time
	 */
	public Date getTime() {
		return time;
	}

	/**
	 * @param time the time to set
	 */
	public void setTime(Date time) {
		this.time = time;
	}

	/**
	 * @return the members
	 */
	public int getMembers() {
		return members;
	}

	/**
	 * @param members the members to set
	 */
	public void setMembers(int members) {
		this.members = members;
	}

	/**
	 * @return the tid
	 */
	public int getTid() {
		return tid;
	}

	/**
	 * @param tid the tid to set
	 */
	public void setTid(int tid) {
		this.tid = tid;
	}

	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}
}
