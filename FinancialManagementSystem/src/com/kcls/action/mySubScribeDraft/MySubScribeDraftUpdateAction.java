package com.kcls.action.mySubScribeDraft;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.SubScribeBean;
import com.kcls.service.MySubScribeDraftService;

/*
 * Œ“µƒ…Íπ∫≤›∏Âupdate
 */
@Controller
public class MySubScribeDraftUpdateAction {

	@Resource(name="mySubScribeDraftService")
	private MySubScribeDraftService mySubScribeDraftService;
	
	@RequestMapping(value="subscribeDraft_upd")
	@ResponseBody
	public Object update(SubScribeBean subS){
		
		mySubScribeDraftService.updateSubscribeDraft(subS);
		
		return true;
	}
	
}
