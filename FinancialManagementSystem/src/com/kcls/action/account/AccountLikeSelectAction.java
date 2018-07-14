package com.kcls.action.account;

import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kcls.bean.AccountBean;
import com.kcls.bean.Page;
import com.kcls.service.AccountService;

/*
 * 资金账户查看
 */

@Controller
public class AccountLikeSelectAction {

	@Resource(name="accountService")
	private AccountService accountService;
	
	@RequestMapping(value="/like_account_select",method=RequestMethod.POST)
	@ResponseBody
	public Object selectAccount(Page page,AccountBean bean){
		if(page.getSearchText() == null){
			page.setSearchText("");
		}
		if(page.getPageNumber() != null){
			Integer in = (page.getPageNumber()-1)*page.getPageSize();
			page.setPageNumber(in);
		}
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("total", accountService.accountMoneyLookCount(page).size());
		map.put("rows", accountService.numberMoneyLook(page));
		return map;
	}
}
