package com.kcls.service;

import java.util.List;
import com.kcls.bean.AccountBean;
import com.kcls.bean.Page;


public interface AccountService {
	
	public List<AccountBean> selectCountAccount(Page page);
	
	public List<AccountBean> selectAccount(Page page);
	
	public void accountAdd(AccountBean accountBean);
	
	public void deleteAccount(AccountBean accountBean);
	
	public List<AccountBean> selectAccountId (AccountBean accountBean);
	
	public void modifyAccount(AccountBean accountBean);
	
	//账户资金查看
	public List<AccountBean> accountMoneyLookCount(Page page);
	
	public List<AccountBean> numberMoneyLook(Page page);
	

	
}
