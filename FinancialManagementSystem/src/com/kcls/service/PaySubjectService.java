package com.kcls.service;

import java.util.List;

import com.kcls.bean.Page;
import com.kcls.bean.PaySubjectBean;

/*
 * 支出科目
 */
public interface PaySubjectService {
	
	public List<PaySubjectBean> selectCount(Page page);
	
	public List<PaySubjectBean> selectPaySubject(Page page);
	
	public void insertPaySubject(PaySubjectBean pay_s);
	
	public void deletePaySubject(PaySubjectBean pay_s);
	
	public void updatePaySubject(PaySubjectBean pay_s);
	
	public List<PaySubjectBean> allFatherPaySubject();
	
	public List<PaySubjectBean> allTwoPaySubject();
	
	public List<PaySubjectBean> SonPaySubject(PaySubjectBean pay_s);
}
