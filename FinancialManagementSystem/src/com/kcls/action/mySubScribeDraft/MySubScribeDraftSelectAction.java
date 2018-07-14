package com.kcls.action.mySubScribeDraft;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.NodeBean;
import com.kcls.bean.Page;
import com.kcls.bean.SubScribeBean;
import com.kcls.bean.TreeBean;
import com.kcls.bean.UserBean;
import com.kcls.service.MySubScribeDraftService;
import com.kcls.util.CommonUtil;

/*
 * 我的申购草稿select
 */
@Controller
public class MySubScribeDraftSelectAction {
	
	@Resource(name="mySubScribeDraftService")
	private MySubScribeDraftService mySubScribeDraftService;

	/*
	 * 分页数据
	 */
	@RequestMapping(value="subscribeDraft_sel")
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
		
		Integer number = mySubScribeDraftService.selectCount(page).size();
		List<SubScribeBean> list = mySubScribeDraftService.selectSubscribeDraft(page);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("total", number);
		map.put("rows", list);
		return map;
	}
	
	/*
	 * 支出科目树
	 */
	@RequestMapping(value="subscribeDraft_tree",method=RequestMethod.POST)
	@ResponseBody
	public Object tree(){
		//查询所有支出科目
		List<NodeBean> list = mySubScribeDraftService.paySubjectTree();
		List<TreeBean> TreeList = CommonUtil.getTree(list);
		return TreeList;
	}
	
	/*
	 * 明细
	 */
	@RequestMapping(value="subscribeDraft_det",method=RequestMethod.POST)
	@ResponseBody
	public Object detail(SubScribeBean subS){
		
		subS = mySubScribeDraftService.MySubscribeDraft_Detail(subS);
		
		return subS;
	}
}
