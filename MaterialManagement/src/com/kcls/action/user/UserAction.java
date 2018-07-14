package com.kcls.action.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.service.UserService;
import com.kcls.service.logistice.ApplyService;
import com.kcls.util.DateUtil;

@Controller
public class UserAction {

	@Resource
	private UserService userServive;
	
	@Resource
	private ApplyService applyService;
	
	@RequestMapping(value="addApply1",method=RequestMethod.POST)
	@ResponseBody
	public Object addApply(@RequestParam HashMap<String,Object> map,HttpServletRequest request){
		
		map.put("apply_time", DateUtil.getDate());
		map.put("receive_time", DateUtil.getDate());
		map.put("receive_id", DateUtil.getUUID());
		map.put("apply_id", DateUtil.getUUID());
		String id = request.getSession().getAttribute("sessionUserUUID")+"";
		String opId = "402cf8e8-a3fd-4b04-8a53-e17324a57c84";
		map.put("operater", opId);//操作人
		map.put("user_id", id);//申请人
		map.put("goods_count", map.get("count"));
		String priceStr = map.get("goods_price")+"";
		String countStr = map.get("count")+"";
		Double price = Double.parseDouble(priceStr);
		Double count = Double.parseDouble(countStr);
		map.put("money_count",price*count);
		
		userServive.addApply(map);
		/*userServive.addReceive(map);*/
		
		return map;
	}
	
	@RequestMapping(value="addApply2",method=RequestMethod.POST)
	@ResponseBody
	public Object addApply2(@RequestParam HashMap<String,Object> map,HttpServletRequest request){
		
		map.put("apply_time", DateUtil.getDate());
		map.put("apply_id", DateUtil.getUUID());
		String id = request.getSession().getAttribute("sessionUserUUID")+"";
		map.put("user_id", id);//申请人
		String priceStr = map.get("goods_price")+"";
		String countStr = map.get("count")+"";
		Double price = Double.parseDouble(priceStr);
		Double count = Double.parseDouble(countStr);
		map.put("money_count",price*count);
		
		
		Object operate = map.get("operate");
		if(operate.equals("borrow")){
			applyService.addDraftApply(map);
		} else if(operate.equals("receive")){
			userServive.addDraftApply(map);
		} else {
			map.put("apply_id", map.get("idd"));
			userServive.modApply(map);
			
		}
		
		return map;
	}
	
	@RequestMapping(value="modApply",method=RequestMethod.POST)
	@ResponseBody
	public Object modApply(@RequestParam HashMap<String,Object> map){
		
		String priceStr = map.get("goods_price")+"";
		String countStr = map.get("count")+"";
		Double price = Double.parseDouble(priceStr);
		Double count = Double.parseDouble(countStr);
		map.put("money_count",price*count);
		map.put("apply_time", DateUtil.getDate());
		map.put("apply_id", map.get("idd"));
		userServive.modApply1(map);
		
		return map;
	} 
	
	@RequestMapping(value="fillModApply",method=RequestMethod.POST)
	@ResponseBody
	public Object fillMod(@RequestParam HashMap<String,Object> map){
		
		List<HashMap<String, Object>> list = userServive.detailReceive1(map);
		
		HashMap<String, Object> in = list.get(0);
		
		String priceStr = in.get("goods_price")+"";
		String money_countStr = in.get("money_count")+"";
		Double price = Double.parseDouble(priceStr);
		Double money_count = Double.parseDouble(money_countStr);
		Double count = money_count/price;
		in.put("count", count);
		
		return list;
	}
	
	@RequestMapping(value="addDraftApply1",method=RequestMethod.POST)
	@ResponseBody
	public Object addDraftApply(@RequestParam HashMap<String,Object> map,HttpServletRequest request){
		
		map.put("apply_time", DateUtil.getDate());
		map.put("apply_id", DateUtil.getUUID());
		String id = request.getSession().getAttribute("sessionUserUUID")+"";
		map.put("user_id", id);//申请人
		String priceStr = map.get("goods_price")+"";
		String countStr = map.get("count")+"";
		Double price = Double.parseDouble(priceStr);
		Double count = Double.parseDouble(countStr);
		map.put("money_count",price*count);
		
		userServive.addDraftApply(map);
		
		return map;
	}
	
	@RequestMapping(value="receiveList",method=RequestMethod.POST)
	@ResponseBody
	public Object receiveList(@RequestParam HashMap<String, Object> input,HttpServletRequest request){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		String id = request.getSession().getAttribute("sessionUserUUID")+"";
		in.put("uuid", id);
		List<HashMap<String, Object>> list = userServive.queryReceive(in);
		List<HashMap<String, Object>> li = userServive.queryReceiveCount(in);
		int total = li.size();
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
	@RequestMapping(value="draftList1",method=RequestMethod.POST)
	@ResponseBody
	public Object draftList(@RequestParam HashMap<String, Object> input,HttpServletRequest request){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		String id = request.getSession().getAttribute("sessionUserUUID")+"";
		in.put("uuid", id);
		List<HashMap<String, Object>> list = userServive.queryReceive1(in);
		List<HashMap<String, Object>> li = userServive.queryReceiveCount1(in);
		int total = li.size();
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
	@RequestMapping(value="detailReceive",method=RequestMethod.POST)
	@ResponseBody
	public Object detailReceive(@RequestParam HashMap<String, Object> input){
		
		List<HashMap<String, Object>> list = userServive.detailReceive(input);
		
		return list;
	}
	
	@RequestMapping(value="delDraft",method=RequestMethod.POST)
	@ResponseBody
	public Object delDraft(@RequestParam HashMap<String, Object> input){
		
		userServive.delDraft(input);
		
		return input;
	}
	
	@RequestMapping(value="borrowRecordList",method=RequestMethod.POST)
	@ResponseBody
	public Object borrowRecordList(@RequestParam HashMap<String, Object> input,HttpServletRequest request){
		
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		String id = request.getSession().getAttribute("sessionUserUUID")+"";
		in.put("uuid", id);
		List<HashMap<String, Object>> list = userServive.borrowRecordList(in);
		int total = userServive.borrowRecordListCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
	@RequestMapping(value="receiveRecordList",method=RequestMethod.POST)
	@ResponseBody
	public Object receiveRecordList(@RequestParam HashMap<String, Object> input,HttpServletRequest request){
		
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		String id = request.getSession().getAttribute("sessionUserUUID")+"";
		in.put("uuid", id);
		List<HashMap<String, Object>> list = userServive.receive1RecordList(in);
		int total = userServive.receive1RecordListCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
	
	
	
}
