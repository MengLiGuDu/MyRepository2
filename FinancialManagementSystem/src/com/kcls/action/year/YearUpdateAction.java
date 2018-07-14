package com.kcls.action.year;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.YearBean;
import com.kcls.service.YearService;

@Controller
public class YearUpdateAction {

	@Resource(name="yearService")
	private YearService yearService;
	
	@RequestMapping(value="/year_update.action",method=RequestMethod.POST)
	@ResponseBody
	public Object update(YearBean year){
		
		yearService.updateYear(year);
		return year;
	}
	
	@RequestMapping(value="/year_modify.action",method=RequestMethod.POST)
	@ResponseBody
	public Object modify(YearBean year,HttpServletRequest request){
		
		List<YearBean> list = yearService.selectJudgeYear(year);
		
		return list.get(0);
	}
}
