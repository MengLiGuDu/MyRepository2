package com.kcls.action.income;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.IncomeBean;
import com.kcls.service.IncomeService;
//待确认收入

@Controller
public class IncomeWaitAffirmAction {

	@Resource(name="IncomeService")
	private IncomeService service;
	
	@RequestMapping(value="income_wait_affirm_state.action",method=RequestMethod.POST)
	@ResponseBody
	public Object select(IncomeBean income){
		
		service.updateIncomeAffirmState(income);
		
		return income;
	}
	
}
