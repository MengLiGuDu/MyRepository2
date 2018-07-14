package com.kcls.service.impl.logistice;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.CheckBean;
import com.kcls.bean.PageBean;
import com.kcls.bean.StorageBean;
import com.kcls.mapper.logistice.StorageMapper;
import com.kcls.service.logistice.StorageService;

@Service("StorageService")
public class StorageServiceImpl implements StorageService{
	@Resource(name="storageMapper")
	private StorageMapper map;
	
	@Override
	public List<StorageBean> select() {
		List<StorageBean> list = map.select();
		return list;
	}

	@Override
	public Integer dimAllMessage(PageBean page) {
		return map.dimAllMessage(page);
	}

	@Override
	public List<StorageBean> dimPageMessage(PageBean page) {
		List<StorageBean> list = map.dimPageMessage(page);
		return list;
	}

}
