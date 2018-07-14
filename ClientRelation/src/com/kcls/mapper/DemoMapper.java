package com.kcls.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kcls.bean.Client;
import com.kcls.bean.ReceiveData;

public interface DemoMapper {
	
	
	@Select("select * from sms_2901_crm_client where client_name like CONCAT('%',#{name},'%')")
	public List<Client> dimSelectSize(ReceiveData data);
	
	@Select("select * from sms_2901_crm_client where client_name like CONCAT('%',#{name},'%') limit #{pageNumber},#{pageSize}")
	public List<Client> dimSelectDemo(ReceiveData data);
	
	@Insert("insert into sms_2901_crm_client(client_id,client_name,address,grade,phone,postcode) values(#{client_id},#{client_name},'1','1','1','1')")
	public void demoAdd(Client client);
	
	@Update("update sms_2901_crm_client set client_name = #{client_name} where client_id = #{client_id}")
	public void demoModify(Client client);
	
	@Delete("delete from sms_2901_crm_client where client_id = #{client_id}")
	public void demoDelete(Client client);
}
