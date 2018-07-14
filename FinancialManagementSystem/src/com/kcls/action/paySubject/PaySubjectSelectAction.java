package com.kcls.action.paySubject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.Page;
import com.kcls.bean.PaySubjectBean;
import com.kcls.service.PaySubjectService;

/*
 * ֧����Ŀselect
 */
@Controller
public class PaySubjectSelectAction {

	@Resource(name="paySubjectService")
	private PaySubjectService paySubjectService;
	
	/*
	 * ��ҳ��ѯ
	 */
	@RequestMapping(value="paySubject_sel",method=RequestMethod.POST)
	@ResponseBody
	public Object select(Page page){
		if(page.getSearchText() == null){
			page.setSearchText("");
		}
		if(page.getPageNumber() == null || page.getPageSize() == null){
			page.setPageNumber(1);
			page.setPageSize(5);
		}
		page.setPageNumber((page.getPageNumber() - 1) * page.getPageSize());
		
		Integer number = paySubjectService.selectCount(page).size();
		List<PaySubjectBean> list = paySubjectService.selectPaySubject(page);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("total", number);
		map.put("rows", list);
		return map;
	}
	
	/*
	 * ��ȡ���и���Ŀ
	 */
	@RequestMapping(value="father_paySubject",method=RequestMethod.POST)
	@ResponseBody
	public Object father_paySubject(){
		
		List<PaySubjectBean> list = paySubjectService.allFatherPaySubject();
		
		return list;
	}
	
	
	/*
	 * ��ȡ���ж���֧����Ŀ
	 */
	@RequestMapping(value="all_two_say_subject",method=RequestMethod.POST)
	@ResponseBody
	public List<PaySubjectBean> all_two_say_subject(){
		
		return paySubjectService.allTwoPaySubject();
	}
}
