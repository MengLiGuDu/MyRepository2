package com.kcls.action.year;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.YearBean;
import com.kcls.service.YearService;

@Controller
public class YearDeleteAction {

	@Resource(name="yearService")
	private YearService yearService;
	
	@RequestMapping(value="/year_delete.action",method=RequestMethod.POST)
	@ResponseBody
	public Object delete(YearBean year,HttpServletRequest request){
		
		yearService.deleteYear(year);
		
		return year;
	}
	
}
