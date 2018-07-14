package com.kcls.action.pendingTrial;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.SubScribeBean;
import com.kcls.service.MySubScribeDraftService;
import com.kcls.service.PendingTrialSubscribeService;

/*
 * ´ýÉóÉê¹ºrevocation
 */
@Controller
public class PendingTrialSubscribeRevocationAction {

	@Resource(name="pendingTrialSubscribeService")
	private PendingTrialSubscribeService pendingTrialSubscribeService;
	@Resource(name="mySubScribeDraftService")
	private MySubScribeDraftService mySubScribeDraftService;
	
	@RequestMapping(value="pendingTrialSubscribe_revocation",method=RequestMethod.POST)
	@ResponseBody
	public Object revocation(SubScribeBean subS){
		
		//³·Ïú ×´Ì¬¸ÄÎª 0
		subS.setCashier_state(0);
		pendingTrialSubscribeService.revocationPendingTrialSubscribe(subS);
		
		return true;
	}
	
}
