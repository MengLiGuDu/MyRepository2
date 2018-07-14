package com.kcls.service.logistice;

import java.util.List;

import com.kcls.bean.PageBean;

import com.kcls.bean.CheckBean;

public interface CheckService {
	public List<CheckBean> select();
	
	public Integer dimAllMessage(PageBean page);
	
	public List<CheckBean> dimPageMessage(PageBean page);
}
