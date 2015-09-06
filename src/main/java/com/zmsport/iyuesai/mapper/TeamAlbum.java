package com.zmsport.iyuesai.mapper;

import java.sql.Timestamp;

/**
 * 球队相册
 * @author bilei
 *
 */
public class TeamAlbum {

	/**
	 * id
	 */
	private long id;
	
	/**
	 * 球队id
	 */
	private int teamId;
	
	/**
	 * 球队图片
	 */
	private String pic;
	
	/**
	 * 图片上传时间
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
