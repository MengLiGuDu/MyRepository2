package com.kcls.service.logistice;

import java.util.List;

import com.kcls.bean.PageBean;
import com.kcls.bean.ReturnBean;
import com.kcls.bean.StorageBean;

public interface ReturnStorageService {
	public List<ReturnBean> select();

	public Integer dimAllMessage(PageBean page);
	
	public List<ReturnBean> dimPageMessage(PageBean page);
}
