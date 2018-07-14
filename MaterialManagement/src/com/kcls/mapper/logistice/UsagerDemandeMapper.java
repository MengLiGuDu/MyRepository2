package com.kcls.mapper.logistice;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface UsagerDemandeMapper {
	@Select("select * from sms_2102_approval limit #{pageNumber},#{pageSize};")
	public List<HashMap<String,Object>> MaterialsTypeList(HashMap<String,Object> map);
	

	@Select("select count(*) from sms_2102_approval limit #{pageNumber},#{pageSize};")
	public Integer MaterialsTypeCount(HashMap<String,Object> map);
}
