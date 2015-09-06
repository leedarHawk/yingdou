package com.zmsport.iyuesai.mapper;

/**
 * 用户赛事评分
 * @author bilei
 *
 */
public class UserScore {

	/**
	 * id
	 */
	private long id;
	
	/**
	 * 用户id
	 */
	private long uid;
	
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
	private String teamName;
	
	/**
	 * 赛事id
	 */
	private long gameId;
	
	/**
	 * 评分
	 */
	private int score;

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
	 * @return the score
	 */
	public int getScore() {
		return score;
	}

	/**
	 * @param score the score to set
	 */
	public void setScore(int score) {
		this.score = score;
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
	 * @return the teamName
	 */
	public String getTeamName() {
		return teamName;
	}

	/**
	 * @param team the team to set
	 */
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
}
