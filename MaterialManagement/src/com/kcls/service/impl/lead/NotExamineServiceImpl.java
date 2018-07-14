package com.kcls.service.impl.lead;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.mapper.lead.NotExamineMapper;
import com.kcls.service.lead.NotExamineService;
@Service
public class NotExamineServiceImpl implements NotExamineService {
	@Resource
	private NotExamineMapper notExamineMapper;
	@Override
	public List<HashMap<String, Object>> selectSubscribe() {
		
		return notExamineMapper.selectSubscribe();
	}

	@Override
	public Integer selectApplyCount(HashMap<String, Object> map) {
		return notExamineMapper.selectApplyCount(map);
	}

	@Override
	public List<HashMap<String, Object>> selectReceive() {
		
		return notExamineMapper.selectReceive();
	}

	@Override
	public List<HashMap<String, Object>> selectBorrow() {
	
		return notExamineMapper.selectBorrow();
	}

	@Override
	public List<HashMap<String, Object>> selectCheck() {
		
		return notExamineMapper.selectCheck();
	}

}
