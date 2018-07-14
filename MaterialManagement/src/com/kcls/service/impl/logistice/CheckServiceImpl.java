package com.kcls.service.impl.logistice;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.CheckBean;
import com.kcls.bean.PageBean;
import com.kcls.mapper.logistice.CheckMapper;
import com.kcls.service.logistice.CheckService;

@Service("CheckService")
public class CheckServiceImpl implements CheckService{
	@Resource(name="checkMapper")
	private CheckMapper checkmap;

	
	@Override
	public List<CheckBean> select() {
		List<CheckBean> list = checkmap.select();
		return list;
	}


	@Override
	public Integer dimAllMessage(PageBean page) {
		return checkmap.dimAllMessage(page);
	}

	@Override
	public List<CheckBean> dimPageMessage(PageBean page) {
		List<CheckBean> list = checkmap.dimPageMessage(page);
		return list;
	}
	
}
