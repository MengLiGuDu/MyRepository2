package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.Page;
import com.kcls.bean.YearBean;
import com.kcls.mapper.YearMapper;
import com.kcls.service.YearService;

@Service("yearService")
public class YearServiceImpl implements YearService{

	@Resource(name="yearMapper")
	private YearMapper yearMapper;

	@Override
	public List<YearBean> selectCount(Page page) {
		return yearMapper.selectCount(page);
	}

	@Override
	public List<YearBean> selectYear(Page page) {
		return yearMapper.selectYear(page);
	}

	@Override
	public void deleteYear(YearBean year) {
		yearMapper.deleteYear(year);
	}

	@Override
	public void insertYear(YearBean year) {
		yearMapper.insertYear(year);
	}

	@Override
	public void updateYear(YearBean year) {
		yearMapper.updateYear(year);
	}

	@Override
	public List<YearBean> selectJudgeYear(YearBean year) {
		return yearMapper.selectJudgeYear(year);
	}
	


	
}
