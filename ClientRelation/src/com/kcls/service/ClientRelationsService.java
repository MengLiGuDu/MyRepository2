package com.kcls.service;

import java.util.List;

import com.kcls.bean.ReceiveData;
import com.kcls.bean.Relation;

public interface ClientRelationsService {

	public List<Relation> dimSelectSize(ReceiveData data);
	
	public List<Relation> dimSelectSellChance(ReceiveData data);
	
	public void addClientManage(Relation relation);
	
}
