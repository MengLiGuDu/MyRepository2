package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.Chance;
import com.kcls.bean.ReceiveData;
import com.kcls.mapper.SellChanceMapper;
import com.kcls.service.SellChanceService;

@Service(value="sellChanceService")
public class SellChanceServiceImpl implements SellChanceService{

	@Resource(name="sellChanceMapper")
	private SellChanceMapper sellChanceMapper;

	@Override
	public List<Chance> dimSelectSize(ReceiveData data) {
		List<Chance> list = sellChanceMapper.dimSelectSize(data);
		return list;
	}

	@Override
	public List<Chance> dimSelectSellChance(ReceiveData data) {
		List<Chance> list = sellChanceMapper.dimSelectSellChance(data);
		return list;
	}

	@Override
	public void addChance(Chance chance) {
		sellChanceMapper.addChance(chance);
		
	}

	@Override
	public void sellChanceDelete(Chance chance) {
		sellChanceMapper.sellChanceDelete(chance);
	}

	@Override
	public void sellChanceModify(Chance chance) {
		sellChanceMapper.sellChanceModify(chance);
	}
}
