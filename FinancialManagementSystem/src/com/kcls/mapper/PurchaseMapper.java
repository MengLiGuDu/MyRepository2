package com.kcls.mapper;

import java.util.List;
import com.kcls.bean.NodeBean;
import com.kcls.bean.Page;
import com.kcls.bean.SubScribeBean;

public interface PurchaseMapper {

	public List<NodeBean> getNodesTree();
	
	public List<SubScribeBean> selectCountPurchase(Page page);

	public List<SubScribeBean> selectPurchase(Page page);

}
