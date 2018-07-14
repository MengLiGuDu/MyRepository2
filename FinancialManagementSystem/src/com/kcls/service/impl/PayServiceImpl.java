package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.AccountBean;
import com.kcls.bean.NodeBean;
import com.kcls.bean.Page;
import com.kcls.bean.PaySubjectBean;
import com.kcls.bean.SpendingBean;
import com.kcls.mapper.PayMapper;
import com.kcls.service.PayService;

@Service("payService")
public class PayServiceImpl implements PayService {
	@Resource(name="payMapper")
	public PayMapper pay;
	
	@Override
	public List<NodeBean> getNodes() {
		return pay.getNodes();
	}

	@Override
	public List<PaySubjectBean> getCourse() {
		return pay.getCourse();
	}

	@Override
	public List<AccountBean> getAccount() {
		return pay.getAccount();
	}

	@Override
	public List<SpendingBean> selectPay(Page bean) {
		return pay.selectPay(bean);
	}

	@Override
	public Integer selectPayCount(Page bean) {
		return pay.selectPayCount(bean);
	}

	@Override
	public String selectAAccount(SpendingBean bean) {
		return pay.selectAAccount(bean);
	}

	@Override
	public void payAdd(SpendingBean bean) {
		pay.payAdd(bean);
	}

	@Override
	public void paySubmit(SpendingBean bean) {
		pay.paySubmit(bean);
	}

	@Override
	public void payDelete(SpendingBean bean) {
		pay.payDelete(bean);
	}

	@Override
	public void payUpdate(SpendingBean bean) {
		pay.payUpdate(bean);
	}

	@Override
	public List<SpendingBean> getSpending(SpendingBean bean) {
		return pay.getSpending(bean);
	}
	
}
