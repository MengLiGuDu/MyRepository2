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

import com.kcls.bean.ReimburseBean;
import com.kcls.bean.UserBean;
import com.kcls.service.MyReimbursementDraftService;
import com.kcls.util.CommonUtil;


 

/*
 * 我的报销草稿insert  
 */



@Controller
public class MyReimbursementDraftInsertAction {
	
	@Resource(name="MyReimbursementDraftService")
	private MyReimbursementDraftService  service;
	
	
	/*
	 * 我的报销草稿添加
	 */
	@RequestMapping(value="my_reimbursement_draft_insert",method=RequestMethod.POST)
	@ResponseBody
	public int  add(HttpSession  session,ReimburseBean bean){
		
		 

		UserBean UserBean = CommonUtil.getLoginUser(session);
		 
		if( UserBean ==null){
			
			UserBean =new UserBean();
			UserBean.setUser_id("1ca4d1b7-b11f-41df-a2a8-31c4b0301ee4");
		} 
		
		
		bean.setCollection_account("123456658646");
		bean.setBudgetName_id(UserBean.getUser_id());
		bean.setBudget_id(""+CommonUtil.getUUID());
		bean.setReimburse_date(new  Date());
		bean.setCashier_type(0);
		bean.setDeal_type("现金");
		
		 
		
		 
		
		
		return  	 service.add(bean);
	}
	
	
	
	
	
}
