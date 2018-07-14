package com.kcls.action.reimburseManage.myReimbursementDraft;




import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.service.MyReimbursementDraftService;
 


 

/*
 * 我的报销草稿删除
 */



@Controller
public class MyReimbursementDraftDeleteAction {
	
	@Resource(name="MyReimbursementDraftService")
	private MyReimbursementDraftService  service;
	
	
	/*
	 * 删除一条报销
	 */
	@RequestMapping(value="reimbursement_delate_one",method=RequestMethod.POST)
	@ResponseBody
	public int  reimbursement_delate_one(String  budget_id){
		 
		return  	 service.reimbursement_delate_one(budget_id);
	}
	
	
	
	
	
}
