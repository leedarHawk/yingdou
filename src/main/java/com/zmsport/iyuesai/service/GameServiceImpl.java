package com.zmsport.iyuesai.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zmsport.iyuesai.mapper.Game;
import com.zmsport.iyuesai.mapper.GameAnnouncementMapper;
import com.zmsport.iyuesai.mapper.GameApplyMapper;
import com.zmsport.iyuesai.mapper.GameMapper;

/**
 * 赛事服务
 * @author bilei
 *
 */
@Service
public class GameServiceImpl implements GameService {

	@Autowired
	private GameMapper mapper;
	
	@Autowired
	private GameApplyMapper gayMapper;
	
	@Autowired
	private GameAnnouncementMapper gaMapper;
	
	
	@Override
	public List<Game> getGames(int status,int page,int size) {
		// TODO Auto-generated method stub
		return mapper.getGamesByStatus(status,--page*size,size);
	}

	@Override
	public void publishGame(Game game) {
		// TODO Auto-generated method stub
		mapper.insert(game);
	}

	@Override
	public void updateGame(Game game) {
		// TODO Auto-generated method stub
		mapper.update(game);
	}

	@Override
	public Game getGamesById(long id) {
		// TODO Auto-generated method stub
		return mapper.getGamesById(id);
	}

	@Override
	public void delete(String ids) {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList<String>();
		String[] s = ids.split(",");
		for(String temp : s) {
			list.add(temp);
		}
		mapper.delete(list);
		//删除所有的公告
		gaMapper.deleteByGameId(list);
		//删除所有的报名信息
		gayMapper.deleteByGameId(list);
	}

	@Override
	public int getTotalNum() {
		// TODO Auto-generated method stub
		return mapper.getTotalNum();
	}

	@Override
	public List<Game> getGamesByIds(String ids) {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList<String>();
		String[] s = ids.split(",");
		for(String temp : s) {
			list.add(temp);
		}
		return mapper.getGamesByIds(list);
	}

	@Override
	public List<Game> getNewGames() {
		// TODO Auto-generated method stub
		List<Game> list = mapper.getNewGamesByAdmin();
		list.addAll(mapper.getNewGamesByUser());
		return list;
	}

}
