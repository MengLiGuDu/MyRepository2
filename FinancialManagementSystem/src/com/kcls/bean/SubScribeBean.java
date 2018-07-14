package com.kcls.bean;

/*
 * 申购表
 */
public class SubScribeBean {
	private String purchase_id;			//申购单id（关联申购明细表）
	private String user_id;				//用户id	（关联用户表）
	private String user_name;			//用户名 	
	private String purchase_title;		//申购主题
	private String course_id;			//支出科目
	private String course_name;			//支出科目名
	private double purchase_money;		//申购金额
	private String collection_account; 	//收款账号
	private String purchase_date;		//时间
	private String purchase_matter;		//申购事由
	private String deal_type;			//结算方式
	private Integer cashier_state;		//申购状态（0：草稿   1：通过，未付款   2：待审批    3：通过，已付款）
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
