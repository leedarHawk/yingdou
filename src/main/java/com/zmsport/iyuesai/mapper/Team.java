package com.zmsport.iyuesai.mapper;

import java.sql.Timestamp;
import java.util.List;

/**
 * 球队
 * @author bilei
 *
 */
public class Team {

	/**
	 * 不需要审核
	 */
	public static final int NEED_CONFIRM_NO = 0;
	
	/**
	 * 需要审核
	 */
	public static final int NEED_CONFIRM_YES = 1;
	
	/**
	 * id
	 */
	private int id;
	
	/**
	 * 发起人id
	 */
	private long creatorId;
	
	/**
	 * 发起人
	 */
	private User creator;
	
	/**
	 * 球队名称
	 */
	private String name;
	
	/**
	 * 球队口号
	 */
	private String slogan;
	
	/**
	 * 球队成员数量
	 */
	private int members;
	
	/**
	 * 球队成员
	 */
	private List<User> member;
	
	/**
	 * 球队位置
	 */
	private String location;
	
	/**
	 * 球队描述
	 */
	private String description;
	
	/**
	 * 加入是否需要审核
	 */
	private int needConfirm;
	
	/**
	 * 需要参加者留下的信息
	 */
	private String candidateItems;

	/**
	 * 创建时间
	 */
	private Timestamp createTime;
	
	/**
	 * 球队logo
	 */
	private String pic;
	
	/**
	 * 点赞次数
	 */
	private int likes;
	
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
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the slogan
	 */
	public String getSlogan() {
		return slogan;
	}

	/**
	 * @param slogan the slogan to set
	 */
	public void setSlogan(String slogan) {
		this.slogan = slogan;
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
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the needConfirm
	 */
	public int getNeedConfirm() {
		return needConfirm;
	}

	/**
	 * @param needConfirm the needConfirm to set
	 */
	public void setNeedConfirm(int needConfirm) {
		this.needConfirm = needConfirm;
	}

	/**
	 * @return the candidateItems
	 */
	public String getCandidateItems() {
		return candidateItems;
	}

	/**
	 * @param candidateItems the candidateItems to set
	 */
	public void setCandidateItems(String candidateItems) {
		this.candidateItems = candidateItems;
	}

	/**
	 * @return the createTime
	 */
	public Timestamp getCreateTime() {
		return createTime;
	}

	/**
	 * @param createTime the createTime to set
	 */
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
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
	 * @return the creator
	 */
	public User getCreator() {
		return creator;
	}

	/**
	 * @param creator the creator to set
	 */
	public void setCreator(User creator) {
		this.creator = creator;
	}

	/**
	 * @return the members
	 */
	public int getMembers() {
		return members;
	}

	/**
	 * @param members the members to set
	 */
	public void setMembers(int members) {
		this.members = members;
	}

	/**
	 * @return the member
	 */
	public List<User> getMember() {
		return member;
	}

	/**
	 * @param member the member to set
	 */
	public void setMember(List<User> member) {
		this.member = member;
	}

	/**
	 * @return the likes
	 */
	public int getLikes() {
		return likes;
	}

	/**
	 * @param likes the likes to set
	 */
	public void setLikes(int likes) {
		this.likes = likes;
	}
}
