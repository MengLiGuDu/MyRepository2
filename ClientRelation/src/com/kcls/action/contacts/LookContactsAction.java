package com.kcls.action.contacts;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.Client;
import com.kcls.bean.Contacts;
import com.kcls.bean.ReceiveData;
import com.kcls.bean.Rum;
import com.kcls.service.ClientService;
import com.kcls.service.ContactsService;

@Controller
public class LookContactsAction {
	
	@Resource(name="contactsService")
	private ContactsService contactsService;
	
	@Resource(name="clientService")
	private ClientService clientService;

	@RequestMapping(value="/lookContacts",method=RequestMethod.GET)
	public String lookContacts(){
		
		return "app/jsp/contacts/look_contacts";
	}
	
	@RequestMapping(value="/lookContactsSelect",method=RequestMethod.POST)
	@ResponseBody
	public Object lookContactsSelect(ReceiveData data){
		data.setPageNumber((data.getPageNumber()-1)*data.getPageSize());
		List<Contacts> list = new ArrayList<Contacts>();
		List<Contacts> stuList = new ArrayList<Contacts>();
		if(data.getName() == null){
			data.setName("");
		}
		list = contactsService.dimSelectSize(data);
		stuList = contactsService.dimSelectSellContacts(data);
		Rum rum = new Rum();
		rum.setTotal(list.size());
		rum.setRows(stuList);
		return rum;
	}
	
	@RequestMapping(value="/lookContactsGetName",method=RequestMethod.POST)
	@ResponseBody
	public Object lookContactsGetName(Client client){
		List<Client> list = clientService.select(client);
		Client getClient = list.get(0);
		return getClient;
	}
}
