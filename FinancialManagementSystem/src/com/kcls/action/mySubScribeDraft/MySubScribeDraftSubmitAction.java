package com.kcls.action.mySubScribeDraft;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.SubScribeBean;
import com.kcls.service.MySubScribeDraftService;

/*
 * �ҵ��깺�ݹ�submit
 */
@Controller
public class MySubScribeDraftSubmitAction {

	@Resource(name="mySubScribeDraftService")
	private MySubScribeDraftService mySubScribeDraftService;
	
	@RequestMapping(value="subscribeDraft_sub")
	@ResponseBody
	public Object submit(SubScribeBean subS){
		//�깺״̬ ��Ϊ 2��������
		
		subS.setCashier_state(2);
		mySubScribeDraftService.submitSubscribeDraft(subS);
		
		return true;
	}
	
}
