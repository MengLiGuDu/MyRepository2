package com.kcls.action.reimburseManage.myReimbursementDraft;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.Page;
import com.kcls.bean.PaySubjectBean;
import com.kcls.bean.ReimburseBean;
import com.kcls.bean.UserBean;
import com.kcls.service.MyReimbursementDraftService;
import com.kcls.util.CommonUtil;


 

/*
 * 我的报销草稿修改
 */



@Controller
public class MyReimbursementDraftUpdateAction {
	
	@Resource(name="MyReimbursementDraftService")
	private MyReimbursementDraftService  service;
	
	
	/*
	 * 我的报销草稿提交
	 */
	@RequestMapping(value="my_reimbursement_draft_submit",method=RequestMethod.POST)
	@ResponseBody
	public int  my_reimbursement_draft_submit(String  budget_id){
		return  	 service.my_reimbursement_draft_submit(budget_id);
	}
	
	
	/*
	 * 我的报销草稿修改
	 */
	@RequestMapping(value="my_reimbursement_draft_update",method=RequestMethod.POST)
	@ResponseBody
	public int  my_reimbursement_draft_update(ReimburseBean  ReimburseBean){
		 
		return  	service.my_reimbursement_draft_update(ReimburseBean);
	}
	
	
	
	
	
}
