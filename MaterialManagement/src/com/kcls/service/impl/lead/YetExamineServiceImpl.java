package com.kcls.service.impl.lead;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.mapper.lead.YetExamineMapper;
import com.kcls.service.lead.YetExamineService;
@Service
public class YetExamineServiceImpl implements YetExamineService {
	@Resource
	private YetExamineMapper yetExamineMapper;
	@Override
	public List<HashMap<String, Object>> selectSubscribe() {
		
		return yetExamineMapper.selectSubscribe();
	}

	@Override
	public Integer selectApplyCount(HashMap<String, Object> map) {
		return yetExamineMapper.selectApplyCount(map);
	}

	@Override
	public List<HashMap<String, Object>> selectReceive() {
		
		return yetExamineMapper.selectReceive();
	}

	@Override
	public List<HashMap<String, Object>> selectBorrow() {
	
		return yetExamineMapper.selectBorrow();
	}

	@Override
	public List<HashMap<String, Object>> selectCheck() {
		
		return yetExamineMapper.selectCheck();
	}

}
