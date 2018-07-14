package com.kcls.action.paySubject;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.PaySubjectBean;
import com.kcls.service.PaySubjectService;

/*
 * 支出科目delete
 */
@Controller
public class PaySubjectDeleteAction {

	@Resource(name="paySubjectService")
	private PaySubjectService paySubjectService;
	
	@RequestMapping(value="paySubject_del",method=RequestMethod.POST)
	@ResponseBody
	public Object delete(PaySubjectBean pay_s){
		
		List<PaySubjectBean> SonPay_s = paySubjectService.SonPaySubject(pay_s);
		
		if(SonPay_s == null || SonPay_s.size() == 0){
			paySubjectService.deletePaySubject(pay_s);
			return true;
		}
		return false;
	}
	
}
