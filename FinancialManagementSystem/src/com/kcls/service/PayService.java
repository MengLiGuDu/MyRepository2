package com.kcls.service;

import java.util.List;

import com.kcls.bean.AccountBean;
import com.kcls.bean.NodeBean;
import com.kcls.bean.Page;
import com.kcls.bean.PaySubjectBean;
import com.kcls.bean.SpendingBean;

public interface PayService {

	public List<NodeBean> getNodes();
	
	public List<PaySubjectBean> getCourse();
	
	public List<AccountBean> getAccount();
	
	public List<SpendingBean> selectPay(Page bean);
	
	public Integer selectPayCount(Page bean);
	
	public String selectAAccount(SpendingBean bean);
	
	public void payAdd(SpendingBean bean);
	
	public void paySubmit(SpendingBean bean);
	
	public void payDelete(SpendingBean bean);
	
	public void payUpdate(SpendingBean bean);
	
	public List<SpendingBean> getSpending(SpendingBean bean);
}
