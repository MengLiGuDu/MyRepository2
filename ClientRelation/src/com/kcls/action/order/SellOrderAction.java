package com.kcls.action.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SellOrderAction {

	@RequestMapping(value="/sellOrder",method=RequestMethod.GET)
	public ModelAndView sellOrder(){
		
		ModelAndView model = new ModelAndView("app/jsp/order/sell_order");
		return model;
	}
}
