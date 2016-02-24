package com.zmsport.iyuesai.mapper;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * 管理员
 * @author bilei
 *
 */
public class Admin {

	/**
	 * 系统总管理员
	 */
	public static final int SYSTEM_ADMINISTRATOR = 1 ;

	/**
	 * 区域管理员
	 */
	public static final int ZONE_ADMINISTRATOR = 2 ;

	/**
	 * 有效的
	 */
	public static final int USEABLE = 1 ;

	/**
	 * 无效的
	 */
	public static final int UN_USEABLE = 0 ;

	/**
	 * id
	 */
	private long id;
	
	/**
	 * 用户名
	 */
	private String username;
	
	/**
	 * 密码
	 */
	private String password;
	
	/**
	 * 创建时间
	 */
	private Timestamp createTime;
	
	/**
	 * 修改时间
	 */
	private Timestamp updateTime;

	private  int status ;

	/**
	 * 用户类型，系统管理员和区域管理员
	 */
	private int type ;

	/**
	 * 如果是区域管理员，则显示所在的城市的ID
	 */
	private long cityId ;

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
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
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
	 * @return the updateTime
	 */
	public Timestamp getUpdateTime() {
		return updateTime;
	}

	/**
	 * @param updateTime the updateTime to set
	 */
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public long getCityId() {
		return cityId;
	}

	public void setCityId(long cityId) {
		this.cityId = cityId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
