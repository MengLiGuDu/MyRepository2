package com.kcls.service.lead;

import java.util.HashMap;
import java.util.List;

public interface YetExamineService {
	
public List<HashMap<String,Object>> selectSubscribe();

	public Integer selectApplyCount(HashMap<String, Object> map);
	
	public List<HashMap<String,Object>> selectReceive();
	
	public List<HashMap<String,Object>> selectBorrow();
	
	public List<HashMap<String,Object>> selectCheck();
}
