package com.kcls.action.year;


import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.YearBean;
import com.kcls.service.YearService;
import com.kcls.util.CommonUtil;

@Controller
public class  YearAddAction{

	@Resource(name="yearService")
	private YearService yearService;
	
	@RequestMapping(value="/year_insert.action",method=RequestMethod.POST)
	@ResponseBody
	public Object add(YearBean year,HttpServletRequest request){
		
		UUID uuid = UUID.randomUUID();
		
		year.setYear_id(""+uuid);
		year.setCreate_date(CommonUtil.getTime());
		
		yearService.insertYear(year);  
		
		
		
		
		return year;
	}
	
}
