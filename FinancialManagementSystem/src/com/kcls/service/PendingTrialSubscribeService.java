package com.kcls.service;

import java.util.List;

import com.kcls.bean.Page;
import com.kcls.bean.SubScribeBean;

/*
 * �����깺
 */
public interface PendingTrialSubscribeService {
	
	public List<SubScribeBean> selectCount(Page page);
	
	public List<SubScribeBean> selectPendingTrialSubscribe(Page page);
	
	public void revocationPendingTrialSubscribe(SubScribeBean bean);
	
}
