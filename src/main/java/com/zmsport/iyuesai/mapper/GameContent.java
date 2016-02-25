package com.zmsport.iyuesai.mapper;

import java.sql.Timestamp;

public class GameContent {

    public static final int GAME_CONTENT_USEABLE = 1 ;

    public static final int GAME_CONTENT_UNUSEABLE = 0 ;

    private long id ;

    private String title ;

    private int content ;

    private long gameId ;

    private long cityId ;

    private int status ;

    private long creatId ;

    /**
     * 赛事创建时间
     */
    private Timestamp createTime;

    /**
     * 赛事更新时间
     */
    private Timestamp updateTime;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getContent() {
        return content;
    }

    public void setContent(int content) {
        this.content = content;
    }

    public long getGameId() {
        return gameId;
    }

    public void setGameId(long gameId) {
        this.gameId = gameId;
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

    public long getCreatId() {
        return creatId;
    }

    public void setCreatId(long creatId) {
        this.creatId = creatId;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }
}
