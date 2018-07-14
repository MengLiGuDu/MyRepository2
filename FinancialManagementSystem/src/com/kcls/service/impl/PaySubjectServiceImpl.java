package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.Page;
import com.kcls.bean.PaySubjectBean;
import com.kcls.mapper.PaySubjectMapper;
import com.kcls.service.PaySubjectService;

/*
 * 支出科目
 */
@Service(value="paySubjectService")
public class PaySubjectServiceImpl implements PaySubjectService {

	@Resource(name="paySubjectMapper")
	private PaySubjectMapper paySubjectMapper;

	@Override
	public List<PaySubjectBean> selectCount(Page page) {
		return paySubjectMapper.selectCount(page);
	}

	@Override
	public List<PaySubjectBean> selectPaySubject(Page page) {
		return paySubjectMapper.selectPaySubject(page);
	}

	@Override
	public void insertPaySubject(PaySubjectBean pay_s) {
		paySubjectMapper.insertPaySubject(pay_s);
	}

	@Override
	public void deletePaySubject(PaySubjectBean pay_s) {
		paySubjectMapper.deletePaySubject(pay_s);
	}

	@Override
	public void updatePaySubject(PaySubjectBean pay_s) {
		paySubjectMapper.updatePaySubject(pay_s);
	}

	@Override
	public List<PaySubjectBean> allFatherPaySubject() {
		return paySubjectMapper.allFatherPaySubject();
	}

	@Override
	public List<PaySubjectBean> allTwoPaySubject() {
		return paySubjectMapper.allTwoPaySubject();
	}

	@Override
	public List<PaySubjectBean> SonPaySubject(PaySubjectBean pay_s) {
		return paySubjectMapper.SonPaySubject(pay_s);
	}
	
}
