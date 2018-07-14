package com.kcls.bean;

import java.util.ArrayList;
import java.util.List;


public class TreeBean {
	private String node_id;
	private String text;
	private List<NodeBean> nodes;
	public TreeBean(String node_id,String text){
		this.node_id = node_id;
		this.text = text;
		this.nodes = new ArrayList<NodeBean>();
	}
	public String getNode_id() {
		return node_id;
	}
	public void setNode_id(String node_id) {
		this.node_id = node_id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<NodeBean> getNodes() {
		return nodes;
	}
	public void setNodes(List<NodeBean> nodes) {
		this.nodes = nodes;
	}
}
