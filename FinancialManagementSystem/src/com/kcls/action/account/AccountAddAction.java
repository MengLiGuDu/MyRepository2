package com.kcls.action.account;

import java.util.UUID;
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
public class AccountAddAction {

	@Resource(name="accountService")
	private AccountService accountService;
	
	@RequestMapping(value="/account_insert.action",method=RequestMethod.POST)
	@ResponseBody
	public Object add(AccountBean accountBean,HttpServletRequest request){
		
		UUID uuid = UUID.randomUUID();
		accountBean.setAccount_id(""+uuid);
		accountBean.setCreate_date(CommonUtil.getTime());
		accountBean.setAccount_oldMoney(0.0);
		accountBean.setAccount_newMoney(0.0);
		accountBean.setCreate_name(CommonUtil.getLoginUser(request.getSession()).getUser_name());
		accountService.accountAdd(accountBean);
		return accountBean;
	}
}
