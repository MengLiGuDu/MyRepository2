package com.kcls.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.ApprovallimBean;
import com.kcls.mapper.ApprovallimMapper;
import com.kcls.service.ApprovallimService;

@Service
public class ApprovallimServiceImpl implements ApprovallimService {

	
	@Resource
	private ApprovallimMapper approvallimMapper;

	@Override
	public void addApprovallim(ApprovallimBean approvallim) {
		
		approvallimMapper.addApprovallim(approvallim);
	}

	@Override
	public List<HashMap<String, Object>> queryApprovallim(HashMap<String, Object> map) {
		
		return approvallimMapper.queryApprovallim(map);
	}

	@Override
	public Integer queryApprovallimCount(HashMap<String, Object> map) {
	
		return approvallimMapper.queryApprovallimCount(map);
	}

	@Override
	public List<ApprovallimBean> fillModApprovallim(ApprovallimBean approvallim) {
		
		return approvallimMapper.fillModApprovallim(approvallim);
	}

	@Override
	public void modApprovallim(ApprovallimBean approvallim) {
		
		approvallimMapper.modApprovallim(approvallim);
	}

	@Override
	public void delApprovallim(ApprovallimBean approvallim) {
		
		approvallimMapper.delApprovallim(approvallim);
	}

	
	
}
