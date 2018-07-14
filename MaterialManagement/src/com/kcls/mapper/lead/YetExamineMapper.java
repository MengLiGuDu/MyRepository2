package com.kcls.mapper.lead;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface YetExamineMapper {
	
	
	@Select("select * from sms_2102_apply where apply_type = 0 and apply_state in (1,3)")
	public List<HashMap<String,Object>> selectSubscribe();
	
	@Select("select count(*) from sms_2102_apply ")
	public Integer selectApplyCount(HashMap<String, Object> map);
	
	@Select("select * from sms_2102_receive")
	public List<HashMap<String,Object>> selectReceive();
	
	@Select("select * from sms_2102_apply where apply_type = 2 and apply_state in (1,2)")
	public List<HashMap<String,Object>> selectBorrow();
	
	@Select("select * from sms_2102_apply where apply_type = 3 and apply_state in (1,2)")
	public List<HashMap<String,Object>> selectCheck();
	
}
