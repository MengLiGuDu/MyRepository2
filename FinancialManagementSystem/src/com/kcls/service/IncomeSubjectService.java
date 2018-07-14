package com.kcls.service;

import java.util.List;

import com.kcls.bean.IncomeSubjectBean;
import com.kcls.bean.NodeBean;
import com.kcls.bean.Page;

public interface IncomeSubjectService {
	
	int  selectCount(Page page);
	
	List<IncomeSubjectBean> select(Page page);
	
	int   insert(IncomeSubjectBean  bean);  
	
	int   delete_one(IncomeSubjectBean  bean);
	
	List<IncomeSubjectBean> select_parent_income_subject();
	
	List<IncomeSubjectBean> select_one(IncomeSubjectBean  bean);
	
	int  update(IncomeSubjectBean  bean);
	
	List<NodeBean> selectTree();
	
}
