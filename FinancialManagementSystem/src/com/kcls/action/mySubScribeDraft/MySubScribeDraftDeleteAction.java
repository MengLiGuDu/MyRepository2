package com.kcls.action.mySubScribeDraft;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.SubScribeBean;
import com.kcls.service.MySubScribeDraftService;

/*
 * Œ“µƒ…Íπ∫≤›∏Âdelete
 */
@Controller
public class MySubScribeDraftDeleteAction {

	@Resource(name="mySubScribeDraftService")
	private MySubScribeDraftService mySubScribeDraftService;
	
	@RequestMapping(value="subscribeDraft_del")
	@ResponseBody
	public Object delete(SubScribeBean subS){
		
		mySubScribeDraftService.deleteSubscribeDraft(subS);
		
		return true;
	}
	
}
