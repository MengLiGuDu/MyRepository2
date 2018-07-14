package com.kcls.service;

import java.util.List;

import com.kcls.bean.Page;
import com.kcls.bean.SubScribeBean;

public interface NotPassSubscribeService {

	public List<SubScribeBean> getNotPassSubscribe(Page bean);
	
	public Integer getNotPassSubscribeCount(Page bean);
	
	public void notPassSubscribeDelete(SubScribeBean bean);
	
	public void notPassSubscribeAgainSubmit(SubScribeBean bean);
	
	public List<SubScribeBean> selectANotPassSubscribe(SubScribeBean bean);
	
	public void notPassSubscribeUpdate(SubScribeBean bean);
}
