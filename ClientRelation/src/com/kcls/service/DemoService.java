package com.kcls.service;

import java.util.List;

import com.kcls.bean.Client;
import com.kcls.bean.ReceiveData;

public interface DemoService {
	
	public List<Client> dimSelectSize(ReceiveData data);
	
	public List<Client> dimSelectDemo(ReceiveData data);
	
	public void demoAdd(Client client);
	
	public void demoModify(Client client);
	
	public void demoDelete(Client client);
}
