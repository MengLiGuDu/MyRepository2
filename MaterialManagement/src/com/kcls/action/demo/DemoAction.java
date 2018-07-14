package com.kcls.action.demo;


import java.util.List;
import java.util.*;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.ApprovallimBean;
import com.kcls.service.ApprovallimService;
import com.kcls.util.DateUtil;

@Controller
public class DemoAction {

	@Resource
	private ApprovallimService approvallimService;
	
	@RequestMapping(value="operateApp",method=RequestMethod.POST)
	@ResponseBody
	public Object addApprovallim(ApprovallimBean approvallim,@RequestParam String operate){
		
		if(operate.equals("add")){
			approvallim.setLead_id(DateUtil.getUUID());//ID
			approvallimService.addApprovallim(approvallim);
		} else {
			approvallimService.modApprovallim(approvallim);
		}
		return approvallim;
	}
	
	@RequestMapping(value="list",method=RequestMethod.POST)
	@ResponseBody
	public Object queryApprovallim(@RequestParam HashMap<String, Object> input){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = approvallimService.queryApprovallim(in);
		int total = approvallimService.queryApprovallimCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
	@RequestMapping(value="fillModApp",method=RequestMethod.POST)
	@ResponseBody
	public Object fillModApprovallim(ApprovallimBean approvallim){
		
		
		List<ApprovallimBean> list = approvallimService.fillModApprovallim(approvallim);
		
		return list;
	}
	
	@RequestMapping(value="delApprovallim",method=RequestMethod.POST)
	@ResponseBody
	public Object delApprovallim(ApprovallimBean approvallim){
		
		
		approvallimService.delApprovallim(approvallim);
		
		return approvallim;
	}
}
