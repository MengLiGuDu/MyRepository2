package com.kcls.action.account;

import java.util.UUID;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kcls.bean.AccountBean;
import com.kcls.service.AccountService;


@Controller
public class AccountDeleteAction {

	@Resource(name="accountService")
	private AccountService accountService;
	
	@RequestMapping(value="/account_delete.action",method=RequestMethod.POST)
	@ResponseBody
	public Object add(AccountBean accountBean){
		accountService.deleteAccount(accountBean);
		return accountBean;
	}
}
