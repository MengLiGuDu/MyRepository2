package com.kcls.action.product;

import java.util.ArrayList;
import java.util.List;




import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.Product;
import com.kcls.bean.ReceiveData;
import com.kcls.bean.Rum;
import com.kcls.service.ProductService;
import com.kcls.util.CommonData;

@Controller
public class ProductAction {
	
	
	@Resource(name="productService")
	private ProductService productService;
	
	@RequestMapping(value="/productpage",method=RequestMethod.GET)
	public String ProductPage(){
		return "app/jsp/product_manager/product";
	}
	
	
	
	@RequestMapping(value="/insertProduct",method=RequestMethod.POST)
	@ResponseBody
	public Object insertProduct(Product product){
		product.setProduct_id(CommonData.getUuid());
		product.setCreate_time(CommonData.getTime());
		productService.insert(product);
		return product;
	}

	@RequestMapping(value="/selectProduct",method=RequestMethod.POST)//查询分页的所有数据
	@ResponseBody
	public Object select(ReceiveData data){
		data.setPageNumber((data.getPageNumber()-1)*data.getPageSize());
		List<Product> list = new ArrayList<Product>();
		List<Product> stuList = new ArrayList<Product>();
		if(data.getName() == null){
			data.setName("");
		}
		list = productService.dimSelectSize(data);
		stuList = productService.dimSelectDemo(data);
		Rum rum = new Rum();
		rum.setTotal(list.size());
		rum.setRows(stuList);
		return rum;
	}
	
	@RequestMapping(value="/updateProduct",method=RequestMethod.POST)
	@ResponseBody
	public Object updateProduct(Product product){
		productService.update(product);
		return product;
	}
	
	
	@RequestMapping(value="/modalUpdateSelect",method=RequestMethod.POST)//模态框修改后的查询
	@ResponseBody
	public Object select(Product product){
		 List<Product> list = productService.modalSelect(product);
		 System.out.println(list.size());
		 return list.get(0);
	}
	
	
	@RequestMapping(value="/delProduct",method=RequestMethod.POST)
	@ResponseBody
	public Object delProduct(Product product){
		productService.delete(product);
		return product;
	}
}
