package com.zmsport.iyuesai.mapper;

import java.util.List;

/**
 * Created by ken.kang on 2016/2/25.
 */
public interface GameContentMapper {
    public int getTotalNum() ;

    List<GameContent> getGameContentByZoneAdministrator(int status, int page, int size, long creatId);
    List<GameContent> getGameContentBySystemAdministrator(int status, int page, int size);

    GameContent getGameContentById(long id);

    void insert(GameContent gameContent);

    void updateGameContent(GameContent gameContent);

    List<GameContent> getGameContentsByIds(String ids);

    void delete(List<String> list);
}
