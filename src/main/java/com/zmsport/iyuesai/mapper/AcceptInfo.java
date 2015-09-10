package com.zmsport.iyuesai.mapper;

import java.sql.Date;

/**
 * 约战应战信息
 * @author bilei
 *
 */
public class AcceptInfo {

	/**
	 * id
	 */
	private long id;
	
	/**
	 * 球队id
	 */
	private int tid;
	
	/**
	 * qq
	 */
	private String qq;
	
	/**
	 * mobile
	 */
	private String mobile;
	
	/**
	 * 申请时间
	 */
	private Date time;
	
	/**
	 * 约战id
	 */
	private long challengeId;
	
	/**
	 * 信息
	 */
	private String msg;

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
	 * @return the challengeId
	 */
	public long getChallengeId() {
		return challengeId;
	}

	/**
	 * @param challengeId the challengeId to set
	 */
	public void setChallengeId(long challengeId) {
		this.challengeId = challengeId;
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
	 * @return the msg
	 */
	public String getMsg() {
		return msg;
	}

	/**
	 * @param msg the msg to set
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
