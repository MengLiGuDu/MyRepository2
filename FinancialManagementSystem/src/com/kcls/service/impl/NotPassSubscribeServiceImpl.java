package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.Page;
import com.kcls.bean.SubScribeBean;
import com.kcls.mapper.NotPassSubscribeMapper;
import com.kcls.service.NotPassSubscribeService;

@Service("notPassSubscribeService")
public class NotPassSubscribeServiceImpl implements NotPassSubscribeService{
	@Resource(name="notPassSubscribeMapper")
	public NotPassSubscribeMapper mapper;

	@Override
	public List<SubScribeBean> getNotPassSubscribe(Page bean) {
		return mapper.getNotPassSubscribe(bean);
	}

	@Override
	public Integer getNotPassSubscribeCount(Page bean) {
		return mapper.getNotPassSubscribeCount(bean);
	}

	@Override
	public void notPassSubscribeDelete(SubScribeBean bean) {
		mapper.notPassSubscribeDelete(bean);
	}

	@Override
	public void notPassSubscribeAgainSubmit(SubScribeBean bean) {
		mapper.notPassSubscribeAgainSubmit(bean);
	}

	@Override
	public List<SubScribeBean> selectANotPassSubscribe(SubScribeBean bean) {
		return mapper.selectANotPassSubscribe(bean);
	}

	@Override
	public void notPassSubscribeUpdate(SubScribeBean bean) {
		mapper.notPassSubscribeUpdate(bean);
	}
	
	
}
