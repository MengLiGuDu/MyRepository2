package com.kcls.action.logistics;

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

import com.kcls.bean.TypeBean;
import com.kcls.service.logistice.ApplyService;
import com.kcls.util.DateUtil;

@Controller
public class ApplyAction {

	@Resource
	private ApplyService applyService;
	
	@RequestMapping(value="addApply",method=RequestMethod.POST)
	@ResponseBody
	public Object addApply(@RequestParam HashMap<String,Object> map,HttpServletRequest request){
		
		map.put("apply_time", DateUtil.getDate());
		map.put("borrow_time", DateUtil.getDate());
		map.put("borrow_id", DateUtil.getUUID());
		map.put("apply_id", DateUtil.getUUID());
		String id = request.getSession().getAttribute("sessionUserUUID")+"";
		String opId = "402cf8e8-a3fd-4b04-8a53-e17324a57c84";
		map.put("operater_id", opId);//操作人
		map.put("borrowpeople_id", id);//借用人
		map.put("user_id", id);//申请人
		map.put("borrow_count", map.get("count"));
		String priceStr = map.get("goods_price")+"";
		String countStr = map.get("count")+"";
		Double price = Double.parseDouble(priceStr);
		Double count = Double.parseDouble(countStr);
		map.put("money_count",price*count);
		
		applyService.addApply(map);
		/*applyService.addBorrow(map);*/
		
		return map;
	}
	@RequestMapping(value="addDraftApply",method=RequestMethod.POST)
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
		
		applyService.addDraftApply(map);
		
		return map;
	}
	
	@RequestMapping(value="typeCheck",method=RequestMethod.POST)
	@ResponseBody
	public Object typeCheck(){
		
		List<TypeBean> list = applyService.typeCheck();
		
		return list;
	}
	
	@RequestMapping(value="borrowList",method=RequestMethod.POST)
	@ResponseBody
	public Object queryApprovallim(@RequestParam HashMap<String, Object> input,HttpServletRequest request){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		String id = request.getSession().getAttribute("sessionUserUUID")+"";
		in.put("uuid", id);
		List<HashMap<String, Object>> list = applyService.queryBorrow(in);
		List<HashMap<String, Object>> li = applyService.queryBorrowCount(in);
		int total = li.size();
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
	@RequestMapping(value="detailBorrow",method=RequestMethod.POST)
	@ResponseBody
	public Object detailBorrow(@RequestParam HashMap<String, Object> input){
		

		List<HashMap<String, Object>> list = applyService.detailBorrow(input);
		
		HashMap<String, Object> in = list.get(0);
		
		String priceStr = in.get("goods_price")+"";
		String money_countStr = in.get("money_count")+"";
		Double price = Double.parseDouble(priceStr);
		Double money_count = Double.parseDouble(money_countStr);
		Double count = money_count/price;
		in.put("count", count);
		
		return list;
	}
	
	@RequestMapping(value="withdrawApply",method=RequestMethod.POST)
	@ResponseBody
	public Object withdrawApply(@RequestParam HashMap<String, Object> input){
		
		applyService.withdrawApply(input);
		
		return input;
	}
	
}
