package com.kcls.action.purchase;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.NodeBean;
import com.kcls.bean.Page;
import com.kcls.bean.SubScribeBean;
import com.kcls.bean.TreeBean;
import com.kcls.service.PurchaseService;

@Controller
public class PurchaseSelectAction {

	@Resource(name="purchaseService")
	private PurchaseService purchase;

	@RequestMapping(value="/purchase_select",method=RequestMethod.POST)
	@ResponseBody
	public Object purchaseManage(Page page){
		if(page.getSearchText() == null){
			page.setSearchText("");
		}
		if(page.getPageNumber() != null){
			Integer in = (page.getPageNumber()-1)*page.getPageSize();
			page.setPageNumber(in);
		}
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("total",purchase.selectCountPurchase(page).size());
		map.put("rows", purchase.selectPurchase(page));	
		return map;
	}
}
