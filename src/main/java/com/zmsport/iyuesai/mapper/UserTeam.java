package com.zmsport.iyuesai.mapper;

import java.sql.Timestamp;

/**
 * 用户和球队关联
 * @author bilei
 *
 */
public class UserTeam {

	/**
	 * 未审批
	 */
	public static final int STATUS_NOT_CONFIRM = 0;
	
	/**
	 * 审批通过
	 */
	public static final int STATUS_CONFIRMED = 1;
	
	/**
	 * 审批未通过
	 */
	public static final int STATUS_NOT_CONFIRMED = 2;
	
	/**
	 * id
	 */
	private long id;
	
	/**
	 * 用户id
	 */
	private long uid;
	
	/**
	 * 球队id
	 */
	private int tid;
	
	/**
	 * 加入球队审批状态
	 */
	private int status;
	
	/**
	 * 如通过审批,表示用户加入球队时间
	 * 如未通过审批,表示拒绝的时间
	 * 如未审批,表示申请加入时间
	 */
	private Timestamp time;
	
	/**
	 * 申请留言
	 */
	private String msg;
	
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
}
