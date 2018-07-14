package com.kcls.action.income;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.IncomeSubjectBean;
import com.kcls.service.IncomeService;

@Controller
public class IncomeCourseNameListAction {
	@Resource(name="IncomeService")
	private IncomeService service;
	
	
	@RequestMapping(value="/course_name_list",method=RequestMethod.POST)
    @ResponseBody
	public List<IncomeSubjectBean> accounName(){
		return service.accounName();
	}
}