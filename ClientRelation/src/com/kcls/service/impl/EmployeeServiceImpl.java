package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;




import org.springframework.stereotype.Service;

import com.kcls.bean.Person;
import com.kcls.bean.ReceiveData;
import com.kcls.mapper.EmployeeMapper;
import com.kcls.service.EmployeeService;


@Service(value="employeeService")
public class EmployeeServiceImpl implements EmployeeService {
	
	
	@Resource(name="employeeMapper")
	public EmployeeMapper employeeMapper;
	@Override
	public Integer allMessage(ReceiveData receive) {
		return employeeMapper.allMessage(receive);
	}

	@Override
	public List<Person> pageMessage(ReceiveData receive) {
		List<Person> list = employeeMapper.pageMessage(receive);
		return list;
	}

	@Override
	public void insertPerson(Person person) {
		employeeMapper.insertPerson(person);
	}

	@Override
	public void deletePerson(Person person) {
		employeeMapper.deletePerson(person);
	}

	@Override
	public List<Person> findList(Person person) {
		List<Person> list = employeeMapper.findList(person);
		if(list != null){
			return list;
		}
		return null;
	}

	@Override
	public void modifyEmployee(Person person) {
		employeeMapper.modifyEmployee(person);
	}

	@Override
	public void modigyStatus(Person person) {
		employeeMapper.modigyStatus(person);
	}

	@Override
	public List<Person> selectAllPerson() {
		List<Person> list = employeeMapper.selectAllPerson();
		return list;
	}
}
