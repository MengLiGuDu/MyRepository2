package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.Order;
import com.kcls.bean.ReceiveData;
import com.kcls.mapper.OrderMapper;
import com.kcls.service.OrderService;

@Service(value="orderService")
public class OrderServiceImpl implements OrderService{

	@Resource(name="orderMapper")
	private OrderMapper orderMapper;

	@Override
	public List<Order> dimSelectSize(ReceiveData data) {
		List<Order> list = orderMapper.dimSelectSize(data);
		return list;
	}

	@Override
	public List<Order> dimSelectOrder(ReceiveData data) {
		List<Order> list = orderMapper.dimSelectOrder(data);
		return list;
	}

	@Override
	public void addOrder(Order order) {
		orderMapper.addOrder(order);
	}

	@Override
	public void updateStatus(Order order) {
		orderMapper.updateStatus(order);
	}

	@Override
	public void modifyOrder(Order order) {
		orderMapper.modifyOrder(order);
	}

	@Override
	public List<Order> sellDimSelectSize(ReceiveData data) {
		List<Order> list = orderMapper.sellDimSelectSize(data);
		return list;
	}

	@Override
	public List<Order> sellDimSelectOrder(ReceiveData data) {
		List<Order> list = orderMapper.sellDimSelectOrder(data);
		return list;
	}
}
