package com.kcls.service;

import java.util.List;

import com.kcls.bean.Person;

public interface PersonService {
	
	public List<Person> selectManage();
	
	public List<Person> selectStaff();
}
