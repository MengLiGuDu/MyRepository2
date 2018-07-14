package com.kcls.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kcls.bean.Order;
import com.kcls.bean.ReceiveData;

public interface OrderMapper {

	@Select("select * from sms_2906_crm_order where person_id like concat('%',#{name},'%')")
	public List<Order> dimSelectSize(ReceiveData data);
	
	@Select("select * from sms_2906_crm_order where person_id like concat('%',#{name},'%') limit #{pageNumber},#{pageSize}")
	public List<Order> dimSelectOrder(ReceiveData data);
	
	@Select("select * from sms_2906_crm_order where status = 1 and person_id like concat('%',#{name},'%')")
	public List<Order> sellDimSelectSize(ReceiveData data);
	
	@Select("select * from sms_2906_crm_order where status = 1 and person_id like concat('%',#{name},'%') limit #{pageNumber},#{pageSize}")
	public List<Order> sellDimSelectOrder(ReceiveData data);
	
	@Insert("insert into sms_2906_crm_order(order_id,product_id,person_id,client_id,count,price,status,create_time,remark) values(#{order_id},#{product_id},#{person_id},#{client_id},#{count},#{price},#{status},#{create_time},#{remark})")
	public void addOrder(Order order);

	@Update("update sms_2906_crm_order set status=#{status} where order_id=#{order_id}")
	public void updateStatus(Order order);
	
	@Update("update sms_2906_crm_order set product_id=#{product_id},person_id=#{person_id},client_id=#{client_id},count=#{count},price=#{price},status=#{status},remark=#{remark} where order_id=#{order_id}")
	public void modifyOrder(Order order);
}
