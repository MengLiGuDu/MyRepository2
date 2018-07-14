package com.kcls.action.notPassSubscribe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.Page;
import com.kcls.bean.UserBean;
import com.kcls.service.NotPassSubscribeService;

@Controller
public class NotPassSubscribeSelect {
	@Resource(name="notPassSubscribeService")
	public NotPassSubscribeService service;
	
	@RequestMapping(value="/getNotPassSubscribeTable",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getNotPassSubscribeTable(Page bean,HttpSession session){
		if(bean.getSearchText1().equals("null")){
			bean.setSearchText1("");
		}
		bean.setSearchText2(((UserBean)session.getAttribute("loginUser")).getUser_id());
		bean.setPageNumber((bean.getPageNumber()-1)*bean.getPageSize());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("rows", service.getNotPassSubscribe(bean));
		map.put("total", service.getNotPassSubscribeCount(bean));
		return map;
	}
}
