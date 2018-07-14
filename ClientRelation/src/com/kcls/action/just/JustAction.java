package com.kcls.action.just;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.Person;
import com.kcls.bean.ReceiveData;
import com.kcls.bean.Rum;
import com.kcls.service.JustService;

@Controller
public class JustAction {
	
	@Resource(name="justService")
	private JustService justService;
	
	@RequestMapping(value="/justSelect",method=RequestMethod.POST)
	@ResponseBody
	public Object justSelect(ReceiveData data){
		data.setPageNumber((data.getPageNumber()-1)*data.getPageSize());
		List<Person> list = new ArrayList<Person>();
		List<Person> stuList = new ArrayList<Person>();
		if(data.getName() == null){
			data.setName("");
		}
		list = justService.dimSelectSize(data);
		stuList = justService.dimSelectJust(data);
		Rum rum = new Rum();
		rum.setTotal(list.size());
		rum.setRows(stuList);
		return rum;
	}
	
	@RequestMapping(value="/justModify",method=RequestMethod.POST)
	@ResponseBody
	public Object justModify(Person person){
		justService.setJust(person);
		return null;
	}
	
	@RequestMapping(value="/justResetPassword",method=RequestMethod.POST)
	@ResponseBody
	public Object justResetPassword(Person person){
		justService.resetPassword(person);
		return null;
	}
}
