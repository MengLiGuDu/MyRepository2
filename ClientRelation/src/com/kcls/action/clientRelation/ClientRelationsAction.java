package com.kcls.action.clientRelation;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kcls.bean.Client;
import com.kcls.bean.Person;
import com.kcls.bean.ReceiveData;
import com.kcls.bean.Relation;
import com.kcls.bean.Rum;
import com.kcls.service.ClientRelationsService;
import com.kcls.service.ClientService;
import com.kcls.service.EmployeeService;
import com.kcls.util.CommonData;

@Controller
public class ClientRelationsAction {

	@Resource(name="clientRelationsService")
	private ClientRelationsService clientRelationsService;
	
	@Resource(name="clientService")
	private ClientService clientService;
	
	@Resource(name="employeeService")
	private EmployeeService employeeService;
	
	@RequestMapping(value="/clientManage",method=RequestMethod.GET)
	public ModelAndView sellChance(){
		ModelAndView model = new ModelAndView("app/jsp/client_relation/client_relation");
		List<Client> clientList = clientService.selectAllClient();
		List<Person> personList = employeeService.selectAllPerson();
		model.addObject("clientList",clientList);
		model.addObject("personList",personList);
		return model;
	}
	
	@RequestMapping(value="/clientManageSelect",method=RequestMethod.POST)
	@ResponseBody
	public Object sellChanceSelect(ReceiveData data){
		data.setPageNumber((data.getPageNumber()-1)*data.getPageSize());
		List<Relation> list = new ArrayList<Relation>();
		List<Relation> stuList = new ArrayList<Relation>();
		if(data.getName() == null){
			data.setName("");
		}
		list = clientRelationsService.dimSelectSize(data);
		stuList = clientRelationsService.dimSelectSellChance(data);
		Rum rum = new Rum();
		rum.setTotal(list.size());
		rum.setRows(stuList);
		return rum;
	}
	
	
	@RequestMapping(value="/clientManageSelectClient",method=RequestMethod.POST)
	@ResponseBody
	public Object clientManageSelectClient(Client client){
		List<Client> list = clientService.select(client);
		Client clients = list.get(0);
		return clients;
	}
	
	@RequestMapping(value="/clientManageSelectPerson",method=RequestMethod.POST)
	@ResponseBody
	public Object clientManageSelectPerson(Person person){
		List<Person> list = employeeService.findList(person);
		Person persons = list.get(0);
		return persons;
	}
	
	@RequestMapping(value="/insertClientRelation",method=RequestMethod.POST)
	@ResponseBody
	public Object insertClientRelation(Relation relation){
		relation.setRelation_id(CommonData.getUuid());
		relation.setTime(CommonData.getTime());
		clientRelationsService.addClientManage(relation);
		return relation;
	}
}



