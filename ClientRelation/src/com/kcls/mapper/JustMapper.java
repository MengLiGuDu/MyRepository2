package com.kcls.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kcls.bean.Person;
import com.kcls.bean.ReceiveData;

public interface JustMapper {

	@Select("select * from sms_2903_crm_person where name like concat('%',#{name},'%')")
	public List<Person> dimSelectSize(ReceiveData receive);
	
	@Select("select * from sms_2903_crm_person where name like concat('%',#{name},'%') limit #{pageNumber},#{pageSize}")
	public List<Person> dimSelectJust(ReceiveData receive);
	
	@Update("update sms_2903_crm_person set position =#{position} where name=#{name}")
	public void setJust(Person person);
	
	@Update("update sms_2903_crm_person set password = 123456 where name=#{name}")
	public void resetPassword(Person person);
}
