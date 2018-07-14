package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.Client;
import com.kcls.bean.Product;
import com.kcls.bean.ReceiveData;
import com.kcls.mapper.ProductMapper;
import com.kcls.service.ProductService;
@Service(value="productService")
public class ProductServiceImpl implements ProductService{
	@Resource(name="productMapper")
	public ProductMapper productMapper;

	@Override
	public void update(Product product) {
		productMapper.update(product);
		
	}

	@Override
	public void delete(Product product) {
		productMapper.delete(product);
		
	}

	@Override
	public void insert(Product product) {
		productMapper.insert(product);
	}

	@Override
	public List<Product> dimSelectSize(ReceiveData data) {
		
		List<Product> list=productMapper.dimSelectSize(data);
		if (list!=null) {
			return list;
		}
		return null;
	}

	@Override
	public List<Product> dimSelectDemo(ReceiveData data) {
		List<Product> list=productMapper.dimSelectDemo(data);
		if (list!=null) {
			return list;
		}
		return null;
	}

	@Override
	public List<Product> modalSelect(Product product) {
		List<Product> list = productMapper.modalSelect(product);
		if (list!=null) {
			return list;
		}
		return null;
	}

	@Override
	public List<Product> selectAllProduct() {
		List<Product> list = productMapper.selectAllProduct();
		return list;
	}
}
