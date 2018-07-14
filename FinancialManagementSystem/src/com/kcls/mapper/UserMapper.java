package com.kcls.mapper;

import java.util.List;

import com.kcls.bean.Page;
import com.kcls.bean.UserBean;

public interface UserMapper {

	List<UserBean> selectUserCount(Page page);
	
	List<UserBean> selectUser(Page page);
	
	void insertUser(UserBean user);
	
	void deleteUser(UserBean user);
	
	void updateUser(UserBean user);
	
	List<UserBean> selectJudgeUser(UserBean user);
	
	Integer judgeUserName(UserBean bean);
	
	Integer judgePassword(UserBean bean);
	
	List<UserBean> selectJudgeName(UserBean user);
}
