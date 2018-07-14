package com.kcls.mapper.logistice;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;


public interface SubscribeMapper {
	
	@Select("select * from sms_2102_apply where apply_type = 0 and apply_state = 4 and submit_state = 1")
	public List<HashMap<String,Object>> selectExamine();
	
	@Select("select count(*) from sms_2102_apply ")
	public Integer selectApplyCount(HashMap<String, Object> map);
	
	@Select("select * from sms_2102_apply where apply_type = 0 and apply_state = 2 and submit_state = 1")
	public List<HashMap<String,Object>> selectNotAlready();
	
	@Select("select * from sms_2102_apply where apply_type = 0 and apply_state = 0 and submit_state = 1")
	public List<HashMap<String,Object>> selectUntreated();
	
	@Select("select * from sms_2102_apply where apply_type = 0 and apply_state = 1 and submit_state = 1")
	public List<HashMap<String,Object>> selectAlready();
	
	@Select("select * from sms_2102_apply where apply_type = 0 and submit_state = 0")
	public List<HashMap<String,Object>> selectDraft();
}
	