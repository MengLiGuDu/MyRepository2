package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;




import com.kcls.bean.Client;
import com.kcls.bean.Person;
import com.kcls.bean.ReceiveData;
import com.kcls.mapper.ClientMapper;
import com.kcls.service.ClientService;
@Service(value="clientService")
public class ClientServiceImpl implements ClientService{
      
	@Resource(name="clientMapper")
	public ClientMapper clientMapper;
	
	


	@Override
	public void demoDelete(Client client) {
		clientMapper.demoDelete(client);		
	}


	@Override
	public void demoAdd(Client client) {
		clientMapper.demoAdd(client);

	}





	@Override
	public List<Client> demoModify(Client client) {
		clientMapper.demoModify(client);
		return null;
	}


	@Override
	public Integer allMessage(ReceiveData receive) {
		return clientMapper.allMessage(receive);
	}


	@Override
	public List<Client> pageMessage(ReceiveData receive) {
		List <Client> list =clientMapper.pageMessage(receive);
		return list;
	}


	@Override
	public List<Client> select() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Client> select(Client client) {
		List<Client> list = clientMapper.select(client);
		if(list != null){
			return list;
		}
		return null;
	}


	@Override
	public List<Client> selectAllClient() {
		List<Client> list = clientMapper.selectAllClient();
		return list;
	}
}
