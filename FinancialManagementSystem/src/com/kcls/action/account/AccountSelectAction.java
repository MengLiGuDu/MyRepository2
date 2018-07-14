package com.kcls.action.account;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kcls.bean.AccountBean;
import com.kcls.bean.Page;
import com.kcls.service.AccountService;

@Controller
public class AccountSelectAction {

	@Resource(name="accountService")
	private AccountService accountService;
	
	@RequestMapping(value="/account_select",method=RequestMethod.POST)
	@ResponseBody
	public Object selectAccount(Page page){
		if(page.getSearchText() == null){
			page.setSearchText("");
		}
		if(page.getPageNumber() != null){
			Integer in = (page.getPageNumber()-1)*page.getPageSize();
			page.setPageNumber(in);
		}
		List<AccountBean> listCount = accountService.selectCountAccount(page);
		List<AccountBean> listSelect = accountService.selectAccount(page);
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("total", listCount.size());
		map.put("rows", listSelect);
		return map;
	}
}
