package com.kcls.action.reimburseManage.myReimbursementDraft;

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
import com.kcls.bean.TreeBean;
import com.kcls.bean.UserBean;
import com.kcls.service.MyReimbursementDraftService;
import com.kcls.util.CommonUtil;


 

/*
 * 我的报销草稿select  
 */



@Controller
public class MyReimbursementDraftSelectAction {
	
	@Resource(name="MyReimbursementDraftService")
	private MyReimbursementDraftService  service;
	
	
	/*
	 * 我的报销草稿分页
	 */
	@RequestMapping(value="my_reimbursement_draft_paging",method=RequestMethod.POST)
	@ResponseBody
	public Object  my_reimbursement_draft_paging(HttpSession  session,Page  page) {
		
		UserBean UserBean = CommonUtil.getLoginUser(session);
		
		if(UserBean  ==  null   ){
			
			UserBean =new UserBean();
			UserBean.setUser_id("1ca4d1b7-b11f-41df-a2a8-31c4b0301ee4");
			
		}
		
		page.setSearchText3(UserBean.getUser_id());
		if(page.getPageNumber() != null){
			page.setPageNumber((page.getPageNumber() - 1) * page.getPageSize());
			 
		}
		page.setSearchText4("0");

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("rows",service.my_reimbursement_draft_list(page));
		map.put("total",service.my_reimbursement_draft_count(page));
		return map;
	}
	
	
	
	
	/*
	 * 我的所有报销草稿
	 */
	@RequestMapping(value="my_reimbursement_draft_all",method=RequestMethod.POST)
	@ResponseBody
	public   List<ReimburseBean>  my_reimbursement_draft_all(HttpSession  session) {
		
		UserBean UserBean = CommonUtil.getLoginUser(session);
		
		if(UserBean  ==  null   ){
			
			UserBean =new UserBean();
			UserBean.setUser_id("1ca4d1b7-b11f-41df-a2a8-31c4b0301ee4");
			
		}
		
		return service.my_reimbursement_draft_all(UserBean);
		
	}
	
	
	
	
}
