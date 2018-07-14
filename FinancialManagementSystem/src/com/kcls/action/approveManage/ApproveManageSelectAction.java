package com.kcls.action.approveManage;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.ApproveRecordBean;
import com.kcls.bean.Page;
import com.kcls.service.ApproveManageService;

/*
 * 审批管理select
 */
@Controller
public class ApproveManageSelectAction {

	@Resource(name="approveManageService")
	private ApproveManageService approveManageService;
	
	/*
	 * 报销表
	 */
	@RequestMapping(value="reimbursementTable_sel",method=RequestMethod.POST)
	@ResponseBody
	public Object selectReimbursement(Page page){
		if(page.getSearchText() == null){
			page.setSearchText("");
		}
		if(page.getPageNumber() == null || page.getPageSize() == null){
			page.setPageNumber(1);
			page.setPageSize(5);
		}
		page.setPageNumber((page.getPageNumber() - 1) * page.getPageSize());
		
		Integer number = 5;
		List<ApproveRecordBean> list = new ArrayList<ApproveRecordBean>();
		
		ApproveRecordBean ar = new ApproveRecordBean();
		ar.setApproveRecord_id("1");
		ar.setUser_id("100001");
		ar.setApprove_id("1");
		ar.setApproval_content("我是审批内容1");
		ar.setApproval_date(new Date().toString());
		ar.setApproval_state(0);
		list.add(ar);
		list.add(ar);
		list.add(ar);
		list.add(ar);
		list.add(ar);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("total", number);
		map.put("rows", list);
		return map;
	}
	
	/*
	 * 申购表
	 */
	@RequestMapping(value="subscribeTable_sel",method=RequestMethod.POST)
	@ResponseBody
	public Object selectSubscribe(Page page){
		if(page.getSearchText() == null){
			page.setSearchText("");
		}
		if(page.getPageNumber() == null || page.getPageSize() == null){
			page.setPageNumber(1);
			page.setPageSize(5);
		}
		page.setPageNumber((page.getPageNumber() - 1) * page.getPageSize());
		
		Integer number = 5;
		List<ApproveRecordBean> list = new ArrayList<ApproveRecordBean>();
		
		ApproveRecordBean ar = new ApproveRecordBean();
		ar.setApproveRecord_id("1");
		ar.setUser_id("100001");
		ar.setApprove_id("1");
		ar.setApproval_content("我是申购内容1");
		ar.setApproval_date(new Date().toString());
		ar.setApproval_state(0);
		list.add(ar);
		list.add(ar);
		list.add(ar);
		list.add(ar);
		list.add(ar);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("total", number);
		map.put("rows", list);
		return map;
	}
	
}
