package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.Client;
import com.kcls.bean.ReceiveData;
import com.kcls.mapper.DemoMapper;
import com.kcls.service.DemoService;

@Service(value="demoService")
public class DemoServiceImpl implements DemoService{
	
	@Resource(name="demoMapper")
	private DemoMapper demoMapper;
	
	@Override
	public List<Client> dimSelectSize(ReceiveData data) {
		List<Client> list = demoMapper.dimSelectSize(data);
		return list;
	}

	@Override
	public List<Client> dimSelectDemo(ReceiveData data) {
		List<Client> list = demoMapper.dimSelectDemo(data);
		return list;
	}

	@Override
	public void demoAdd(Client client) {
		demoMapper.demoAdd(client);
		
	}

	@Override
	public void demoModify(Client client) {
		demoMapper.demoModify(client);
		
	}

	@Override
	public void demoDelete(Client client) {
		demoMapper.demoDelete(client);
		
	}

}
