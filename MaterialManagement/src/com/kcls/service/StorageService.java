package com.kcls.service;

import java.util.HashMap;
import java.util.Map;

public interface StorageService {
	
    public void addStorageMapper(HashMap<String,Object> map);
    public Map<String,Object> stdmode();
}
