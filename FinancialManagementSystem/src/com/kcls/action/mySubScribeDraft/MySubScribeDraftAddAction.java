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
 * �ҵ��깺�ݸ�add
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
		subS.setUser_id(user.getUser_id());//�û�
		subS.setCollection_account(subS.getCollection_account());//�տ��˻������ģ�
		subS.setPurchase_date(CommonUtil.getTime());
		subS.setDeal_type("�ֽ�");//���㷽ʽ
		subS.setCashier_state(0);//�깺״̬��0:�ݸ壩
		
		mySubScribeDraftService.insertSubScribeDraft(subS);
		
		return true;
	}
	
}
