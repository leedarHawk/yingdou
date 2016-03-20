package com.zmsport.iyuesai.service;

import com.zmsport.iyuesai.mapper.AdminMapper;
import com.zmsport.iyuesai.mapper.GameContent;
import com.zmsport.iyuesai.mapper.GameContentMapper;
import com.zmsport.iyuesai.vo.GameContentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 赛事内容
 */
@Service
public class GameContentServiceImpl implements GameContentService {

    @Autowired
    private GameContentMapper mapper;

    public int getTotalNumByZoneAdministrator(int status, long creatId){
        return mapper.getTotalNumByZoneAdministrator(status, creatId) ;
    }
    public int getTotalNumBySystemAdministrator(int status) {
        return mapper.getTotalNumBySystemAdministrator(status) ;
    }

    public List<GameContentVO> getGameContentByZoneAdministrator(int status, int page, int size, long creatId){
        return  mapper.getGameContentByZoneAdministrator(status,--page*size, size, creatId) ;
    }
    public List<GameContentVO> getGameContentBySystemAdministrator(int status, int page, int size){
        return mapper.getGameContentBySystemAdministrator(status,--page*size, size) ;
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
        List<String> list = new ArrayList<String>();
        String[] s = ids.split(",");
        for(String temp : s) {
            list.add(temp);
        }
        return mapper.getGameContentsByIds(list);
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
