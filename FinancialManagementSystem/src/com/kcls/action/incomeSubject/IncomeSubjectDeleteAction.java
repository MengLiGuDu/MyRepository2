package com.kcls.action.incomeSubject;

 

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.IncomeSubjectBean;
import com.kcls.service.IncomeSubjectService;

 
 


/*
 * 收入科目delete
 */
@Controller
public class IncomeSubjectDeleteAction {
	
	

	@Resource(name="IncomeSubjectService")
	private IncomeSubjectService  service;
	
	/*
	 * 收入科目 删除指定的一条科目
	 */
	@RequestMapping(value="/income_subject_delete_one.action",method=RequestMethod.POST)
	@ResponseBody
	public   int insert(IncomeSubjectBean  bean){
		
		 
		return service.delete_one(bean);	
		
		
	}
}
