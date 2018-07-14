package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.ReceiveData;
import com.kcls.bean.Relation;
import com.kcls.mapper.ClientRelationsMapper;
import com.kcls.service.ClientRelationsService;

@Service(value="clientRelationsService")
public class ClientRelationsServiceImpl implements ClientRelationsService{

	@Resource(name="clientRelationsMapper")
	private ClientRelationsMapper clientRelationsMapper;

	@Override
	public List<Relation> dimSelectSize(ReceiveData data) {
		List<Relation> list = clientRelationsMapper.dimSelectSize(data);
		return list;
	}

	@Override
	public List<Relation> dimSelectSellChance(ReceiveData data) {
		List<Relation> list = clientRelationsMapper.dimSelectSellChance(data);
		return list;
	}

	@Override
	public void addClientManage(Relation relation) {
		clientRelationsMapper.addClientManage(relation);
	}

}
