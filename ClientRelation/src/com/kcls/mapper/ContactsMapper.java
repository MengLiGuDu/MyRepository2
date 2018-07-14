package com.kcls.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kcls.bean.Contacts;
import com.kcls.bean.ReceiveData;

public interface ContactsMapper {

	@Select("select * from sms_2902_crm_contacts where name like concat('%',#{name},'%')")
	public List<Contacts> dimSelectSize(ReceiveData data);
	
	@Select("select * from sms_2902_crm_contacts where name like concat('%',#{name},'%') limit #{pageNumber},#{pageSize}")
	public List<Contacts> dimSelectSellContacts(ReceiveData data);
	
	@Insert("insert into sms_2902_crm_contacts(contacts_id,client_id,name,age,sex,position,phone,telephone) values(#{contacts_id},#{client_id},#{name},#{age},#{sex},#{position},#{phone},#{telephone})")
	public void addContacts(Contacts conteact);
	
	@Update("update sms_2902_crm_contacts set client_id=#{client_id},name=#{name},age=#{age},sex=#{sex},position=#{position},telephone=#{telephone} where contacts_id=#{contacts_id}")
	public void contactsModify(Contacts conteact);
	
	@Delete("delete from sms_2902_crm_contacts where contacts_id=#{contacts_id}")
	public void contactsDelete(Contacts conteact);
}
