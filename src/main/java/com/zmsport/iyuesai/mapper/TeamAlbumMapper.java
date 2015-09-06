package com.zmsport.iyuesai.mapper;

import java.util.List;

/**
 * 球队相册mapper
 * @author bilei
 *
 */
public interface TeamAlbumMapper {

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
	public void deletePicById(List<String> ids);
}
