package com.kcls.action.incomeSubject;

 

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.IncomeSubjectBean;
import com.kcls.service.IncomeSubjectService;

 
 


/*
 * �����Ŀdelete
 */
@Controller
public class IncomeSubjectDeleteAction {
	
	

	@Resource(name="IncomeSubjectService")
	private IncomeSubjectService  service;
	
	/*
	 * �����Ŀ ɾ��ָ����һ����Ŀ
	 */
	@RequestMapping(value="/income_subject_delete_one.action",method=RequestMethod.POST)
	@ResponseBody
	public   int insert(IncomeSubjectBean  bean){
		
		 
		return service.delete_one(bean);	
		
		
	}
}
