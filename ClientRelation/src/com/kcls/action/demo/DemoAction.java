package com.kcls.action.demo;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.Client;
import com.kcls.bean.ReceiveData;
import com.kcls.bean.Rum;
import com.kcls.service.DemoService;

@Controller
public class DemoAction {

	@Resource(name="demoService")
	private DemoService demoService;
	
	@RequestMapping(value="/demo",method=RequestMethod.POST)
	@ResponseBody
	public Object demo(ReceiveData data){
		data.setPageNumber((data.getPageNumber()-1)*data.getPageSize());
		List<Client> list = new ArrayList<Client>();
		List<Client> stuList = new ArrayList<Client>();
		if(data.getName() == null){
			data.setName("");
		}
		list = demoService.dimSelectSize(data);
		stuList = demoService.dimSelectDemo(data);
		Rum rum = new Rum();
		rum.setTotal(list.size());
		rum.setRows(stuList);
		return rum;
	}
}
