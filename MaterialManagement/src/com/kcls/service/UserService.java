package com.kcls.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface UserService {

	public List<Map<String,Object>> checkUserNam();
	
	public void addUser(HashMap<String,Object> map);
	
	public List<Map<String,Object>> loginUser(HashMap<String,Object> map);
	
	public void addApply(HashMap<String,Object> map);
	
	public void addReceive(HashMap<String,Object> map);
	
	public List<HashMap<String, Object>> queryReceive(HashMap<String, Object> map);
	
	public List<HashMap<String, Object>> queryReceiveCount(HashMap<String, Object> map);
	
	public List<HashMap<String,Object>> detailReceive(HashMap<String, Object> map);
	
	public List<HashMap<String, Object>> detailReceive1(HashMap<String, Object> map);
	
	public void addDraftApply(HashMap<String,Object> map);
	
	public List<HashMap<String, Object>> queryReceive1(HashMap<String, Object> map);
	
	public List<HashMap<String, Object>> queryReceiveCount1(HashMap<String, Object> map);
	
	public void delDraft(HashMap<String, Object> map);
	
	public Integer checkApplyType(HashMap<String, Object> map);
	
	public void modApply(HashMap<String, Object> map);
	
	public void modApply1(HashMap<String, Object> map);
	
	public  List<HashMap<String, Object>> borrowRecordList(HashMap<String, Object> map);
	
	public Integer borrowRecordListCount(HashMap<String, Object> map);
	
	public  List<HashMap<String, Object>> receive1RecordList(HashMap<String, Object> map);
	
	public Integer receive1RecordListCount(HashMap<String, Object> map);
	
}
