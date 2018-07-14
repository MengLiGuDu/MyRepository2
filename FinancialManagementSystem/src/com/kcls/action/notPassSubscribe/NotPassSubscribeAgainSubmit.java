package com.kcls.action.notPassSubscribe;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.SubScribeBean;
import com.kcls.service.NotPassSubscribeService;

@Controller
public class NotPassSubscribeAgainSubmit {
	@Resource(name="notPassSubscribeService")
	public NotPassSubscribeService service;
	
	@RequestMapping(value="/notPassSubscribeAgainSubmit",method=RequestMethod.POST)
	@ResponseBody
	public SubScribeBean notPassSubscribeAgainSubmit(SubScribeBean bean){
		service.notPassSubscribeAgainSubmit(bean);
		return bean;
	}
}
