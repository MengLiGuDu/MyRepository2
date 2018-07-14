package com.kcls.action.user;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.UserBean;
import com.kcls.service.UserService;

@Controller
public class UserUpdateAction {

	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping(value="/user_update.action",method=RequestMethod.POST)
	@ResponseBody
	public Object update(UserBean user ,HttpSession session){
		
		userService.updateUser(user);
		
		List<UserBean> list = userService.selectJudgeUser(user);
		
		if(list != null && list.size() > 0){
			user = list.get(0);
			session.setAttribute("loginUser",user);
		}
		
		return user;
	}
	
	@RequestMapping(value="/user_modify.action",method=RequestMethod.POST)
	@ResponseBody
	public Object modify(UserBean user){
		
		List<UserBean> list = userService.selectJudgeUser(user);
		
		return list.get(0);
	}
}
