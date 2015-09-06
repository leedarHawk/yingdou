package com.zmsport.iyuesai.service;

import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zmsport.iyuesai.mapper.TeamAlbum;
import com.zmsport.iyuesai.mapper.TeamAlbumMapper;
/**
 * 球队图片service实现
 * @author bilei
 *
 */
@Service
public class TeamAlbumServiceImpl implements TeamAlbumService {

	@Autowired
	private TeamAlbumMapper mapper;
	
	@Override
	public void insert(TeamAlbum teamAlbum) {
		// TODO Auto-generated method stub
		mapper.insert(teamAlbum);
	}

	@Override
	public List<TeamAlbum> findTeamAlbumByTeamId(int teamId) {
		// TODO Auto-generated method stub
		return mapper.findTeamAlbumByTeamId(teamId);
	}

	@Override
	public void deleteAlbumByTeamId(int teamId) {
		// TODO Auto-generated method stub
		mapper.deleteAlbumByTeamId(teamId);
	}

	@Override
	public void deletePicById(String ids) {
		// TODO Auto-generated method stub
		List<String> list = Arrays.asList(ids.split(","));
		mapper.deletePicById(list);
	}

}
