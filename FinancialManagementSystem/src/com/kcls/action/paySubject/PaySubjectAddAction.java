package com.kcls.action.paySubject;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.PaySubjectBean;
import com.kcls.service.PaySubjectService;
import com.kcls.util.CommonUtil;

/*
 * 支出科目add
 */
@Controller
public class PaySubjectAddAction {

	@Resource(name="paySubjectService")
	private PaySubjectService paySubjectService;
	
	@RequestMapping(value="paySubject_add",method=RequestMethod.POST)
	@ResponseBody
	public Object add(HttpServletRequest request, PaySubjectBean pay_s){
		
		if(pay_s.getFatherCourse_id().equals("0")){
			pay_s.setFatherCourse_id(null);
		}
		
		pay_s.setCourse_id(CommonUtil.getUUID());
		pay_s.setCreate_name(CommonUtil.getLoginUser(request.getSession()).getUser_name());
		pay_s.setCreate_date(CommonUtil.getTime());;
		
		paySubjectService.insertPaySubject(pay_s);
		
		return true;
	}
	
}
