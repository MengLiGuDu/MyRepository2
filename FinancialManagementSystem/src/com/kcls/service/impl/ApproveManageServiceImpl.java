package com.kcls.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.mapper.ApproveManageMapper;
import com.kcls.service.ApproveManageService;

/*
 * …Û≈˙π‹¿Ì
 */
@Service(value="approveManageService")
public class ApproveManageServiceImpl implements ApproveManageService {

	@Resource(name="approveManageMapper")
	private ApproveManageMapper approveManageMapper;
	
}
