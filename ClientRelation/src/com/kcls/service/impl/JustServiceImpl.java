package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.Person;
import com.kcls.bean.ReceiveData;
import com.kcls.mapper.JustMapper;
import com.kcls.service.JustService;

@Service(value="justService")
public class JustServiceImpl implements JustService{

	@Resource(name="justMapper")
	private JustMapper justMapper;

	@Override
	public List<Person> dimSelectSize(ReceiveData data) {
		List<Person> list = justMapper.dimSelectSize(data);
		return list;
	}

	@Override
	public List<Person> dimSelectJust(ReceiveData data) {
		List<Person> list = justMapper.dimSelectJust(data);
		return list;
	}

	@Override
	public void setJust(Person person) {
		justMapper.setJust(person);
	}

	@Override
	public void resetPassword(Person person) {
		justMapper.resetPassword(person);
	}
}
