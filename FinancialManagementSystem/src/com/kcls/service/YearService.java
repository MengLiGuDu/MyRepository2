package com.kcls.service;

import java.util.List;

import com.kcls.bean.Page;
import com.kcls.bean.YearBean;



public interface YearService {

	List<YearBean> selectCount(Page page);
	
	List<YearBean> selectYear(Page page);
	
	void deleteYear(YearBean year);
	
	void insertYear(YearBean year);
	
	void updateYear(YearBean year);
	
	List<YearBean> selectJudgeYear(YearBean year);
}
