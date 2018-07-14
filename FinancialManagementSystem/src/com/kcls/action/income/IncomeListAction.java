package com.kcls.action.income;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.IncomeBean;
import com.kcls.bean.Page;
import com.kcls.bean.PagingBean;
import com.kcls.service.IncomeService;

@Controller
public class IncomeListAction {

	@Resource(name="IncomeService")
	private IncomeService service;
	
	@RequestMapping(value="/income_list",method=RequestMethod.POST)
    @ResponseBody
    public Object pagelist(Page page, HttpServletRequest request,
            HttpServletResponse response) {
		if(page.getSearchText()==null){
        	page.setSearchText("");
        }
        page.setPageNumber((page.getPageNumber()-1) * page.getPageSize());
        List<IncomeBean> list = service.pageMessage(page);
        PagingBean util = new PagingBean();
        Integer count = service.allMessage(page);
        util.setTotal(count);
        util.setRows(list);
        return util; 
	}
}
