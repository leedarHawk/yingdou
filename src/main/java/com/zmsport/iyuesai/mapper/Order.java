package com.zmsport.iyuesai.mapper;

import java.sql.Timestamp;

/**
 * 赛事支付订单
 * @author bilei
 *
 */
public class Order {

	/**
	 * id
	 */
	private long id;
	
	/**
	 * 赛事id
	 */
	private long gameId;
	
	/**
	 * 球队id
	 */
	private int teamId;
	
	/**
	 * 创建者id
	 */
	private long creatorId;
	
	/**
	 * 费用
	 */
	private int fee;
	
	/**
	 * 订单号
	 */
	private String orderNo;
	
	/**
	 * 订单名称
	 */
	private String orderName;
	
	/**
	 * 支付时间
	 */
	private Timestamp payTime;
	
	/**
	 * 报名球队
	 */
	private Team team;
	
	/**
	 * 赛事
	 */
	private Game game;
	
	/**
	 * 创建者
	 */
	private User user;

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
	 * @return the orderNo
	 */
	public String getOrderNo() {
		return orderNo;
	}

	/**
	 * @param orderNo the orderNo to set
	 */
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	/**
	 * @return the orderName
	 */
	public String getOrderName() {
		return orderName;
	}

	/**
	 * @param orderName the orderName to set
	 */
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	/**
	 * @return the payTime
	 */
	public Timestamp getPayTime() {
		return payTime;
	}

	/**
	 * @param payTime the payTime to set
	 */
	public void setPayTime(Timestamp payTime) {
		this.payTime = payTime;
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
	 * @return the game
	 */
	public Game getGame() {
		return game;
	}

	/**
	 * @param game the game to set
	 */
	public void setGame(Game game) {
		this.game = game;
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

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder();
		sb.append("订单号:").append(this.orderNo).append(";订单名称:").append(this.orderName);
		return sb.toString();
	}
}
