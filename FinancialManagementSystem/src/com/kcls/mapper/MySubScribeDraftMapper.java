package com.kcls.mapper;

import java.util.List;

import com.kcls.bean.NodeBean;
import com.kcls.bean.Page;
import com.kcls.bean.SubScribeBean;

/*
 * Œ“µƒ…Íπ∫≤›∏Â
 */
public interface MySubScribeDraftMapper {
	
	public List<NodeBean> paySubjectTree();
	
	public void insertSubScribeDraft(SubScribeBean bean);
	
	public List<SubScribeBean> selectCount(Page page);
	
	public List<SubScribeBean> selectSubscribeDraft(Page page);
	
	public void deleteSubscribeDraft(SubScribeBean bean);
	
	public void submitSubscribeDraft(SubScribeBean bean);
	
	public void updateSubscribeDraft(SubScribeBean bean);
	
	public SubScribeBean MySubscribeDraft_Detail(SubScribeBean bean);
}
