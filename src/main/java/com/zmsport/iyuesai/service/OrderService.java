package com.zmsport.iyuesai.service;

import java.util.List;

import com.zmsport.iyuesai.mapper.Order;

/**
 * 赛事支付订单service
 * @author bilei
 *
 */
public interface OrderService {
	
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
