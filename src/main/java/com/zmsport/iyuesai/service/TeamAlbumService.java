package com.zmsport.iyuesai.service;

import java.util.List;
import com.zmsport.iyuesai.mapper.TeamAlbum;

/**
 * 球队图片service
 * @author bilei
 *
 */
public interface TeamAlbumService {
	
	/**
	 * 增加一张球队图片
	 * @param teamAlbum
	 */
	public void insert(TeamAlbum teamAlbum);
	
	/**
	 * 获取某支球队所有的图片
	 * 按上传时间倒排
	 * @param teamId
	 * @return
	 */
	public List<TeamAlbum> findTeamAlbumByTeamId(int teamId);
	
	/**
	 * 删除某支球队所有图片
	 * @param teamId
	 */
	public void deleteAlbumByTeamId(int teamId);
	
	/**
	 * 删除某支球队若干图片
	 * @param ids
	 */
	public void deletePicById(String ids);
}
