package com.kcls.service.logistice;

import java.util.HashMap;
import java.util.List;

import com.kcls.bean.GoodsBean;

public interface MaterialsService {
	
	List<HashMap<String,Object>> MaterialsList(HashMap<String,Object> input);
	
	Integer MaterialsCount(HashMap<String,Object> input);
	
	void MaterialsAdd(GoodsBean goodsBean);
	
	List<HashMap<String,Object>> materialsTypeSelect();
	
}
