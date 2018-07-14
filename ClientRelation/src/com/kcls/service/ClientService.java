package com.kcls.service;

import java.util.List;

import com.kcls.bean.Client;
import com.kcls.bean.ReceiveData;


public interface ClientService {
	
	public List<Client>select();
	
	public void demoAdd(Client client);
	
	public List<Client> demoModify(Client client);
	
	public void demoDelete(Client client);
		
	public Integer allMessage(ReceiveData receive);
	
	public List<Client> pageMessage(ReceiveData receive);
	
	public List<Client> select (Client client);
	
	public List<Client> selectAllClient();

}
