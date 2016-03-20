package com.zmsport.iyuesai.service;

import com.zmsport.iyuesai.mapper.GameContent;
import com.zmsport.iyuesai.vo.GameContentVO;

import java.util.List;

/**
 * Created by ken.kang on 2016/2/25.
 */
public interface GameContentService {
    int getTotalNumByZoneAdministrator(int status, long creatId);
    int getTotalNumBySystemAdministrator(int status) ;

    List<GameContentVO> getGameContentByZoneAdministrator(int status, int page, int size, long creatId);
    List<GameContentVO> getGameContentBySystemAdministrator(int status, int page, int size);

    GameContent getGameContentById(long id);

    void insert(GameContent gameContent);

    void updateGameContent(GameContent gameContent);

    List<GameContent> getGameContentsByIds(String ids);

    void delete(String ids);
}
