package com.kcls.mapper;

import java.util.List;

import com.kcls.bean.Page;
import com.kcls.bean.SubScribeBean;

/*
 * �����깺
 */
public interface PendingTrialSubscribeMapper {
	
	public List<SubScribeBean> selectCount(Page page);
	
	public List<SubScribeBean> selectPendingTrialSubscribe(Page page);
	
	public void revocationPendingTrialSubscribe(SubScribeBean bean);
}
