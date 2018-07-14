package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.kcls.bean.Person;
import com.kcls.mapper.PersonMapper;
import com.kcls.service.PersonService;

@Controller("personService")
public class PersonServiceImpl implements PersonService{
	
	@Resource(name="personMapper")
	private PersonMapper personMapper;

	@Override
	public List<Person> selectManage() {
		List<Person> list = personMapper.selectManage();
		return list;
	}

	@Override
	public List<Person> selectStaff() {
		List<Person> list = personMapper.selectStaff();
		return list;
	}
}
