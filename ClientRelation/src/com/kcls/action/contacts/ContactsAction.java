package com.kcls.action.contacts;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kcls.bean.Client;
import com.kcls.bean.Contacts;
import com.kcls.bean.ReceiveData;
import com.kcls.bean.Rum;
import com.kcls.service.ClientService;
import com.kcls.service.ContactsService;
import com.kcls.util.CommonData;

@Controller
public class ContactsAction {
	
	@Resource(name="contactsService")
	private ContactsService contactsService;
	
	@Resource(name="clientService")
	private ClientService clientService;
	
	@RequestMapping(value="/contacts",method=RequestMethod.GET)
	public ModelAndView contacts(){
		ModelAndView model = new ModelAndView("app/jsp/contacts/contacts");
		List<Client> clientList = clientService.selectAllClient();
		model.addObject("clientList",clientList);
		return model;
	}

	@RequestMapping(value="/contactsSelect",method=RequestMethod.POST)
	@ResponseBody
	public Object contactsSelect(ReceiveData data){
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
	
	@RequestMapping(value="/contactsModify",method=RequestMethod.POST)
	@ResponseBody
	public Object contactsModify(Contacts contacts){
		Client client = new Client();
		client.setClient_id(contacts.getClient_id());
		List<Client> newList = clientService.select(client);
		Client getClient = newList.get(0);
		if(contacts.getContacts_id().isEmpty()){
			contacts.setContacts_id(CommonData.getUuid());
			contacts.setName(getClient.getClient_name());
			contacts.setPhone(getClient.getPhone());
			contactsService.addContacts(contacts);
		}else{
			contacts.setName(getClient.getClient_name());
			contacts.setPhone(getClient.getPhone());
			contactsService.contactsModify(contacts);
		}
		return null;
	}
	
	@RequestMapping(value="/contactsDelete",method=RequestMethod.POST)
	@ResponseBody
	public Object contactsDelete(Contacts contacts){
		contactsService.contactsDelete(contacts);
		return null;
	}
}
