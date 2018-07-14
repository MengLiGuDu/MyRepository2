package com.kcls.action.income;

import java.util.UUID;

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
public class IncomeAddAction {
	@Resource(name="IncomeService")
	private IncomeService service;
	
	
	@RequestMapping(value="/income_insert",method=RequestMethod.POST)
    @ResponseBody
    public int inserIncome(IncomeBean incomeBean,HttpServletRequest request){
		
		UUID uuid = UUID.randomUUID();
		UserBean user = CommonUtil.getLoginUser(request.getSession());
		
		System.out.println(user.getUser_name());
		
		incomeBean.setIncome_id(""+uuid);//用户ID
		incomeBean.setCreate_date(CommonUtil.getTime());//创建时间
		incomeBean.setIncome_date(CommonUtil.getTime());//收款时间
		incomeBean.setIncome_state(0);//状态
		incomeBean.setGathering_name(user.getUser_name());//收款人
		incomeBean.setAccounting_id(user.getUser_id());//会计ID
		
		return service.insertIncome(incomeBean);
	}
}
