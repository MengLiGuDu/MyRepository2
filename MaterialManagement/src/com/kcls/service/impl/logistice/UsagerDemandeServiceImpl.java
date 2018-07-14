package com.kcls.service.impl.logistice;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.mapper.logistice.UsagerDemandeMapper;
import com.kcls.service.logistice.UsagerDemandeService;
@Service
public class UsagerDemandeServiceImpl implements UsagerDemandeService {
	@Resource
	private UsagerDemandeMapper usagerDemandeMapper;
	@Override
	public List<HashMap<String, Object>> UsagerDemandeList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usagerDemandeMapper.MaterialsTypeList(map);
	}

	@Override
	public Integer UsagerDemandeCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usagerDemandeMapper.MaterialsTypeCount(map);
	}

}
