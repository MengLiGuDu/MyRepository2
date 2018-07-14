package com.kcls.mapper.logistice;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.kcls.bean.GoodsBean;

public interface MaterialsMapper {
	
	List<HashMap<String,Object>> MaterialsList(HashMap<String,Object> input);
	
	Integer MaterialsCount(HashMap<String,Object> input);
	
	@Insert("insert into sms_2102_goods (goods_id,type_id,goods_name,goods_price,goods_spec,goods_count,userable_count,repaired_count,scrap_count,goods_remark,goods_state) values(#{goods_id},#{type_id},#{goods_name},#{goods_price},#{goods_spec},#{goods_count},#{userable_count},#{repaired_count},#{scrap_count},#{goods_remark},#{goods_state});")
	void MaterialsAdd(GoodsBean goodsBean);
	
	@Select("select * from sms_2102_type")
	List<HashMap<String,Object>> materialsTypeSelect();
	
	
	
}
