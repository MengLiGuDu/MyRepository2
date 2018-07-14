package com.kcls.service;

import java.util.List;

import com.kcls.bean.Page;
import com.kcls.bean.AccountBean;
import com.kcls.bean.IncomeBean;
import com.kcls.bean.IncomeSubjectBean;

public interface IncomeService {
	public List<IncomeBean> select();
	public Integer allMessage(Page page);
	public List<IncomeBean> pageMessage(Page page);
	public List<AccountBean> selectAccount();
	public List<IncomeSubjectBean> accounName();
	public List<IncomeBean> updateIncomeList(IncomeBean incomeBean);
	
	public int updateIncomeState(IncomeBean incomeBean);
	
	public int insertIncome(IncomeBean income);
	
	public int deleteIncome(IncomeBean incomeBean);
	
	public int updateIncome(IncomeBean incomeBean);
	
	public List<IncomeBean> selectWaitTellerCount(Page page);
	
	public List<IncomeBean> selectWaitTeller(Page page);
	
	
	public void updateIncomeAffirmState(IncomeBean incomeBean);
	
}
