package com.zmsport.iyuesai.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zmsport.iyuesai.mapper.GameApply;
import com.zmsport.iyuesai.mapper.GameApplyMapper;

/**
 * 赛事报名service实现
 * @author bilei
 *
 */
@Service
public class GameApplyServiceImpl implements GameApplyService {
	
	@Autowired
	private GameApplyMapper mapper;

	@Override
	public List<GameApply> getApplyByGameId(long gameId) {
		// TODO Auto-generated method stub
		return mapper.getApplyByGameId(gameId);
	}

	@Override
	public void add(GameApply gameApply) {
		// TODO Auto-generated method stub
		mapper.insert(gameApply);
	}

	@Override
	public void updateStatus(int status, long id) {
		// TODO Auto-generated method stub
		mapper.updateStatus(status, id);
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		mapper.delete(id);
	}

	@Override
	public int getStatusByGameIdAndCreatorId(long gameId, long creatorId) {
		// TODO Auto-generated method stub
		Integer result = mapper.getStatusByGameIdAndCreatorId(gameId, creatorId);
		if(null == result) {
			return -1;
		}else {
			return result.intValue();
		}
	}

	@Override
	public void deleteByGameId(String gameIds) {
		// TODO Auto-generated method stub
	}

	@Override
	public String getJoinedTeamIdsByGameId(long gameId) {
		// TODO Auto-generated method stub
		List<Integer> list =  mapper.getJoinedTeamIdsByGameId(gameId);
		StringBuilder ids = new StringBuilder();
		for(Integer id : list) {
			ids.append(id.toString()).append(",");
		}
		if(ids.length() > 0) {
			return ids.toString().substring(0, ids.toString().length() - 1);
		}else {
			return "-1";
		}
	}

	@Override
	public GameApply getApplyById(long id) {
		// TODO Auto-generated method stub
		return mapper.getApplyById(id);
	}

	@Override
	public void updateStatusByCreatorIdAndGameId(int status,long creatorId, long gameId) {
		// TODO Auto-generated method stub
		mapper.updateStatusByCreatorIdAndGameId(status,creatorId, gameId);
	}

	@Override
	public GameApply getApplyByGameIdAndCreatorId(long gameId, long creatorId) {
		// TODO Auto-generated method stub
		return mapper.getApplyByGameIdAndCreatorId(gameId, creatorId);
	}

	@Override
	public List<Map> getMyGames(long uid) {
		// TODO Auto-generated method stub
		return mapper.getMyGames(uid);
	}

}
