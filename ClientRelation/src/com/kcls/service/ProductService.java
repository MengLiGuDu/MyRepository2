package com.kcls.service;


import java.util.List;

import com.kcls.bean.Product;
import com.kcls.bean.ReceiveData;

public interface ProductService {
	
	public List<Product>modalSelect(Product product);
	
	public List<Product> dimSelectSize(ReceiveData data);
	
	public List<Product> dimSelectDemo(ReceiveData data);
	
	public void update(Product product);
	
	public void delete(Product product);
	
	public void insert(Product product);
	
	public List<Product> selectAllProduct();
	
}
