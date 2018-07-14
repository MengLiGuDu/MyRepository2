package com.kcls.action.purchase;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kcls.bean.TreeBean;
import com.kcls.service.PurchaseService;
import com.kcls.util.CommonUtil;

@Controller
public class PurchaseTreeQueryAction {

	@Resource(name="purchaseService")
	private PurchaseService purchase;
	
	@RequestMapping(value="/reimbursemement",method=RequestMethod.POST)
	@ResponseBody
	public List<TreeBean> TreeSelect(){
		List<TreeBean> list = CommonUtil.getTree(purchase.getNodesTree()) ;
		return list;
	}
	
}
