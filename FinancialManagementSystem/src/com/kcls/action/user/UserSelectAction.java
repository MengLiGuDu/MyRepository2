package com.kcls.action.user;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.Page;
import com.kcls.bean.UserBean;
import com.kcls.service.UserService;

@Controller
public class UserSelectAction {

	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping(value="/user_select.action",method=RequestMethod.POST)
	@ResponseBody
	public Object select(Page page){
		
		if(page.getSearchText() == null){
			page.setSearchText("");
		}
		if(page.getPageNumber() != null){
			Integer p = (page.getPageNumber() - 1) * page.getPageSize();
			page.setPageNumber(p);
		}
		
		
		List<UserBean> listCount = userService.selectUserCount(page);
		List<UserBean> list = userService.selectUser(page);

		HashMap<String,Object> map = new HashMap<String,Object>();

		map.put("total", listCount.size());
		map.put("rows", list);
		
		return map;
	}
}
