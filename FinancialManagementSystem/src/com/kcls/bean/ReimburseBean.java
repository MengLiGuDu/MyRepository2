package com.kcls.bean;

import java.util.Date;

/*±¨Ïú*/
public class ReimburseBean {
	private String   budget_id	; 
	private String   budgetName_id  ;
	private Double   reimburse_money ;
	private String   course_id ;
	private String   reimburse_title ;
	private String   collection_account	;
	private Date     reimburse_date	;
	private String   reimburse_matter	;
	private String   deal_type	;
	private Integer      cashier_type ;
	
	private String user_name;
	
	
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	private String   course_name;
	
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	
	public String getBudget_id() {
		return budget_id;
	}
	public void setBudget_id(String budget_id) {
		this.budget_id = budget_id;
	}
	public String getBudgetName_id() {
		return budgetName_id;
	}
	public void setBudgetName_id(String budgetName_id) {
		this.budgetName_id = budgetName_id;
	}
	public double getReimburse_money() {
		return reimburse_money;
	}
	public void setReimburse_money(double reimburse_money) {
		this.reimburse_money = reimburse_money;
	}
	public String getCourse_id() {
		return course_id;
	}
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	public String getReimburse_title() {
		return reimburse_title;
	}
	public void setReimburse_title(String reimburse_title) {
		this.reimburse_title = reimburse_title;
	}
	public String getCollection_account() {
		return collection_account;
	}
	public void setCollection_account(String collection_account) {
		this.collection_account = collection_account;
	}
	public Date getReimburse_date() {
		return reimburse_date;
	}
	public void setReimburse_date(Date reimburse_date) {
		this.reimburse_date = reimburse_date;
	}
	public String getReimburse_matter() {
		return reimburse_matter;
	}
	public void setReimburse_matter(String reimburse_matter) {
		this.reimburse_matter = reimburse_matter;
	}
	public String getDeal_type() {
		return deal_type;
	}
	public void setDeal_type(String deal_type) {
		this.deal_type = deal_type;
	}
	public int getCashier_type() {
		return cashier_type;
	}
	public void setCashier_type(int cashier_type) {
		this.cashier_type = cashier_type;
	}
	
	
}
