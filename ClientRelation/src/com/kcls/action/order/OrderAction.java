package com.kcls.action.order;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kcls.bean.Client;
import com.kcls.bean.Order;
import com.kcls.bean.Person;
import com.kcls.bean.Product;
import com.kcls.bean.ReceiveData;
import com.kcls.bean.Rum;
import com.kcls.service.ClientService;
import com.kcls.service.EmployeeService;
import com.kcls.service.OrderService;
import com.kcls.service.ProductService;
import com.kcls.util.CommonData;

@Controller
public class OrderAction {
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	@Resource(name="clientService")
	private ClientService clientService;
	
	@Resource(name="employeeService")
	private EmployeeService employeeService;
	
	@Resource(name="productService")
	private ProductService productService;

	@RequestMapping(value="/order",method=RequestMethod.GET)
	public ModelAndView order(){
		ModelAndView model = new ModelAndView("app/jsp/order/order_select");
		List<Client> clientList = clientService.selectAllClient();
		List<Person> personList = employeeService.selectAllPerson();
		List<Product> productList = productService.selectAllProduct();
		model.addObject("clientList",clientList);
		model.addObject("personList",personList);
		model.addObject("productList",productList);
		return model;
	}
	
	@RequestMapping(value="/orderSelect",method=RequestMethod.POST)
	@ResponseBody
	public Object orderSelect(ReceiveData data){
		data.setPageNumber((data.getPageNumber()-1)*data.getPageSize());
		List<Order> list = new ArrayList<Order>();
		List<Order> stuList = new ArrayList<Order>();
		if(data.getName() == null){
			data.setName("");
		}
		list = orderService.dimSelectSize(data);
		stuList = orderService.dimSelectOrder(data);
		Rum rum = new Rum();
		rum.setTotal(list.size());
		rum.setRows(stuList);
		return rum;
	}
	
	@RequestMapping(value="/sellOrderSelect",method=RequestMethod.POST)
	@ResponseBody
	public Object sellOrderSelect(ReceiveData data){
		data.setPageNumber((data.getPageNumber()-1)*data.getPageSize());
		List<Order> list = new ArrayList<Order>();
		List<Order> stuList = new ArrayList<Order>();
		if(data.getName() == null){
			data.setName("");
		}
		list = orderService.sellDimSelectSize(data);
		stuList = orderService.sellDimSelectOrder(data);
		Rum rum = new Rum();
		rum.setTotal(list.size());
		rum.setRows(stuList);
		return rum;
	}
	
	
	@RequestMapping(value="/orderModify" , method=RequestMethod.POST)
	@ResponseBody
	public Object orderModify(Order order){
		Product product = new Product();
		product.setProduct_id(order.getProduct_id());
		List<Product> productList = productService.modalSelect(product);
		if(order.getOrder_id().isEmpty()){
			order.setOrder_id(CommonData.getUuid());
			order.setCreate_time(CommonData.getTime());
			order.setStatus("0");
			order.setCount(productList.get(0).getCount());
			order.setPrice(productList.get(0).getSource());
			orderService.addOrder(order);
		}else{
			order.setCount(productList.get(0).getCount());
			order.setPrice(productList.get(0).getSource());
			orderService.modifyOrder(order);
		}
		return null;
	}
	
	@RequestMapping(value="/updateStatus",method=RequestMethod.POST)
	@ResponseBody
	public Object updateStatus(Order order){
		if(order.getStatus().equals("0")){
			order.setStatus("1");
		}else{
			order.setStatus("0");
		}
		orderService.updateStatus(order);
		return null;
	}
	
	@RequestMapping(value="/orderSelectProduct",method=RequestMethod.POST)
	@ResponseBody
	public Object orderSelectProduct(Product product){
		Product reProduct = productService.modalSelect(product).get(0);
		return reProduct;
	}
}
