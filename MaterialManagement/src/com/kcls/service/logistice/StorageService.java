package com.kcls.service.logistice;

import java.util.List;

import com.kcls.bean.CheckBean;
import com.kcls.bean.PageBean;
import com.kcls.bean.StorageBean;

public interface StorageService {
	public List<StorageBean> select();

	public Integer dimAllMessage(PageBean page);
	
	public List<StorageBean> dimPageMessage(PageBean page);
}
