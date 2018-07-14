package com.kcls.action.mySubScribeDraft;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.SubScribeBean;
import com.kcls.bean.UserBean;
import com.kcls.service.MySubScribeDraftService;
import com.kcls.util.CommonUtil;

/*
 * 我的申购草稿add
 */
@Controller
public class MySubScribeDraftAddAction {
	
	@Resource(name="mySubScribeDraftService")
	private MySubScribeDraftService mySubScribeDraftService;

	@RequestMapping(value="subscribeDraft_add",method=RequestMethod.POST)
	@ResponseBody
	public Object add(HttpSession session, SubScribeBean subS){
		
		UserBean user = (UserBean) session.getAttribute("loginUser");
		
		subS.setPurchase_id(CommonUtil.getUUID());
		subS.setUser_id(user.getUser_id());//用户
		subS.setCollection_account(subS.getCollection_account());//收款账户（待改）
		subS.setPurchase_date(CommonUtil.getTime());
		subS.setDeal_type("现金");//结算方式
		subS.setCashier_state(0);//申购状态（0:草稿）
		
		mySubScribeDraftService.insertSubScribeDraft(subS);
		
		return true;
	}
	
}
