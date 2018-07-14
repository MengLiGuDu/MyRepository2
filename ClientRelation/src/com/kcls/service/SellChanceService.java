package com.kcls.service;

import java.util.List;

import com.kcls.bean.Chance;
import com.kcls.bean.ReceiveData;

public interface SellChanceService {

	public List<Chance> dimSelectSize(ReceiveData data);
	
	public List<Chance> dimSelectSellChance(ReceiveData data);
	
	public void addChance(Chance chance);
	
	public void sellChanceDelete(Chance chance);
	
	public void sellChanceModify(Chance chance);
	
}
