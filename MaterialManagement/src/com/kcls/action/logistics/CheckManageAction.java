package com.kcls.action.logistics;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.PagingBean;
import com.kcls.bean.CheckBean;
import com.kcls.bean.PageBean;
import com.kcls.service.logistice.CheckService;



@Controller
public class CheckManageAction {
	@Resource(name="CheckService")
	private CheckService articleService;
	
    @RequestMapping(value="/paging_check",method=RequestMethod.POST)
    @ResponseBody
    public Object page4list(PageBean page, HttpServletRequest request,
            HttpServletResponse response) {
        System.out.println(page.getSearchText());
        if(page.getSearchText()==null){
        	page.setSearchText("");
        }
        page.setPageNumber((page.getPageNumber()-1) * page.getPageSize());
        List<CheckBean> list = articleService.dimPageMessage(page);
        PagingBean util = new PagingBean();
        Integer count = articleService.dimAllMessage(page);
        util.setTotal(count);
        util.setRows(list);
        return util;                                     
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

