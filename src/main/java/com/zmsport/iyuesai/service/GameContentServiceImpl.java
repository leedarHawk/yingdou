package com.zmsport.iyuesai.service;

import com.zmsport.iyuesai.mapper.AdminMapper;
import com.zmsport.iyuesai.mapper.GameContent;
import com.zmsport.iyuesai.mapper.GameContentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 赛事内容
 */
@Service
public class GameContentServiceImpl implements GameContentService {

    @Autowired
    private GameContentMapper mapper;

    public int getTotalNum() {
        return mapper.getTotalNum();
    }

    public List<GameContent> getGameContentByZoneAdministrator(int status, int page, int size, long creatId){
        return mapper.getGameContentByZoneAdministrator(status,page, size, creatId) ;
    }
    public List<GameContent> getGameContentBySystemAdministrator(int status, int page, int size){
        return mapper.getGameContentBySystemAdministrator(status,page, size) ;
    }


    public GameContent getGameContentById(long id) {
        return mapper.getGameContentById(id);
    }

    public void insert(GameContent gameContent) {
        mapper.insert(gameContent) ;
    }

    public void updateGameContent(GameContent gameContent) {
        mapper.updateGameContent(gameContent) ;
    }

    public List<GameContent> getGameContentsByIds(String ids) {
        return  mapper.getGameContentsByIds(ids) ;
    }

    public void delete(String ids) {
        List<String> list = new ArrayList<String>();
        String[] s = ids.split(",");
        for(String temp : s) {
            list.add(temp);
        }
        mapper.delete(list);
    }
}
