package com.kcls.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.GoodsBean;
import com.kcls.bean.TypeBean;
import com.kcls.mapper.MaterialsTypeMapper;
import com.kcls.service.MaterialsTypeService;

@Service
public class MaterialsTypeServiceImpl implements MaterialsTypeService{

	@Resource
	private MaterialsTypeMapper materialsTypeMapper;

	@Override
	public List<HashMap<String, Object>> MaterialsTypeList(HashMap<String, Object> map) {
		
		return materialsTypeMapper.MaterialsTypeList(map);
	}

	@Override
	public Integer MaterialsTypeCount(HashMap<String, Object> map) {
		
		return materialsTypeMapper.MaterialsTypeCount(map);
	}

	@Override
	public void addMaterialsType(TypeBean type) {
		
		materialsTypeMapper.addMaterialsType(type);
	}

	@Override
	public void modMaterialsType(TypeBean type) {
		
		materialsTypeMapper.modMaterialsType(type);
	}

	@Override
	public void deldMaterialsType(TypeBean type) {
		
		materialsTypeMapper.deldMaterialsType(type);
	}

	@Override
	public List<TypeBean> queryAllType() {
		
		return materialsTypeMapper.queryAllType();
	}

	@Override
	public List<GoodsBean> getBorrow(HashMap<String,Object> map) {
		
		return materialsTypeMapper.getBorrow(map);
	}
	
	@Override
	public List<HashMap<String,Object>> fillForm(){
		
		return materialsTypeMapper.fillForm();
	}
	
}
