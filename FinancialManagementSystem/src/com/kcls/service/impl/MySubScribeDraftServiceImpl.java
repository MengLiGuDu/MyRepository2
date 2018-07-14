package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.NodeBean;
import com.kcls.bean.Page;
import com.kcls.bean.SubScribeBean;
import com.kcls.mapper.MySubScribeDraftMapper;
import com.kcls.service.MySubScribeDraftService;

/*
 * Œ“µƒ…Íπ∫≤›∏Â
 */
@Service(value="mySubScribeDraftService")
public class MySubScribeDraftServiceImpl implements MySubScribeDraftService {
	
	@Resource(name="mySubScribeDraftMapper")
	private MySubScribeDraftMapper mySubScribeDraftMapper;

	@Override
	public List<NodeBean> paySubjectTree() {
		return mySubScribeDraftMapper.paySubjectTree();
	}

	@Override
	public void insertSubScribeDraft(SubScribeBean bean) {
		mySubScribeDraftMapper.insertSubScribeDraft(bean);
	}

	@Override
	public List<SubScribeBean> selectCount(Page page) {
		return mySubScribeDraftMapper.selectCount(page);
	}

	@Override
	public List<SubScribeBean> selectSubscribeDraft(Page page) {
		return mySubScribeDraftMapper.selectSubscribeDraft(page);
	}

	@Override
	public void deleteSubscribeDraft(SubScribeBean bean) {
		mySubScribeDraftMapper.deleteSubscribeDraft(bean);
	}

	@Override
	public void submitSubscribeDraft(SubScribeBean bean) {
		mySubScribeDraftMapper.submitSubscribeDraft(bean);
	}

	@Override
	public void updateSubscribeDraft(SubScribeBean bean) {
		mySubScribeDraftMapper.updateSubscribeDraft(bean);
	}

	@Override
	public SubScribeBean MySubscribeDraft_Detail(SubScribeBean bean) {
		return mySubScribeDraftMapper.MySubscribeDraft_Detail(bean);
	}
	
}
