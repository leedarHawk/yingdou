package com.zmsport.iyuesai.mapper;

import java.util.List;


/**
 * 赛事支付订单mapper
 * @author bilei
 *
 */
public interface OrderMapper {

	/**
	 * 订单列表
	 * @return
	 */
	public List<Order> listOrders();
	
	/**
	 * 插入
	 * @param order
	 */
	public void insert(Order order);
	
	/*
	 * 查询订单是否存在
	 */
	public int orderExist(String orderNo);
	
	/**
	 * 删除用户相关信息
	 * @param creatorId
	 */
	public void deleteByCreatorId(long creatorId);
}
