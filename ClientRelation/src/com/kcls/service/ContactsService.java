package com.kcls.service;

import java.util.List;

import com.kcls.bean.Contacts;
import com.kcls.bean.ReceiveData;

public interface ContactsService {

	public List<Contacts> dimSelectSize(ReceiveData data);
	
	public List<Contacts> dimSelectSellContacts(ReceiveData data);
	
	public void addContacts(Contacts conteact);
	
	public void contactsModify(Contacts conteact);
	
	public void contactsDelete(Contacts conteact);
}
