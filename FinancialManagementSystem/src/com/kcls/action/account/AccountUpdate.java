package com.kcls.action.account;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.AccountBean;
import com.kcls.service.AccountService;
import com.kcls.util.CommonUtil;

@Controller
public class AccountUpdate {

	@Resource(name="accountService")
	private AccountService accountService;
	
	@RequestMapping(value="/account_modify.action",method=RequestMethod.POST)
	@ResponseBody
	public Object modify(AccountBean accountBean){
		List<AccountBean> list = accountService.selectAccountId(accountBean);
		return list.get(0);
	}
	@RequestMapping(value="/account_update.action",method=RequestMethod.POST)
	@ResponseBody
	public Object update(AccountBean accountBean,HttpServletRequest request){		
		accountBean.setCreate_date(CommonUtil.getTime());
		accountBean.setAccount_oldMoney(0.0);
		accountBean.setAccount_newMoney(0.0);
		accountBean.setCreate_name(CommonUtil.getLoginUser(request.getSession()).getUser_name());
		accountService.modifyAccount(accountBean);
		return accountBean;
	}
}
