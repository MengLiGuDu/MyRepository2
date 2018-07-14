package com.kcls.action.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.service.UserService;
import com.kcls.util.DateUtil;

@Controller
public class LoginAction {
	
	@Resource
	private UserService userServive;
	private String user_name;
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public Object loginUser(@RequestParam HashMap<String,Object> map,HttpServletRequest request){
		
		List<Map<String, Object>> list = userServive.loginUser(map);
		
		if(list.size() != 1){
			return "app/jsp/framwork/login";
		}
		String user_id = list.get(0).get("user_id")+"";
		request.getSession().setAttribute("sessionUserUUID", user_id);
		
		return "app/jsp/framwork/frame";
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	@ResponseBody
	public Object updateboard(@RequestParam HashMap<String,Object> map){
		
		
		map.put("user_id", DateUtil.getUUID());
		
		userServive.addUser(map);
		
		return map;
	}
	
	@RequestMapping(value="/checkUserName",method=RequestMethod.POST)
	@ResponseBody
	public Object checkUserName(@RequestParam String user_name){
		
		boolean valid = true;
		
		List<Map<String, Object>> list = userServive.checkUserNam();
		
		for (int i = 0; i < list.size(); i++) {
			if(user_name.equals(list.get(i).get("user_name"))){
				valid = false;
			}
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("valid", valid);
		return map;
	}
	
	@RequestMapping(value="/checkLoginUserName",method=RequestMethod.POST)
	@ResponseBody
	public Object checkLoginUserName(@RequestParam String user_name){
		
		boolean valid = false;
		
		List<Map<String, Object>> list = userServive.checkUserNam();
		
		for (int i = 0; i < list.size(); i++) {
			if(user_name.equals(list.get(i).get("user_name"))){
				valid = true;
				this.user_name = user_name;
			}
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("valid", valid);
		return map;
	}
	
	@RequestMapping(value="/checkLoginPassword",method=RequestMethod.POST)
	@ResponseBody
	public Object checkLoginPassword(@RequestParam HashMap<String,Object> maps){
		
		boolean valid = true;
		
		maps.put("user_name", this.user_name);
		
		List<Map<String, Object>> list = userServive.loginUser(maps);
		
			if(list.size() != 1){
				valid = false;
			} else {
				valid =  true;
			}
			
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("valid", valid);
		return map;
	}
	
}
