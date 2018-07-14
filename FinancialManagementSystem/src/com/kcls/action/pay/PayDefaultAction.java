package com.kcls.action.pay;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.AccountBean;
import com.kcls.bean.PaySubjectBean;
import com.kcls.bean.SpendingBean;
import com.kcls.bean.TreeBean;
import com.kcls.service.PayService;
import com.kcls.util.CommonUtil;

@Controller
public class PayDefaultAction {
	@Resource(name="payService")
	public PayService pay;
	
	@RequestMapping(value="/getTree",method=RequestMethod.POST)
	@ResponseBody
	public List<TreeBean> getTree(){
		List<TreeBean> list = CommonUtil.getTree(pay.getNodes());
		return list;
	}
	
	@RequestMapping(value="/getSelect",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,List> getSelect(){
		Map<String,List> map = new HashMap<String,List>();
		List<PaySubjectBean> courseList = pay.getCourse();
		List<AccountBean> accountList = pay.getAccount();
		map.put("courseList", courseList);
		map.put("accountList", accountList);
		return map;
	}
	
	@RequestMapping(value="/getSpending",method=RequestMethod.POST)
	@ResponseBody
	public SpendingBean getSpending(SpendingBean bean){
		bean = pay.getSpending(bean).get(0);
		return bean;
	}
}
