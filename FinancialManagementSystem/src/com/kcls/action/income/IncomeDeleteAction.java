package com.kcls.action.income;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.IncomeBean;
import com.kcls.service.IncomeService;

@Controller
public class IncomeDeleteAction {
	@Resource(name="IncomeService")
	private IncomeService service;
	
	
	@RequestMapping(value="/income_delete",method=RequestMethod.POST)
    @ResponseBody
    public int incomeDelete(IncomeBean incomeBean){
		System.out.println("----------------------------------------"+incomeBean.getIncome_id());
		return service.deleteIncome(incomeBean);
	}
}
