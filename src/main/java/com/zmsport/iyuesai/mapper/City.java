package com.zmsport.iyuesai.mapper;

import java.sql.Timestamp;

/**
 * Created by ken.kang on 2016/2/16.
 */
public class City {

    //正在线上
    public static final int USABLED = 1 ;

    //已下线
    public static final int UN_USABLED = 0 ;
    /**
    * ID
     */
    private long id;

    /**
     * 城市名称
     */
    private String cityName ;

    /**
     * city status
     * 1=有效的，0=无效的
     */
    private int status ;

    /**
     * 创建时间
     */
    private Timestamp createTime;

    /**
     * 修改时间
     */
    private Timestamp updateTime;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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
}
