package com.kcls.action.pay;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.Page;
import com.kcls.service.PayService;

@Controller
public class SelectPayAction {
	@Resource(name="payService")
	public PayService pay;
	
	@RequestMapping(value="/selectPayTable",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getTable(Page bean){
		if(bean.getSearchText2().equals("null")){
			bean.setSearchText2("");
		}
		bean.setPageNumber((bean.getPageNumber()-1)*bean.getPageSize());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("rows", pay.selectPay(bean));
		map.put("total", pay.selectPayCount(bean));
		return map;
	}
}
