package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.Contacts;
import com.kcls.bean.ReceiveData;
import com.kcls.mapper.ContactsMapper;
import com.kcls.service.ContactsService;

@Service(value="contactsService")
public class ContactsServiceImpl implements ContactsService{

	@Resource(name="contactsMapper")
	private ContactsMapper contactsMapper;

	@Override
	public List<Contacts> dimSelectSize(ReceiveData data) {
		List<Contacts> list = contactsMapper.dimSelectSize(data);
		return list;
	}

	@Override
	public List<Contacts> dimSelectSellContacts(ReceiveData data) {
		List<Contacts> list = contactsMapper.dimSelectSellContacts(data);
		return list;
	}

	@Override
	public void addContacts(Contacts conteact) {
		contactsMapper.addContacts(conteact);
	}

	@Override
	public void contactsModify(Contacts conteact) {
		contactsMapper.contactsModify(conteact);
	}

	@Override
	public void contactsDelete(Contacts conteact) {
		contactsMapper.contactsDelete(conteact);
	}
}
