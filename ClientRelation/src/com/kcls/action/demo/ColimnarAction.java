package com.kcls.action.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.Product;

@Controller
public class ColimnarAction {

	@RequestMapping(value="/colimnarDemo" ,method=RequestMethod.POST)
	@ResponseBody
	public Object colimnar(){
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
}
