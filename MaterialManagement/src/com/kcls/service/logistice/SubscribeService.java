package com.kcls.service.logistice;

import java.util.HashMap;
import java.util.List;


public interface SubscribeService {
	public List<HashMap<String,Object>> selectExamine();
	
	public Integer selectApplyCount(HashMap<String, Object> map);
	
	public List<HashMap<String,Object>> selectNotAlready();
	
	public List<HashMap<String,Object>> selectUntreated();
	
	public List<HashMap<String,Object>> selectAlready();
	
	
	public List<HashMap<String,Object>> selectDraft();
}
