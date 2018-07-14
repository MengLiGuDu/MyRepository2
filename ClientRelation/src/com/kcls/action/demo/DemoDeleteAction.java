package com.kcls.action.demo;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.Client;
import com.kcls.service.DemoService;

@Controller
public class DemoDeleteAction {
	
	@Resource(name="demoService")
	private DemoService demoService;

	@RequestMapping(value="/demoDelete",method=RequestMethod.POST)
	@ResponseBody
	public Object demoDelete(Client client){
		Map<String,String> map = new HashMap<String,String>();
		demoService.demoDelete(client);
		map.put("message", "É¾³ý³É¹¦");
		return map;
	}
}
