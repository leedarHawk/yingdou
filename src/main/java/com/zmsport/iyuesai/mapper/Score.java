package com.zmsport.iyuesai.mapper;

/**
 * 赛事各球队成绩
 * @author bilei
 *
 */
public class Score {

	/**
	 * id
	 */
	private long id;
	
	/**
	 * 球队id
	 */
	private int tid;
	
	/**
	 * 球队
	 */
	private Team team;
	
	/**
	 * 赛事id
	 */
	private long gameId;
	
	/**
	 * 比赛场次
	 */
	private int round;
	
	/**
	 * 胜场次
	 */
	private int win;
	
	/**
	 * 输场次
	 */
	private int lose;

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
	 * @return the round
	 */
	public int getRound() {
		return round;
	}

	/**
	 * @param round the round to set
	 */
	public void setRound(int round) {
		this.round = round;
	}

	/**
	 * @return the win
	 */
	public int getWin() {
		return win;
	}

	/**
	 * @param win the win to set
	 */
	public void setWin(int win) {
		this.win = win;
	}

	/**
	 * @return the lose
	 */
	public int getLose() {
		return lose;
	}

	/**
	 * @param lose the lose to set
	 */
	public void setLose(int lose) {
		this.lose = lose;
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
}
