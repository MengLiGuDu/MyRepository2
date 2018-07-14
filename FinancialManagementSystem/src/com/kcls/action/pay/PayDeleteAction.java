package com.kcls.action.pay;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.SpendingBean;
import com.kcls.service.PayService;

@Controller
public class PayDeleteAction {
	@Resource(name="payService")
	public PayService pay;
	
	@RequestMapping(value="/payDelete",method=RequestMethod.POST)
	@ResponseBody
	public SpendingBean payDelete(SpendingBean bean){
		return null;
	}
}
