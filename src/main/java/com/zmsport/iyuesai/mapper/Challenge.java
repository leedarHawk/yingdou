package com.zmsport.iyuesai.mapper;

import java.sql.Timestamp;

/**
 * 约战信息
 * @author bilei
 *
 */
public class Challenge {
	
	/**
	 * 免费
	 */
	public final static int FEE_TYPE_FREE = 0;
	
	/**
	 * AA
	 */
	public final static int FEE_TYPE_AA = 1;
	
	/**
	 * 不需要裁判
	 */
	public final static int NEED_REFEREE_NO = 0;
	
	/**
	 * 需要裁判
	 */
	public final static int NEED_REFEREE_YES = 1;
	
	/**
	 * 约战状态 等待应战
	 */
	public final static int STATUS_NOT_START = 0;
	
	/**
	 * 约战状态 等待上传比分
	 */
	public final static int STATUS_STARTED = 1;
	
	/**
	 * 约战状态 比赛完成
	 */
	public final static int STATUS_FINISHED = 2;
	
	/**
	 * id
	 */
	private long id;
	
	/**
	 * 创建者id
	 */
	private long creatorId;
	
	/**
	 * 球队id
	 */
	private int teamId;
	
	/**
	 * 主队
	 */
	private Team host;
	
	/**
	 * 比赛时间
	 */
	private Timestamp time;
	
	/**
	 * 比赛地点
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
	 * 是否需要裁判
	 */
	private int needReferee;
	
	/**
	 * 创建者电话
	 */
	private String mobile;
	
	/**
	 * 备用联系人电话
	 */
	private String firstBakMobile;
	
	/**
	 * 备用联系人电话
	 */
	private String secondBakMobile;
	
	/**
	 * 需要参加者留下
	 */
	private String contact;
	
	/**
	 * 约战方球队id
	 */
	private int guestTeamId;
	
	/**
	 * 客队
	 */
	private Team guest;
	
	/**
	 * 比分
	 */
	private String score;
	
	/**
	 * 约战状态
	 */
	private int status;
	
	/**
	 * 备注信息
	 */
	private String ps;
	
	/**
	 * 约战次数
	 */
	private int count;

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
	 * @return the needReferee
	 */
	public int getNeedReferee() {
		return needReferee;
	}

	/**
	 * @param needReferee the needReferee to set
	 */
	public void setNeedReferee(int needReferee) {
		this.needReferee = needReferee;
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
	 * @return the firstBakMobile
	 */
	public String getFirstBakMobile() {
		return firstBakMobile;
	}

	/**
	 * @param firstBakMobile the firstBakMobile to set
	 */
	public void setFirstBakMobile(String firstBakMobile) {
		this.firstBakMobile = firstBakMobile;
	}

	/**
	 * @return the secondBakMobile
	 */
	public String getSecondBakMobile() {
		return secondBakMobile;
	}

	/**
	 * @param secondBakMobile the secondBakMobile to set
	 */
	public void setSecondBakMobile(String secondBakMobile) {
		this.secondBakMobile = secondBakMobile;
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
	 * @return the host
	 */
	public Team getHost() {
		return host;
	}

	/**
	 * @param host the host to set
	 */
	public void setHost(Team host) {
		this.host = host;
	}

	/**
	 * @return the guest
	 */
	public Team getGuest() {
		return guest;
	}

	/**
	 * @param guest the guest to set
	 */
	public void setGuest(Team guest) {
		this.guest = guest;
	}

	/**
	 * @return the ps
	 */
	public String getPs() {
		return ps;
	}

	/**
	 * @param ps the ps to set
	 */
	public void setPs(String ps) {
		this.ps = ps;
	}

	/**
	 * @return the count
	 */
	public int getCount() {
		return count;
	}

	/**
	 * @param count the count to set
	 */
	public void setCount(int count) {
		this.count = count;
	}
}
