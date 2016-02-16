package com.zmsport.iyuesai.mapper;

import java.util.List;

/**
 * 管理员mapper
 * @author bilei
 *
 */
public interface CityMapper {
	/**
	 * 根据城市名称称查询
	 * @param cityName
	 * @return
	 */
	public Admin findCityByName(String cityName);
	
	/**
	 * 分页获取管理员列表
	 * @param start
	 * @param end
	 * @return
	 */
	public List<City> getCitys(int start, int end);
	
	/**
	 * 获取管理员总数
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
	 * @param admin
	 */
	public void update(Admin admin);

	/**
	 * 修改城市的状态
	 * @param id
	 * @param status
     */
	public void changeCityStatus(long id, int status) ;
	
	/**
	 * 查找管理员
	 * @param id
	 * @return
	 */
	public City findCityById(long id);
	
	/**
	 * 删除管理员
	 * @param ids
	 */
	public void delete(List<String> ids);
}
