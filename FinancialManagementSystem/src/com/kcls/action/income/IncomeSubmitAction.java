package com.kcls.action.income;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.IncomeBean;
import com.kcls.service.IncomeService;

@Controller
public class IncomeSubmitAction {
	@Resource(name="IncomeService")
	private IncomeService service;
	
	
	@RequestMapping(value="/update_income_state",method=RequestMethod.POST)
    @ResponseBody
	public int updateIncomeState(IncomeBean incomeBean,String income_id){
		System.out.println("-----------------------------------------"+incomeBean.getIncome_id());
		return service.updateIncomeState(incomeBean);
	}
}