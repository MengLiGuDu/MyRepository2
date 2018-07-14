package com.kcls.service;

import java.util.HashMap;
import java.util.List;

import com.kcls.bean.GoodsBean;
import com.kcls.bean.TypeBean;

public interface MaterialsTypeService {

	
	public List<HashMap<String,Object>> MaterialsTypeList(HashMap<String,Object> map);
	
	public Integer MaterialsTypeCount(HashMap<String,Object> map);
	
	public void addMaterialsType(TypeBean type);
	
	public void modMaterialsType(TypeBean type);
	
	public void deldMaterialsType(TypeBean type);
	
	public List<TypeBean> queryAllType();
	
	public List<GoodsBean> getBorrow(HashMap<String,Object> map);
	
	public List<HashMap<String,Object>> fillForm();
}
