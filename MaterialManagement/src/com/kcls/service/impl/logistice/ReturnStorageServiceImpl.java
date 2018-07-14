package com.kcls.service.impl.logistice;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.PageBean;
import com.kcls.bean.ReturnBean;
import com.kcls.bean.StorageBean;
import com.kcls.mapper.logistice.ReturnStorageMapper;
import com.kcls.mapper.logistice.StorageMapper;
import com.kcls.service.logistice.ReturnStorageService;

@Service("ReturnStorageService")
public class ReturnStorageServiceImpl implements ReturnStorageService{
	@Resource(name="returnStorageMapper")
	private ReturnStorageMapper map;
	
	@Override
	public List<ReturnBean> select() {
		List<ReturnBean> list = map.select();
		return list;
	}

	@Override
	public Integer dimAllMessage(PageBean page){
		return map.dimAllMessage(page);
	}

	@Override
	public List<ReturnBean> dimPageMessage(PageBean page) {
		List<ReturnBean> list = map.dimPageMessage(page);
		return list;
	}

}
