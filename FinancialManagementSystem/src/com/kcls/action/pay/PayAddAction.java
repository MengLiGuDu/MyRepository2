package com.kcls.action.pay;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.SpendingBean;
import com.kcls.service.PayService;
import com.kcls.util.CommonUtil;

@Controller
public class PayAddAction {
	@Resource(name="payService")
	public PayService pay;
	
	@RequestMapping(value="/payAdd",method=RequestMethod.POST)
	@ResponseBody
	public SpendingBean payAdd(SpendingBean bean){//会计ID  还未加入
		bean.setPayment_name(pay.selectAAccount(bean));
		bean.setSpending_id(CommonUtil.getUUID());
		pay.payAdd(bean);
		return bean;
	}
}
