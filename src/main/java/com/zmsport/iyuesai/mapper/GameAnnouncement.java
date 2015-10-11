package com.zmsport.iyuesai.mapper;

import java.sql.Timestamp;


/**
 * 赛事公告
 * @author bilei
 *
 */
public class GameAnnouncement {

	/**
	 * id
	 */
	private int id;
	
	/**
	 * 赛事id
	 */
	private long gameId;
	
	/**
	 * 公告标题
	 */
	private String annoTitle ;
	
	/**
	 * 公告内容
	 */
	private String content;
	
	/**
	 * 发布时间
	 */
	private Timestamp time;

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
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
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

	public String getAnnoTitle() { return annoTitle; }

	public void setAnnoTitle(String annoTitle) { this.annoTitle = annoTitle; }
}
