package com.kcls.action.incomeSubject;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kcls.bean.IncomeSubjectBean;
import com.kcls.service.IncomeSubjectService;
import com.kcls.util.CommonUtil;

 

@Controller
public class IncomeSubjectAddAction {
	
	

	@Resource(name="IncomeSubjectService")
	private IncomeSubjectService  service;
	
	
	@RequestMapping(value="/income_subject_insert.action",method=RequestMethod.POST)
	@ResponseBody
	public   int  insert(IncomeSubjectBean  bean,HttpSession   session){
		

		if(bean.getFatherCourse_id().equals("")){
			bean.setFatherCourse_id(null);
		}
		
		/*UserBean UserBean = CommonUtil.getLoginUser(session);
		bean.setCourse_name(UserBean.getUser_name());*/

		Date date = new Date();
		bean.setCreate_date(date);
		
		bean.setCourse_id(CommonUtil.getUUID());
		
		return service.insert(bean);	
		
	}
}

