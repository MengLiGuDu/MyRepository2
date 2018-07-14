package com.kcls.service;

import java.util.List;

import com.kcls.bean.Page;
import com.kcls.bean.ReimburseBean;
import com.kcls.bean.UserBean;



/*
 * 我的报销草稿
 */

public interface MyReimbursementDraftService {
	
	List<ReimburseBean>  my_reimbursement_draft_list(Page  page);
	
	
	int  my_reimbursement_draft_count(Page  page);
	
	int   add(ReimburseBean ReimburseBean);
	
	List<ReimburseBean>  my_reimbursement_draft_all(UserBean  UserBean);
	
	int  my_reimbursement_draft_submit(String budget_id);
	
	
	int reimbursement_delate_one(String  budget_id);
	
	int my_reimbursement_draft_update(ReimburseBean ReimburseBean);
}
