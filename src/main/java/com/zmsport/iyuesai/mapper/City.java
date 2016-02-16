package com.zmsport.iyuesai.mapper;

/**
 * Created by ken.kang on 2016/2/16.
 */
public class City {

    public static final int USABLED = 1 ;

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
}
