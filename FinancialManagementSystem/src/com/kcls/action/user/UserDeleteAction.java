package com.kcls.action.user;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.UserBean;
import com.kcls.service.UserService;

@Controller
public class UserDeleteAction {

	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping(value="/user_delete.action",method=RequestMethod.POST)
	@ResponseBody
	public Object delete(UserBean user){
		
		userService.deleteUser(user);
		
		return user;
	}
}
