package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.Page;
import com.kcls.bean.SubScribeBean;
import com.kcls.mapper.PendingTrialSubscribeMapper;
import com.kcls.service.PendingTrialSubscribeService;

/*
 * ¥˝…Û…Íπ∫
 */
@Service(value="pendingTrialSubscribeService")
public class PendingTrialSubscribeServiceImpl implements PendingTrialSubscribeService {

	@Resource(name="pendingTrialSubscribeMapper")
	private PendingTrialSubscribeMapper pendingTrialSubscribeMapper;
	
	@Override
	public List<SubScribeBean> selectCount(Page page) {
		return pendingTrialSubscribeMapper.selectCount(page);
	}

	@Override
	public List<SubScribeBean> selectPendingTrialSubscribe(Page page) {
		return pendingTrialSubscribeMapper.selectPendingTrialSubscribe(page);
	}

	@Override
	public void revocationPendingTrialSubscribe(SubScribeBean bean) {
		pendingTrialSubscribeMapper.revocationPendingTrialSubscribe(bean);
	}

}
