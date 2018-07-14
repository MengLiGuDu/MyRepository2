package com.kcls.mapper.lead;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface NotExamineMapper {
	
	
	@Select("select * from sms_2102_apply where apply_type = 0 and apply_state = 0")
	public List<HashMap<String,Object>> selectSubscribe();
	
	@Select("select count(*) from sms_2102_apply ")
	public Integer selectApplyCount(HashMap<String, Object> map);
	
	@Select("select * from sms_2102_apply where apply_type = 1 and apply_state = 0")
	public List<HashMap<String,Object>> selectReceive();
	
	@Select("select * from sms_2102_apply where apply_type = 2 and apply_state = 0")
	public List<HashMap<String,Object>> selectBorrow();
	
	@Select("select * from sms_2102_apply where apply_type = 3 and apply_state = 0")
	public List<HashMap<String,Object>> selectCheck();
	
}
