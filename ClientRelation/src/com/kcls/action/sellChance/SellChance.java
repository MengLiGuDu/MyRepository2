package com.kcls.action.sellChance;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kcls.bean.Chance;
import com.kcls.bean.Client;
import com.kcls.bean.Person;
import com.kcls.bean.ReceiveData;
import com.kcls.bean.Rum;
import com.kcls.service.ClientService;
import com.kcls.service.EmployeeService;
import com.kcls.service.SellChanceService;
import com.kcls.util.CommonData;

@Controller
public class SellChance {

	@Resource(name="sellChanceService")
	private SellChanceService sellChanceService;
	
	@Resource(name="clientService")
	private ClientService clientService;
	
	@Resource(name="employeeService")
	private EmployeeService employeeService;
	
	@RequestMapping(value="/sellChance",method=RequestMethod.GET)
	public ModelAndView sellChance(){
		ModelAndView model = new ModelAndView("app/jsp/sell_chance/sell_chance");
		List<Client> clientList = clientService.selectAllClient();
		List<Person> personList = employeeService.selectAllPerson();
		model.addObject("clientList",clientList);
		model.addObject("personList",personList);
		return model;
	}
	
	@RequestMapping(value="/sellChanceSelect",method=RequestMethod.POST)
	@ResponseBody
	public Object sellChanceSelect(ReceiveData data){
		data.setPageNumber((data.getPageNumber()-1)*data.getPageSize());
		List<Chance> list = new ArrayList<Chance>();
		List<Chance> stuList = new ArrayList<Chance>();
		if(data.getName() == null){
			data.setName("");
		}
		list = sellChanceService.dimSelectSize(data);
		stuList = sellChanceService.dimSelectSellChance(data);
		Rum rum = new Rum();
		rum.setTotal(list.size());
		rum.setRows(stuList);
		return rum;
	}
	
	@RequestMapping(value="/cellChanceModify",method=RequestMethod.POST)
	@ResponseBody
	public Object cellChanceModify(Chance chance){
		if(chance.getChance_id().isEmpty()){
			chance.setChance_id(CommonData.getUuid());
			chance.setCreate_time(CommonData.getTime());
			sellChanceService.addChance(chance);
		}else{
			sellChanceService.sellChanceModify(chance);
		}
		return null;
	}
	
	@RequestMapping(value="/sellChanceDelete",method=RequestMethod.POST)
	@ResponseBody
	public Object sellChanceDelete(Chance chance){
		sellChanceService.sellChanceDelete(chance);
		return null;
	}
	
	@RequestMapping(value="/sellChanceSelectClient",method=RequestMethod.POST)
	@ResponseBody
	public Object sellChanceSelectClient(Client client){
		List<Client> list = clientService.select(client);
		Client clients = list.get(0);
		return clients;
	}
	
	@RequestMapping(value="/sellChanceSelectPerson",method=RequestMethod.POST)
	@ResponseBody
	public Object sellChanceSelectPerson(Person person){
		List<Person> list = employeeService.findList(person);
		Person persons = list.get(0);
		return persons;
	}
}



