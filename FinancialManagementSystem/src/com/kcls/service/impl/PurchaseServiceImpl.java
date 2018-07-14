package com.kcls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.bean.NodeBean;
import com.kcls.bean.Page;
import com.kcls.bean.PaySubjectBean;
import com.kcls.bean.ReimburseBean;
import com.kcls.bean.SubScribeBean;
import com.kcls.bean.TreeBean;
import com.kcls.mapper.PurchaseMapper;
import com.kcls.service.PurchaseService;

@Service("purchaseService")
public class PurchaseServiceImpl implements PurchaseService{

	@Resource(name="purchaseMapper")
	private PurchaseMapper purchaseMapper;

	@Override
	public List<NodeBean> getNodesTree() {
		
		return purchaseMapper.getNodesTree();
	}
	
	/*
	 *申购转报销的分页
	 */
	@Override
	public List<SubScribeBean> selectCountPurchase(Page page) {
		
		return purchaseMapper.selectCountPurchase(page);
	}

	@Override
	public List<SubScribeBean> selectPurchase(Page page) {
		
		return purchaseMapper.selectPurchase(page);
	}


}
