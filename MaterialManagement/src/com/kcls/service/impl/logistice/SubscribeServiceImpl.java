package com.kcls.service.impl.logistice;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.mapper.logistice.SubscribeMapper;
import com.kcls.service.logistice.SubscribeService;

@Service
public class SubscribeServiceImpl implements SubscribeService {
	@Resource
	private SubscribeMapper subscribeMapper;
	@Override
	public List<HashMap<String, Object>> selectExamine() {
		
		return subscribeMapper.selectExamine();
	}
	@Override
	public Integer selectApplyCount(HashMap<String, Object> map) {
		
		return subscribeMapper.selectApplyCount(map);
	}
	@Override
	public List<HashMap<String, Object>> selectNotAlready() {
		
		return subscribeMapper.selectNotAlready();
	}
	@Override
	public List<HashMap<String, Object>> selectUntreated() {
		
		return subscribeMapper.selectUntreated();
	}
	@Override
	public List<HashMap<String, Object>> selectAlready() {
		
		return subscribeMapper.selectAlready();
	}
	@Override
	public List<HashMap<String, Object>> selectDraft() {
		
		return subscribeMapper.selectDraft();
	}
	

	

}
