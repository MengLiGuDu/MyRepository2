package com.kcls.service.logistice;

import java.util.HashMap;
import java.util.List;


import com.kcls.bean.TypeBean;


public interface ApplyService {

	public void addApply(HashMap<String,Object> map);
	
	public void addBorrow(HashMap<String,Object> map);
	
	public List<TypeBean> typeCheck();
	
	public List<HashMap<String, Object>> queryBorrow(HashMap<String, Object> map);
	
	public List<HashMap<String, Object>> queryBorrowCount(HashMap<String, Object> map);
	
	public List<HashMap<String,Object>> detailBorrow(HashMap<String, Object> map);
	
	
	public void withdrawApply(HashMap<String, Object> map);
	
	public void addDraftApply(HashMap<String,Object> map);
}
