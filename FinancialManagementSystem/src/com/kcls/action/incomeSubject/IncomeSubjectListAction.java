package com.kcls.action.incomeSubject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.IncomeSubjectBean;
import com.kcls.bean.Page;
import com.kcls.bean.PaySubjectBean;
import com.kcls.bean.YearBean;
import com.kcls.service.IncomeSubjectService;



@Controller
public class IncomeSubjectListAction {
	
	
	@Resource(name="IncomeSubjectService")
	private IncomeSubjectService  service;
	
	@RequestMapping(value="/income_subject_list.action",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(Page page) {
		
		/*if(page.getSearchText() == null){
			page.setSearchText("");
		}*/
		
		if(page.getPageNumber() != null){
			page.setPageNumber((page.getPageNumber() - 1) * page.getPageSize());
			 
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows",  service.select(page));
		map.put("total",service.selectCount(page));
		return   map;
		 
	}
}
