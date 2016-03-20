package com.zmsport.iyuesai.mapper;

import com.zmsport.iyuesai.vo.GameContentVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ken.kang on 2016/2/25.
 */
public interface GameContentMapper {
    public int getTotalNum() ;

    List<GameContentVO> getGameContentByZoneAdministrator(int status, int page, int size, long creatId);
    List<GameContentVO> getGameContentBySystemAdministrator(int status, int page, int size);

    GameContent getGameContentById(long id);

    void insert(GameContent gameContent);

    void updateGameContent(GameContent gameContent);

    List<GameContent> getGameContentsByIds(List<String> ids);

    void delete(List<String> list);

    int getTotalNumByZoneAdministrator(int status, long creatId);

    int getTotalNumBySystemAdministrator(int status);

    Map<String, Object> map  = new HashMap<String, Object>();
}
