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
public class IncomeSubjectSelectOneAction {
	
	@Resource(name="IncomeSubjectService")
	private IncomeSubjectService  service;
	
	@RequestMapping(value="/select_one.action",method=RequestMethod.POST)
	@ResponseBody
	public   List<IncomeSubjectBean>  insert(IncomeSubjectBean  bean){
		
		return service.select_one(bean);
		
	}
}
