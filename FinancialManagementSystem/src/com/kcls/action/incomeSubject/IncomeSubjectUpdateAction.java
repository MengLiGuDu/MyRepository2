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
public class IncomeSubjectUpdateAction {
	
	@Resource(name="IncomeSubjectService")
	private IncomeSubjectService  service;
	
	@RequestMapping(value="/income_subject_update.action",method=RequestMethod.POST)
	@ResponseBody
	public   int  update(IncomeSubjectBean  bean,String update_course_id){
		
		 if(bean.getFatherCourse_id().equals("")){
			 
		     bean.setFatherCourse_id(null);
		     
		 }
		 
		 bean.setCourse_id(update_course_id);
		
		return service.update(bean);
		
	}
}
