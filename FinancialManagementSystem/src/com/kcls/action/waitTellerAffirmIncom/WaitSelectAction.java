package com.kcls.action.waitTellerAffirmIncom;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.NodeBean;
import com.kcls.service.IncomeSubjectService;
import com.kcls.util.CommonUtil;

@Controller
public class WaitSelectAction {

	@Resource(name="IncomeSubjectService")
	private IncomeSubjectService  service;
	
	@RequestMapping(value="income_subject_tree.action",method=RequestMethod.POST)
	@ResponseBody
	public Object selectTree(){
		
		List<NodeBean> list = service.selectTree();
		
		
		return CommonUtil.getTree(list);
	}
	
}
