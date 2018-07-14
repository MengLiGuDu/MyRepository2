package com.kcls.action.login;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kcls.bean.Person;
import com.kcls.service.PersonService;

@Controller
public class LoginAction {
	
	@Resource(name="personService")
	private PersonService personService;

	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public Object login(Person person,HttpServletRequest request){
		if(person.getName() != null && person.getPassword() != null){
			if(person.getName().equals("admin") && person.getPassword().equals("admin")){
				HttpSession session = request.getSession();
				session.setAttribute("userName", "admin");
				return "/toHomePage.action?user=0";
						/*"管理员登陆";*/
			}else{
				List<Person> manageList = personService.selectManage();
				List<Person> staffList = personService.selectStaff();
				if(manageList.size() > 0 ){
					for(int x= 0 ; x < manageList.size(); x++){
						Person tempPerson = manageList.get(x);
						if(tempPerson.getName().equals(person.getName()) && tempPerson.getPassword().equals(person.getPassword())){
							if(tempPerson.getStatus().equals("1")){
								HttpSession session = request.getSession();
								session.setAttribute("userName", tempPerson.getName());
								return "/toHomePage.action?user=1";
							}
									/*"销售管理登陆";*/
						}
					}
				}
				if(staffList.size() > 0){
					for(int x= 0 ; x < staffList.size(); x++){
						Person tempPerson = staffList.get(x);
						if(tempPerson.getName().equals(person.getName()) && tempPerson.getPassword().equals(person.getPassword())){
							if(tempPerson.getStatus().equals("1")){
								HttpSession session = request.getSession();
								session.setAttribute("userName", tempPerson.getName());
								return "/toHomePage.action?user=2";
							}
							/*return "销售人员登陆登陆";*/
						}
					}
				}
			}
		}
		return "app/jsp/framwork/login/register.jsp";
	}
	
	@RequestMapping(value="/reLogin",method=RequestMethod.GET)
	public String reLogin(){
		return "app/jsp/framwork/homepage/right";
	}
	
	@RequestMapping(value="/toHomePage",method=RequestMethod.GET)
	public ModelAndView toHomePage(String user){
		ModelAndView model = new ModelAndView("app/jsp/framwork/homepage/frame");
		model.addObject("user",user);
		return model;
	}
	
	@RequestMapping(value="/toLeftView",method=RequestMethod.GET)
	public ModelAndView toLeftView(String user){
		ModelAndView model = new ModelAndView("app/jsp/framwork/homepage/left");
		model.addObject("user",user);
		return model;
	}
	
	@RequestMapping(value="/toTopView",method=RequestMethod.GET)
	public ModelAndView toTopView(String user){
		ModelAndView model = new ModelAndView("app/jsp/framwork/homepage/top");
		model.addObject("user",user);
		return model;
	}
}
