package com.kcls.action.income;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.IncomeBean;
import com.kcls.bean.UserBean;
import com.kcls.service.IncomeService;
import com.kcls.util.CommonUtil;

@Controller
public class IncomeUpdateAction {
	@Resource(name="IncomeService")
	private IncomeService service;
	
	
	@RequestMapping(value="/income_update",method=RequestMethod.POST)
    @ResponseBody
	public int incomeUpdate(IncomeBean incomeBean,HttpServletRequest request){
		UserBean user = CommonUtil.getLoginUser(request.getSession());
		
		System.out.println(user.getUser_name());
		
		incomeBean.setGathering_name(user.getUser_name());//收款人
		incomeBean.setAccounting_id(user.getUser_id());//会计ID
		
		
		return service.updateIncome(incomeBean);
	}
}