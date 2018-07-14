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
import com.kcls.service.logistice.MaterialsService;
import com.kcls.util.DateUtil;


/*
 * 
 * 物资管理
 */

@Controller
public class MaterialsAction {
	
	

	@Resource
	private MaterialsService materialsService;
	
	/*
	 * 物资分页
	 */
	@RequestMapping(value="materialsList",method=RequestMethod.POST)
	@ResponseBody
	public Object materialsList(@RequestParam HashMap<String, Object> input){
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = materialsService.MaterialsList(in);
		int total = materialsService.MaterialsCount(in);
		magMap.put("total", total);
		magMap.put("rows", list);
		return magMap;
	}
	@RequestMapping(value="materialsAdd",method=RequestMethod.POST)
	@ResponseBody
	public Object materialsAdd(GoodsBean goodsBean){
		goodsBean.setGoods_id(DateUtil.getUUID());
		goodsBean.setUserable_count(0);
		goodsBean.setRepaired_count(0);
		goodsBean.setScrap_count(0);
		materialsService.MaterialsAdd(goodsBean);
		return null;
	}
	
	@RequestMapping(value="materialsTypeSelect",method=RequestMethod.POST)
	@ResponseBody
	public Object materialsTypeSelect(){
		List<HashMap<String,Object>> input = materialsService.materialsTypeSelect();
		return input;
	}
	
	
}
