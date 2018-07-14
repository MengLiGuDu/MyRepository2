package com.kcls.action.incomeSubject;

 

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.IncomeSubjectBean;
import com.kcls.service.IncomeSubjectService;

 

@Controller
public class SelectParentIncomeSubjectAction {

	@Resource(name="IncomeSubjectService")
	private IncomeSubjectService  service;
	
	@RequestMapping(value="/select_parent_income_subject.action",method=RequestMethod.POST)
	@ResponseBody
	public     List<IncomeSubjectBean>  select_parent_income_subject(){
		
		return   service.select_parent_income_subject();	
		
	}
}
