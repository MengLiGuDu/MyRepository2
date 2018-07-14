package com.kcls.action.lead;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.service.impl.lead.NotExamineServiceImpl;
import com.kcls.util.DateUtil;

@Controller
public class NotExamineAction {
	
	@Resource
	private  NotExamineServiceImpl notExamineServiceImpl;
	
	
	@RequestMapping(value="/notExamineSubscribeList",method=RequestMethod.POST)
	@ResponseBody
	public Object selectSubscribeList(@RequestParam HashMap<String, Object> input){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = notExamineServiceImpl.selectSubscribe();
		int total = notExamineServiceImpl.selectApplyCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
	
	@RequestMapping(value="/notExamineReceiveList",method=RequestMethod.POST)
	@ResponseBody
	public Object selectReceiveList(@RequestParam HashMap<String, Object> input){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = notExamineServiceImpl.selectReceive();
		int total = notExamineServiceImpl.selectApplyCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
	
	@RequestMapping(value="/notExamineBorrowList",method=RequestMethod.POST)
	@ResponseBody
	public Object selectBorrowList(@RequestParam HashMap<String, Object> input){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = notExamineServiceImpl.selectBorrow();
		int total = notExamineServiceImpl.selectApplyCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
	
	@RequestMapping(value="/notExamineCheckList",method=RequestMethod.POST)
	@ResponseBody
	public Object selectCheckList(@RequestParam HashMap<String, Object> input){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = notExamineServiceImpl.selectCheck();
		int total = notExamineServiceImpl.selectApplyCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
}
