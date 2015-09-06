package com.zmsport.iyuesai.mapper;

import java.sql.Timestamp;

/**
 * 用户对球队点赞记录
 * @author bilei
 *
 */
public class UserTeamLike {

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
	 * 点赞时间
	 */
	private Timestamp time;

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
}
