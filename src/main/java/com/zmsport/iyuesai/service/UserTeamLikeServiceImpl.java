package com.zmsport.iyuesai.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zmsport.iyuesai.mapper.UserTeamLike;
import com.zmsport.iyuesai.mapper.UserTeamLikeMapper;

/**
 * 用户对球队点赞记录service实现
 * @author bilei
 *
 */
@Service
public class UserTeamLikeServiceImpl implements UserTeamLikeService {
	
	@Autowired
	private UserTeamLikeMapper mapper;

	@Override
	public void insert(UserTeamLike utl) {
		// TODO Auto-generated method stub
		mapper.insert(utl);
	}

	@Override
	public int alreadyLiked(long uid, int tid) {
		// TODO Auto-generated method stub
		return mapper.findLike(uid, tid);
	}

	@Override
	public void deleteByUid(long uid) {
		// TODO Auto-generated method stub
		mapper.deleteByUid(uid);
	}

	@Override
	public void deleteLike(int tid, long uid) {
		// TODO Auto-generated method stub
		mapper.deleteLike(tid, uid);
	}

}
