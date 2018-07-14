package com.kcls.action.user;

import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.UserBean;
import com.kcls.service.UserService;
import com.kcls.util.CommonUtil;

@Controller
public class UserAddAction {

	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping(value="/user_insert.action",method=RequestMethod.POST)
	@ResponseBody
	public Object add(UserBean user){
		
		UUID uuid = UUID.randomUUID();
		user.setUser_id(""+uuid);
		user.setCreate_time(CommonUtil.getTime());
		
		userService.insertUser(user);
		
		return user;
		
	}
}
