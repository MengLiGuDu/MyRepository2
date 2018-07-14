package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.AccountBean;
import com.kcls.bean.IncomeBean;
import com.kcls.bean.IncomeSubjectBean;
import com.kcls.bean.Page;
import com.kcls.mapper.IncomeMapper;
import com.kcls.service.IncomeService;

@Service(value="IncomeService")
public class IncomeServiceImpl implements IncomeService{
	
	@Resource(name="incomeMapper")
	public IncomeMapper incomeMapper;

	@Override
	public List<IncomeBean> select() {
		List<IncomeBean> list = incomeMapper.select();
		if(list != null){
			return list;
		}
		return null;
	}

	@Override
	public Integer allMessage(Page page) {
		return incomeMapper.allMessage(page);
	}

	@Override
	public List<IncomeBean> pageMessage(Page page) {
		List<IncomeBean> list = incomeMapper.pageMessage(page);
		return list;
	}

	@Override
	public int insertIncome(IncomeBean incomeBean) {
		incomeMapper.insertIncome(incomeBean);
		return 1;
	}

	@Override
	public int deleteIncome(IncomeBean incomeBean) {
		incomeMapper.deleteIncome(incomeBean);
		return 1;
	}

	@Override
	public List<AccountBean> selectAccount() {
		return incomeMapper.selectAccount();
	}

	@Override
	public List<IncomeSubjectBean> accounName() {
		return incomeMapper.accounName();
	}

	@Override
	public int updateIncomeState(IncomeBean incomeBean) {
		incomeMapper.updateIncomeState(incomeBean);
		return 1;
	}

	@Override
	public List<IncomeBean> updateIncomeList(IncomeBean incomeBean) {
		List<IncomeBean> list = incomeMapper.updateIncomeList(incomeBean);
		return list;
	}

	@Override
	public int updateIncome(IncomeBean incomeBean) {
		incomeMapper.updateIncome(incomeBean);
		return 1;
	}

	@Override
	public List<IncomeBean> selectWaitTellerCount(Page page) {
		return incomeMapper.selectWaitTellerCount(page);
	}

	@Override
	public List<IncomeBean> selectWaitTeller(Page page) {
		return incomeMapper.selectWaitTeller(page);
	}

	@Override
	public void updateIncomeAffirmState(IncomeBean incomeBean) {
		incomeMapper.updateIncomeAffirmState(incomeBean);
	}

}