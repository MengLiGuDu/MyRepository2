package com.kcls.bean;

/*
 * �깺��
 */
public class SubScribeBean {
	private String purchase_id;			//�깺��id�������깺��ϸ��
	private String user_id;				//�û�id	�������û���
	private String user_name;			//�û��� 	
	private String purchase_title;		//�깺����
	private String course_id;			//֧����Ŀ
	private String course_name;			//֧����Ŀ��
	private double purchase_money;		//�깺���
	private String collection_account; 	//�տ��˺�
	private String purchase_date;		//ʱ��
	private String purchase_matter;		//�깺����
	private String deal_type;			//���㷽ʽ
	private Integer cashier_state;		//�깺״̬��0���ݸ�   1��ͨ����δ����   2��������    3��ͨ�����Ѹ��
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getPurchase_id() {
		return purchase_id;
	}
	public void setPurchase_id(String purchase_id) {
		this.purchase_id = purchase_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPurchase_title() {
		return purchase_title;
	}
	public void setPurchase_title(String purchase_title) {
		this.purchase_title = purchase_title;
	}
	public String getCourse_id() {
		return course_id;
	}
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	public double getPurchase_money() {
		return purchase_money;
	}
	public void setPurchase_money(double purchase_money) {
		this.purchase_money = purchase_money;
	}
	public String getCollection_account() {
		return collection_account;
	}
	public void setCollection_account(String collection_account) {
		this.collection_account = collection_account;
	}
	public String getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(String purchase_date) {
		this.purchase_date = purchase_date;
	}
	public String getPurchase_matter() {
		return purchase_matter;
	}
	public void setPurchase_matter(String purchase_matter) {
		this.purchase_matter = purchase_matter;
	}
	public String getDeal_type() {
		return deal_type;
	}
	public void setDeal_type(String deal_type) {
		this.deal_type = deal_type;
	}
	public Integer getCashier_state() {
		return cashier_state;
	}
	public void setCashier_state(Integer cashier_state) {
		this.cashier_state = cashier_state;
	}
}
