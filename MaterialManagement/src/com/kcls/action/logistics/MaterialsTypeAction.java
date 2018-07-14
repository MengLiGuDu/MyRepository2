package com.kcls.action.logistics;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.GoodsBean;
import com.kcls.bean.TypeBean;
import com.kcls.service.MaterialsTypeService;
import com.kcls.util.DateUtil;

@Controller
public class MaterialsTypeAction {

	@Resource
	private MaterialsTypeService materialsTypeService;
	
	@RequestMapping(value="resourceTypeList",method=RequestMethod.POST)
	@ResponseBody
	public Object resourceTypeList(@RequestParam HashMap<String, Object> input){
		
		
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = materialsTypeService.MaterialsTypeList(in);
		int total = materialsTypeService.MaterialsTypeCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
	
	@RequestMapping(value="checkType",method=RequestMethod.POST)
	@ResponseBody
	public Object checkType(TypeBean type){
		
		List<TypeBean> list = materialsTypeService.queryAllType();
		boolean valid = true;
		
		for (int i = 0; i < list.size(); i++) {
			if(type.getType_name().equals(list.get(i).getType_name())){
				valid = true;
			} else {
				valid =  false;
			}
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("valid", valid);
		
		return map;
	}
	
	@RequestMapping(value="typeList",method=RequestMethod.POST)
	@ResponseBody
	public Object typeList(TypeBean type){
		
		 List<HashMap<String, Object>> list = materialsTypeService.fillForm();
		
		return list;
	}
	
	@RequestMapping(value="addMaterialsType",method=RequestMethod.POST)
	@ResponseBody
	public Object addMaterialsType(TypeBean type){
		
		type.setType_id(DateUtil.getUUID());
		materialsTypeService.addMaterialsType(type);
		
		return type;
	}
	
	@RequestMapping(value="modMaterialsType",method=RequestMethod.POST)
	@ResponseBody
	public Object modMaterialsType(TypeBean type){
		
		materialsTypeService.modMaterialsType(type);
		
		return type;
	}
	
	@RequestMapping(value="delMaterialsType",method=RequestMethod.POST)
	@ResponseBody
	public Object delMaterialsType(TypeBean type){
		
		materialsTypeService.deldMaterialsType(type);
		
		return type;
	}
	
	@RequestMapping(value="fillStorage",method=RequestMethod.POST)
	@ResponseBody
	public Object fillStorage(@RequestParam HashMap<String,Object> map){
		
		List<GoodsBean> list = materialsTypeService.getBorrow(map);
		
		return list;
	}
}
