package com.zmsport.iyuesai.service;

import com.zmsport.iyuesai.mapper.Admin;
import com.zmsport.iyuesai.mapper.City;

import java.util.List;

/**
 * 城市管理相关服务
 * @author bilei
 *
 */
public interface CityService {
	/**
	 * 查询城市
	 * @param cityName
	 * @return
	 */
	public City findCityByName(String cityName);
	
	/**
	 * 分页获取城市列表
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List<City> getCitys(int page, int pageSize);
	
	/**
	 * 获取城市总数
	 * @return
	 */
	public int getTotalNum();
	
	/**
	 * 插入
	 * @param city
	 */
	public void insert(City city);
	
	/**
	 * 修改
	 * @param city
	 */
	public void update(City city);
	
	/**
	 * 查找城市
	 * @param id
	 * @return
	 */
	public City findCityById(long id);
	
	/**
	 * 删除城市
	 * @param ids
	 */
	public void delete(String ids);

	void changeStatus(String id, int status);
}
