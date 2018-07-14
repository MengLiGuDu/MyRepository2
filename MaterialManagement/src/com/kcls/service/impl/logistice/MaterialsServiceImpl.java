package com.kcls.service.impl.logistice;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.GoodsBean;
import com.kcls.mapper.logistice.MaterialsMapper;
import com.kcls.service.logistice.MaterialsService;

@Service
public class MaterialsServiceImpl implements MaterialsService {
	
	@Resource
	private MaterialsMapper materialsMapper;

	@Override
	public List<HashMap<String, Object>> MaterialsList(
			HashMap<String, Object> input) {
		 return materialsMapper.MaterialsList(input);
	}

	@Override
	public Integer MaterialsCount(HashMap<String, Object> input) {
		return materialsMapper.MaterialsCount(input);
	}

	@Override
	public void MaterialsAdd(GoodsBean goodsBean) {
		materialsMapper.MaterialsAdd(goodsBean);
	}

	@Override
	public List<HashMap<String, Object>> materialsTypeSelect() {
		
		return materialsMapper.materialsTypeSelect();
	}
	
	
	
	

}
