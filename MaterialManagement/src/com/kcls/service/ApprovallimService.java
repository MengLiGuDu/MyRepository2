package com.kcls.service;

import java.util.HashMap;
import java.util.List;


import com.kcls.bean.ApprovallimBean;

public interface ApprovallimService {

	public void addApprovallim(ApprovallimBean approvallim);
	
	public List<HashMap<String, Object>> queryApprovallim(HashMap<String, Object> map);
	
	public Integer queryApprovallimCount(HashMap<String, Object> map);
	
	public List<ApprovallimBean> fillModApprovallim(ApprovallimBean approvallim);
	
	public void modApprovallim(ApprovallimBean approvallim);
	
	public void delApprovallim(ApprovallimBean approvallim);
}
