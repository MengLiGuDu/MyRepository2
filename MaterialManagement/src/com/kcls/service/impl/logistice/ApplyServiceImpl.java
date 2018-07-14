package com.kcls.service.impl.logistice;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.TypeBean;
import com.kcls.mapper.logistice.ApplyMapper;
import com.kcls.service.logistice.ApplyService;

@Service
public class ApplyServiceImpl implements ApplyService{

	@Resource
	private ApplyMapper applyMapper;

	@Override
	public void addApply(HashMap<String,Object> map) {
		
		applyMapper.addApply(map);
	}

	@Override
	public void addBorrow(HashMap<String,Object> map) {
		
		applyMapper.addBorrow(map);
	}

	@Override
	public List<TypeBean> typeCheck() {
		
		return applyMapper.typeCheck();
	}

	@Override
	public List<HashMap<String, Object>> queryBorrow(HashMap<String, Object> map) {
		
		return applyMapper.queryBorrow(map);
	}

	@Override
	public List<HashMap<String, Object>> queryBorrowCount(HashMap<String, Object> map) {
		
		return applyMapper.queryBorrowCount(map);
	}

	@Override
	public List<HashMap<String, Object>> detailBorrow(HashMap<String, Object> map) {
		
		return applyMapper.detailBorrow(map);
	}
	
	@Override
	public void withdrawApply(HashMap<String, Object> map) {
		
		applyMapper.withdrawApply(map);
	}

	@Override
	public void addDraftApply(HashMap<String, Object> map) {
		
		applyMapper.addDraftApply(map);
	}
	
}
