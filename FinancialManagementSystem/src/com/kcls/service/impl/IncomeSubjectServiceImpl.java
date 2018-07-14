package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.IncomeSubjectBean;
import com.kcls.bean.NodeBean;
import com.kcls.bean.Page;
import com.kcls.mapper.IncomeSubjectMapper;
import com.kcls.service.IncomeSubjectService;


@Service("IncomeSubjectService")
public class IncomeSubjectServiceImpl  implements  IncomeSubjectService {
	
	
	@Resource(name="IncomeSubjectMapper")
	private IncomeSubjectMapper  mapper;
	
	@Override
	public int   selectCount(Page page) {
		 
		return mapper.selectCount(page);
	}

	@Override
	public List<IncomeSubjectBean>  select(Page page) {
	 
		return mapper.select(page);
	}

	@Override
	public int insert(IncomeSubjectBean bean) {
		 
		return mapper.insert(bean);
	}

	@Override
	public int delete_one(IncomeSubjectBean bean) {
		 
		return mapper.delete_one(bean);
	}

	@Override
	public List<IncomeSubjectBean> select_parent_income_subject() {
	 
		return mapper.select_parent_income_subject();
	}

	@Override
	public List<IncomeSubjectBean> select_one(IncomeSubjectBean bean) {
		 
		return mapper.select_one(bean);
	}

	@Override
	public int update(IncomeSubjectBean bean) {
		 
		return mapper.update(bean);
	}

	@Override
	public List<NodeBean> selectTree() {
		return mapper.selectTree();
	}
	
	
}
