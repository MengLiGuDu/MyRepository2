package com.kcls.action.income;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.IncomeBean;
import com.kcls.service.IncomeService;


@Controller
public class IncomeUpdateIncomeList {
	@Resource(name="IncomeService")
	private IncomeService service;
	
	
	@RequestMapping(value="/update_income_list",method=RequestMethod.POST)
    @ResponseBody
	public IncomeBean updateIncomeState(String income_id,IncomeBean incomeBean, HttpServletRequest request){
		List<IncomeBean> list = service.updateIncomeList(incomeBean);
		return list.get(0);
	}
}