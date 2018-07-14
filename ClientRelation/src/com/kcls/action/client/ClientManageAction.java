package com.kcls.action.client;



import java.util.List;

import javax.annotation.Resource;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.Client;
import com.kcls.bean.Person;
import com.kcls.bean.ReceiveData;
import com.kcls.bean.Rum;
import com.kcls.service.ClientService;
import com.kcls.util.CommonData;

@Controller
public class ClientManageAction {
	
	@Resource(name="clientService")
	private ClientService  clientService;
	
  @RequestMapping(value="/plates",method=RequestMethod.POST)
	@ResponseBody
	public Object platelist(ReceiveData page, HttpServletRequest request,
            HttpServletResponse response) {
        if(page.getName()==null){
        	page.setName("");
        }
        page.setPageNumber((page.getPageNumber()-1) * page.getPageSize());
        List<Client> list = clientService.pageMessage(page);
        Rum util = new Rum();
        Integer count = clientService.allMessage(page);
        util.setTotal(count);
        util.setRows(list);
        return util;                                     
    } 
  
  
	@RequestMapping(value="/client_manage",method=RequestMethod.GET)
	public String client(){
		return "app/jsp/framwork/client/client_manage";
	}
}
