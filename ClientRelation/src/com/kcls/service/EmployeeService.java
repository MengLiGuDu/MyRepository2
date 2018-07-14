package com.kcls.service;

import java.util.List;

import com.kcls.bean.Person;
import com.kcls.bean.ReceiveData;

public interface EmployeeService {
	
	public Integer allMessage(ReceiveData receive);
	
	public List<Person> pageMessage(ReceiveData receive);
	
	public void insertPerson(Person person);
	
	public void deletePerson(Person person);
	
	public List<Person> findList(Person person);
	
	public void modifyEmployee(Person person);
	
	public void modigyStatus(Person person);
	
	public List<Person> selectAllPerson();
}
