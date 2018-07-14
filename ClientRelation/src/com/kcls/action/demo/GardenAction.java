package com.kcls.action.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.Product;


@Controller
public class GardenAction {
	
	@RequestMapping(value="/gardenDemo",method=RequestMethod.POST)
	@ResponseBody
	public Object gardenDemo(){
		List<Product> list = new ArrayList<Product>();
		Product p1 = new Product();
		p1.setName("z");
		p1.setCount("45");
		Product p2 = new Product();
		p2.setName("l");
		p2.setCount("25");
		Product p3 = new Product();
		p3.setName("w");
		p3.setCount("30");
		list.add(p1);
		list.add(p2);
		list.add(p3);
		return list;
	}
	
	@RequestMapping(value="/gardenDemoTwo",method=RequestMethod.POST)
	@ResponseBody
	public Object gardenDemoTwo(){
		List<Product> list = new ArrayList<Product>();
		Product p4 = new Product();
		p4.setName("x");
		p4.setCount("30");
		Product p5 = new Product();
		p5.setName("y");
		p5.setCount("20");
		Product p6 = new Product();
		p6.setName("i");
		p6.setCount("35");
		list.add(p4);
		list.add(p5);
		list.add(p6);
		return list;
	}
}
