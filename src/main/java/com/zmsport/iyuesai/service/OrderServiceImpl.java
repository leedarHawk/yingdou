package com.zmsport.iyuesai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zmsport.iyuesai.mapper.Order;
import com.zmsport.iyuesai.mapper.OrderMapper;
/**
 * 赛事支付订单service实现
 * @author bilei
 *
 */
@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper mapper;

	@Override
	public List<Order> listOrders() {
		// TODO Auto-generated method stub
		return mapper.listOrders();
	}

	@Override
	public void insert(Order order) {
		// TODO Auto-generated method stub
		mapper.insert(order);
	}

	@Override
	public int orderExist(String orderNo) {
		// TODO Auto-generated method stub
		return mapper.orderExist(orderNo);
	}

}
