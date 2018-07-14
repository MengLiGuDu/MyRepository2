package com.kcls.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.kcls.bean.Person;

public interface PersonMapper {

	@Select("select * from sms_2903_crm_person where position = 0")
	public List<Person> selectManage();
	
	@Select("select * from sms_2903_crm_person where position = 1")
	public List<Person> selectStaff();
}
