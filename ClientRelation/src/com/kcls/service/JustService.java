package com.kcls.service;

import java.util.List;

import com.kcls.bean.Person;
import com.kcls.bean.ReceiveData;

public interface JustService {

	public List<Person> dimSelectSize(ReceiveData data);
	
	public List<Person> dimSelectJust(ReceiveData data);
	
	public void setJust(Person person);
	
	public void resetPassword(Person person);
}
