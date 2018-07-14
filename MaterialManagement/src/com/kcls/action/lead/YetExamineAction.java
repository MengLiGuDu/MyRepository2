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

import com.kcls.service.impl.lead.YetExamineServiceImpl;
import com.kcls.util.DateUtil;

@Controller
public class YetExamineAction {
	
	@Resource
	private  YetExamineServiceImpl yetExamineServiceImpl;
	
	
	@RequestMapping(value="/examineSubscribeList",method=RequestMethod.POST)
	@ResponseBody
	public Object selectSubscribeList(@RequestParam HashMap<String, Object> input){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = yetExamineServiceImpl.selectSubscribe();
		int total = yetExamineServiceImpl.selectApplyCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
	
	@RequestMapping(value="/examineReceiveList",method=RequestMethod.POST)
	@ResponseBody
	public Object selectReceiveList(@RequestParam HashMap<String, Object> input){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = yetExamineServiceImpl.selectReceive();
		int total = yetExamineServiceImpl.selectApplyCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
	
	@RequestMapping(value="/examineBorrowList",method=RequestMethod.POST)
	@ResponseBody
	public Object selectBorrowList(@RequestParam HashMap<String, Object> input){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = yetExamineServiceImpl.selectBorrow();
		int total = yetExamineServiceImpl.selectApplyCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
	
	@RequestMapping(value="/examineCheckList",method=RequestMethod.POST)
	@ResponseBody
	public Object selectCheckList(@RequestParam HashMap<String, Object> input){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = yetExamineServiceImpl.selectCheck();
		int total = yetExamineServiceImpl.selectApplyCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
}
