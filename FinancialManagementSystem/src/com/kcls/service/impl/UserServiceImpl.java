package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.Page;
import com.kcls.bean.UserBean;
import com.kcls.mapper.UserMapper;
import com.kcls.service.UserService;

@Service(value="userService")
public class UserServiceImpl implements UserService{

	@Resource(name="userMapper")
	private UserMapper userMapper;
	
	@Override
	public List<UserBean> selectUserCount(Page page) {
		return userMapper.selectUserCount(page);
	}

	@Override
	public List<UserBean> selectUser(Page page) {
		return userMapper.selectUser(page);
	}

	@Override
	public void insertUser(UserBean user) {
		userMapper.insertUser(user);
	}

	@Override
	public void deleteUser(UserBean user) {
		userMapper.deleteUser(user);
	}

	@Override
	public void updateUser(UserBean user) {
		userMapper.updateUser(user);
	}

	@Override
	public List<UserBean> selectJudgeUser(UserBean user) {
		return userMapper.selectJudgeUser(user);
	}

	@Override
	public Integer judgeUserName(UserBean bean) {
		return userMapper.judgeUserName(bean);
	}

	@Override
	public Integer judgePassword(UserBean bean) {
		return userMapper.judgePassword(bean);
	}

	@Override
	public List<UserBean> selectJudgeName(UserBean user) {
		return userMapper.selectJudgeName(user);
	}

	
}
