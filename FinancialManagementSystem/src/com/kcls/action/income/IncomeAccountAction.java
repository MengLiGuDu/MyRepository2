package com.kcls.action.income;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.AccountBean;
import com.kcls.service.IncomeService;

@Controller
public class IncomeAccountAction {
	@Resource(name="IncomeService")
	private IncomeService service;
	
	
	@RequestMapping(value="/accoun_list",method=RequestMethod.POST)
    @ResponseBody
	public List<AccountBean> accounNum(){
		return service.selectAccount();
	}
}
