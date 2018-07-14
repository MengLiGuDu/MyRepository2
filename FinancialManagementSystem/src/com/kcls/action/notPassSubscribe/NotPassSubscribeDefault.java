package com.kcls.action.notPassSubscribe;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.SubScribeBean;
import com.kcls.service.NotPassSubscribeService;

@Controller
public class NotPassSubscribeDefault {
	@Resource(name="notPassSubscribeService")
	public NotPassSubscribeService service;
	
	@RequestMapping(value="selectANotPassSubscribe",method=RequestMethod.POST)
	@ResponseBody
	public SubScribeBean selectANotPassSubscribe(SubScribeBean bean){
			bean = service.selectANotPassSubscribe(bean).get(0);
		return bean;
	}
}
