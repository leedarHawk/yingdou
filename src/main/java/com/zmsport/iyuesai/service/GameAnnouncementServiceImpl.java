package com.zmsport.iyuesai.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zmsport.iyuesai.mapper.GameAnnouncement;
import com.zmsport.iyuesai.mapper.GameAnnouncementMapper;

/**
 * 赛事公告service实现
 * @author bilei
 *
 */
@Service
public class GameAnnouncementServiceImpl implements GameAnnouncementService {

	@Autowired
	private GameAnnouncementMapper mapper;
	
	@Override
	public List<GameAnnouncement> findAnnouncementByGameId(long gameId,
			int page, int size) {
		// TODO Auto-generated method stub
		return mapper.findAnnouncementByGameId(gameId, --page * size, size);
	}

	@Override
	public void insert(GameAnnouncement gameAnnouncement) {
		// TODO Auto-generated method stub
		mapper.insert(gameAnnouncement);
	}

	@Override
	public void update(GameAnnouncement gameAnnouncement) {
		// TODO Auto-generated method stub
		mapper.update(gameAnnouncement);
	}

	@Override
	public void delete(String ids) {
		// TODO Auto-generated method stub
		List<String> idList = new ArrayList<String>();
		for(String id : ids.split(",")) {
			idList.add(id);
		}
		mapper.delete(idList);
	}

	@Override
	public GameAnnouncement findAnnouncementById(long id) {
		// TODO Auto-generated method stub
		return mapper.findAnnouncementById(id);
	}

	@Override
	public int getTotalNum(long gameId) {
		// TODO Auto-generated method stub
		return mapper.getTotalNum(gameId);
	}

	@Override
	public List<GameAnnouncement> findAllAnnouncementByGameId(long gameId) {
		// TODO Auto-generated method stub
		return mapper.findAllAnnouncementByGameId(gameId);
	}

	@Override
	public void deleteByGameId(String gameIds) {
		// TODO Auto-generated method stub
	}

}
