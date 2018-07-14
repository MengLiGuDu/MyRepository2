package com.kcls.service.logistice;

import java.util.HashMap;
import java.util.List;

public interface UsagerDemandeService {
	
	public List<HashMap<String,Object>> UsagerDemandeList(HashMap<String,Object> map);
	
	public Integer UsagerDemandeCount(HashMap<String,Object> map);
}
