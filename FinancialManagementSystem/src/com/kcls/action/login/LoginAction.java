package com.kcls.action.login;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.JudgeBean;
import com.kcls.bean.UserBean;
import com.kcls.service.UserService;

@Controller
public class LoginAction {
	@Resource(name="userService")
	public UserService userService;
	
	@RequestMapping(value="/judgeUserName",method=RequestMethod.POST)
	@ResponseBody
	public JudgeBean judgeUserName(UserBean bean){
		if(userService.judgeUserName(bean) == 0){
			return new JudgeBean(false);
		}else{
			return new JudgeBean(true);
		}
	}
	
	@RequestMapping(value="/judgePassword",method=RequestMethod.POST)
	@ResponseBody
	public String judgePassword(UserBean bean,HttpServletRequest request){
		if(userService.judgePassword(bean) == 0){
			return "failure";
		}else{
			List<UserBean> list = userService.selectJudgeName(bean);
			if(list != null && list.size() > 0){
				request.getSession().setAttribute("loginUser",list.get(0));
			}
			return "success";
		}
	}
	
	@RequestMapping(value="/success",method=RequestMethod.POST)
	@ResponseBody
	public JudgeBean success(){
		return new JudgeBean(true);
	}
	
	@RequestMapping(value="/failure",method=RequestMethod.POST)
	@ResponseBody
	public JudgeBean failure(){
		return new JudgeBean(false);
	}
}
