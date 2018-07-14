package com.kcls.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kcls.bean.Client;
import com.kcls.bean.ReceiveData;

public interface ClientMapper {

	@Select("select * from sms_2901_crm_client where client_id=#{client_id}")
	public List<Client> select (Client client);

	@Select("select count(client_id) from sms_2901_crm_client where client_name like concat('%',#{name},'%')")
	public Integer allMessage(ReceiveData receive);
	
	@Select("select * from sms_2901_crm_client where client_name like concat('%',#{name},'%') limit #{pageNumber},#{pageSize}")
	public List<Client> pageMessage(ReceiveData receive);
	
	@Insert("insert into sms_2901_crm_client(client_id,client_name,name,address,grade,phone,postcode) values(#{client_id},#{client_name},#{name},#{address},#{grade},#{phone},#{postcode})")
	public void demoAdd(Client client);
	
	@Update("update sms_2901_crm_client set client_name = #{client_name},name=#{name},address=#{address},grade=#{grade},phone=#{phone},postcode=#{postcode} where client_id = #{client_id}")
	public void demoModify(Client client);

	@Delete("delete from sms_2901_crm_client where client_id = #{client_id}")
	public void demoDelete(Client client);
	
	@Select("select * from sms_2901_crm_client")
	public List<Client> selectAllClient();
}
