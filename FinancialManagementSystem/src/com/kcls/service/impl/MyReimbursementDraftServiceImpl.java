package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.kcls.bean.Page;
import com.kcls.bean.ReimburseBean;
import com.kcls.bean.UserBean;
import com.kcls.service.MyReimbursementDraftService;
import com.kcls.mapper.MyReimbursementDraftMapeer;


/*
 * 我的报销草稿
 */

@Service("MyReimbursementDraftService")
public class MyReimbursementDraftServiceImpl implements  MyReimbursementDraftService {
	
	@Resource(name="MyReimbursementDraftMapeer")
	private MyReimbursementDraftMapeer mapper;
	
	public List<ReimburseBean> my_reimbursement_draft_list(Page  page) {
	 
		return mapper.my_reimbursement_draft_list( page);
	}

	public int my_reimbursement_draft_count(Page  page) {
		
		return mapper.my_reimbursement_draft_count(page);
	}

	@Override
	public int add(ReimburseBean ReimburseBean) {
		 
		return mapper.add(ReimburseBean);
	}

	 

	@Override
	public List<ReimburseBean> my_reimbursement_draft_all(UserBean UserBean) {
		 
		return mapper.my_reimbursement_draft_all(UserBean);
	}

	@Override
	public int my_reimbursement_draft_submit(String budget_id) {
		 
		return mapper.my_reimbursement_draft_submit(budget_id);
	}

	 

	@Override
	public int reimbursement_delate_one(String budget_id) {
		 
		return mapper.reimbursement_delate_one(budget_id);
	}

	@Override
	public int my_reimbursement_draft_update(ReimburseBean ReimburseBean) {
		 
		return mapper.my_reimbursement_draft_update(ReimburseBean);
	}

	 

 

	 
	 

}
