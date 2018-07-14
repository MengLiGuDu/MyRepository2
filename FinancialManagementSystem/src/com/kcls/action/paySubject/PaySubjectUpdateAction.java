package com.kcls.action.paySubject;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.PaySubjectBean;
import com.kcls.service.PaySubjectService;

/*
 * 支出科目update
 */
@Controller
public class PaySubjectUpdateAction {

	@Resource(name="paySubjectService")
	private PaySubjectService paySubjectService;
	
	@RequestMapping(value="paySubject_upd",method=RequestMethod.POST)
	@ResponseBody
	public Object update(PaySubjectBean pay_s){
		
		paySubjectService.updatePaySubject(pay_s);
		
		return true;
	}
	
}
