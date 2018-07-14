package com.kcls.action.pendingTrial;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.Page;
import com.kcls.bean.SubScribeBean;
import com.kcls.bean.UserBean;
import com.kcls.service.PendingTrialSubscribeService;

/*
 * 待审申购单
 */
@Controller
public class PendingTrialSubscribeSelectAction {

	@Resource(name="pendingTrialSubscribeService")
	private PendingTrialSubscribeService pendingTrialSubscribeService;
	
	/*
	 * 分页数据
	 */
	@RequestMapping(value="pendingTrial_subscribe")
	@ResponseBody
	public Object select(HttpSession session, Page page){
		if(page.getSearchText() == null){
			page.setSearchText("");
		}
		if(page.getSearchText2() == null){
			page.setSearchText2("");
		}
		if(page.getPageNumber() == null || page.getPageSize() == null){
			page.setPageNumber(1);
			page.setPageSize(5);
		}
		UserBean user = (UserBean) session.getAttribute("loginUser");
		page.setPageNumber((page.getPageNumber() - 1) * page.getPageSize());
		page.setSearchText1(user.getUser_id());
		
		//查找待审批（state = 2）
		Integer number = pendingTrialSubscribeService.selectCount(page).size();
		List<SubScribeBean> list = pendingTrialSubscribeService.selectPendingTrialSubscribe(page);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("total", number);
		map.put("rows", list);
		return map;
	}
	
}
