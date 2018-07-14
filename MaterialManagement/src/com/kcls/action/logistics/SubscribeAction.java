package com.kcls.action.logistics;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.service.logistice.SubscribeService;
import com.kcls.util.DateUtil;


@Controller
public class SubscribeAction {
	@Resource
	private SubscribeService subscribeService;
	
	@RequestMapping(value="/subscribeList",method=RequestMethod.POST)
	@ResponseBody
	public Object selectSubscribe(@RequestParam HashMap<String, Object> input){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = subscribeService.selectExamine();
		int total = subscribeService.selectApplyCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	@RequestMapping(value="/notNotAlready",method=RequestMethod.POST)
	@ResponseBody
	public Object  selectNotDispose(@RequestParam HashMap<String, Object> input){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = subscribeService.selectNotAlready();
		int total = subscribeService.selectApplyCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
	@RequestMapping(value="/untreatedList",method=RequestMethod.POST)
	@ResponseBody
	public Object  selectUntreated(@RequestParam HashMap<String, Object> input){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = subscribeService.selectUntreated();
		int total = subscribeService.selectApplyCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
	@RequestMapping(value="/alreadyList",method=RequestMethod.POST)
	@ResponseBody
	public Object  selectAlready(@RequestParam HashMap<String, Object> input){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = subscribeService.selectAlready();
		int total = subscribeService.selectApplyCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
	@RequestMapping(value="/draftList",method=RequestMethod.POST)
	@ResponseBody
	public Object  selectDraft(@RequestParam HashMap<String, Object> input){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = subscribeService.selectDraft();
		int total = subscribeService.selectApplyCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
}
