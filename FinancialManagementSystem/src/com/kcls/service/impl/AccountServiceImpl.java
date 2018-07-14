package com.kcls.service.impl;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.AccountBean;
import com.kcls.bean.Page;
import com.kcls.mapper.AccountMapper;
import com.kcls.service.AccountService;

@Service("accountService")
public class AccountServiceImpl implements AccountService{

	@Resource(name="accountMapper")
	private AccountMapper accountMapper;

	@Override
	public List<AccountBean> selectCountAccount(Page page) {
		
		return accountMapper.selectCountAccount(page);
	}

	@Override
	public List<AccountBean> selectAccount(Page page) {

		return accountMapper.selectAccount(page);
	}

	@Override
	public void accountAdd(AccountBean accountBean) {
		accountMapper.accountAdd(accountBean);
	}

	@Override
	public void deleteAccount(AccountBean accountBean) {
		accountMapper.deleteAccount(accountBean);
	}

	@Override
	public List<AccountBean> selectAccountId(AccountBean accountBean) {
		
		return accountMapper.selectAccountId(accountBean);
	}

	@Override
	public void modifyAccount(AccountBean accountBean) {
		accountMapper.modifyAccount(accountBean);
	}

	/**
	 * 账户资金查看
	 */
	@Override
	public List<AccountBean> accountMoneyLookCount(Page page) {
		
		return accountMapper.accountMoneyLookCount(page);
	}

	@Override
	public List<AccountBean> numberMoneyLook(Page page) {
		
		return accountMapper.numberMoneyLook(page);
	}
}
