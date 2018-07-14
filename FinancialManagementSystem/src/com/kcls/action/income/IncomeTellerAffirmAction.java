package com.kcls.action.income;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.IncomeBean;
import com.kcls.bean.Page;
import com.kcls.service.IncomeService;
//´ý³öÄÉÈ·ÈÏ

@Controller
public class IncomeTellerAffirmAction {

	@Resource(name="IncomeService")
	private IncomeService service;
	
	@RequestMapping(value="income_teller_affirm_select.action",method=RequestMethod.POST)
	@ResponseBody
	public Object select(Page page){
		
		page.setState(2);
		
		if(page.getSearchText2() == null || page.getSearchText2().equals("null")){
			page.setSearchText2("");
		}
		if(page.getPageNumber() != null){
			Integer p = (page.getPageNumber() - 1) * page.getPageSize();
			page.setPageNumber(p);
		}
		List<IncomeBean> listCount = service.selectWaitTellerCount(page);
		List<IncomeBean> list = service.selectWaitTeller(page);
		

		HashMap<String,Object> map = new HashMap<String,Object>();

		map.put("total", listCount.size());
		map.put("rows", list);
		
		return map;
	}
	
}
