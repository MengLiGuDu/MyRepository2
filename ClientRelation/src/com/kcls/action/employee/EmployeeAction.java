package com.kcls.action.employee;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.Person;
import com.kcls.bean.ReceiveData;
import com.kcls.bean.Rum;
import com.kcls.service.EmployeeService;
import com.kcls.util.CommonData;

@Controller
public class EmployeeAction {
	
	@Resource(name="employeeService")
	public EmployeeService employeeService;
	
	@RequestMapping(value="/staff",method=RequestMethod.GET)
	public String staff(){
		return "app/jsp/framwork/employee/employee";
	}
	
	@RequestMapping(value="/employee",method=RequestMethod.POST)
	@ResponseBody
	public Object pagelist(ReceiveData page, HttpServletRequest request,
            HttpServletResponse response) {
        if(page.getName()==null){
        	page.setName("");
        }
        page.setPageNumber((page.getPageNumber()-1) * page.getPageSize());
        List<Person> list = employeeService.pageMessage(page);
        Rum util = new Rum();
        Integer count = employeeService.allMessage(page);
        util.setTotal(count);
        util.setRows(list);
        return util;                                     
    } 
	
	@RequestMapping(value="/insertPerson",method=RequestMethod.POST)
	public String addPerson(Person person){
		person.setPerson_id(CommonData.getUuid());
		person.setPassword("123456");
		person.setCreate_time(CommonData.getTime());
		person.setStatus("1");
		System.out.println(person.getPosition());
		employeeService.insertPerson(person);
		return "app/jsp/framwork/employee/employee";
	}
	
	@RequestMapping(value="/deleteEmployee",method=RequestMethod.POST)
	@ResponseBody
	public Object deletePerson(Person person){
		employeeService.deletePerson(person);
		return person;
	}
	
	@RequestMapping(value="/updateEmployee",method=RequestMethod.POST)
	@ResponseBody
	public Object updateEmployee(Person person){
		List<Person> list = employeeService.findList(person);
		return list;
	} 
	
	@RequestMapping(value="/modifyEmployee",method=RequestMethod.POST)
	public String modifyEmployee(Person person){
		person.setUpdate_time(CommonData.getTime());
		employeeService.modifyEmployee(person);
		return "app/jsp/framwork/employee/employee";
	}
	
	@RequestMapping(value="/resume",method=RequestMethod.POST)
	@ResponseBody
	public Object modifyResume(Person person){
		person.setStatus("1");
		employeeService.modigyStatus(person);
		return person;
	}
	
	@RequestMapping(value="/expel",method=RequestMethod.POST)
	@ResponseBody
	public Object modifyExpel(Person person){
		person.setStatus("0");
		employeeService.modigyStatus(person);
		return person;
	}
}
