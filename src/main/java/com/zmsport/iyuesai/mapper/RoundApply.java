package com.zmsport.iyuesai.mapper;

import java.sql.Date;

/**
 * 球局申请
 * @author bilei
 *
 */
public class RoundApply {
	
	/**
	 * 确定
	 */
	public static int STATUS_OK = 1;
	
	/**
	 * 未确定
	 */
	public static int STATUS_NOT_OK = 0;
	
	/**
	 * id
	 */
	private long id;
	
	/**
	 * 球局id
	 */
	private long rid;
	
	/**
	 * 用户id
	 */
	private long uid;
	
	/**
	 * 用户名
	 */
	private String username;
	
	/**
	 * 身高
	 */
	private String height;
	
	/**
	 * 体重
	 */
	private String weight;
	
	/**
	 * 手机
	 */
	private String mobile;
	
	/**
	 * qq
	 */
	private String qq;
	
	/**
	 * 状态
	 */
	private int status;
	
	/**
	 * 申请时间
	 */
	private Date time;
	
	/**
	 * 申请信息
	 */
	private String msg;
	
	/**
	 * 用户
	 */
	private User user;
	
	/**
	 * 球局
	 */
	private Round round;

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
	 * @return the rid
	 */
	public long getRid() {
		return rid;
	}

	/**
	 * @param rid the rid to set
	 */
	public void setRid(long rid) {
		this.rid = rid;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the height
	 */
	public String getHeight() {
		return height;
	}

	/**
	 * @param height the height to set
	 */
	public void setHeight(String height) {
		this.height = height;
	}

	/**
	 * @return the weight
	 */
	public String getWeight() {
		return weight;
	}

	/**
	 * @param weight the weight to set
	 */
	public void setWeight(String weight) {
		this.weight = weight;
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

	/**
	 * @return the uid
	 */
	public long getUid() {
		return uid;
	}

	/**
	 * @param uid the uid to set
	 */
	public void setUid(long uid) {
		this.uid = uid;
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

	/**
	 * @return the round
	 */
	public Round getRound() {
		return round;
	}

	/**
	 * @param round the round to set
	 */
	public void setRound(Round round) {
		this.round = round;
	}
}
