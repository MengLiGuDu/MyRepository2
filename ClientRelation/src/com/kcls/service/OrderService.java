package com.kcls.service;

import java.util.List;

import com.kcls.bean.Order;
import com.kcls.bean.ReceiveData;

public interface OrderService {
	
	public List<Order> dimSelectSize(ReceiveData data);
	
	public List<Order> dimSelectOrder(ReceiveData data);
	
	public List<Order> sellDimSelectSize(ReceiveData data);
	
	public List<Order> sellDimSelectOrder(ReceiveData data);
	
	public void addOrder(Order order);
	
	public void updateStatus(Order order);
	
	public void modifyOrder(Order order);
	
}
