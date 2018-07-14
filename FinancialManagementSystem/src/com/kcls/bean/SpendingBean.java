package com.kcls.bean;

public class SpendingBean {
	private String spending_id;			//支出id
	private String operation_id;		//会计id
	private String course_id;			//科目id
	private String apply_id;			//申请单id
	private String spending_name;		//支出名称
	private String spending_remark;		//备注
	private double spending_money;		//金额
	private String payment_name;		//付款人
	private String gathering_name;		//收款人
	private String payment_accountNum;	//付款账号
	private String gathering_number;	//收款账号
	private String deal_type;			//结算方式
	private String create_date;			//创建时间
	private String payment_date;		//付款时间
	private Integer spending_state;		//状态
	public String getSpending_id() {
		return spending_id;
	}
	public void setSpending_id(String spending_id) {
		this.spending_id = spending_id;
	}
	public String getOperation_id() {
		return operation_id;
	}
	public void setOperation_id(String operation_id) {
		this.operation_id = operation_id;
	}
	public String getCourse_id() {
		return course_id;
	}
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	public String getApply_id() {
		return apply_id;
	}
	public void setApply_id(String apply_id) {
		this.apply_id = apply_id;
	}
	public String getSpending_name() {
		return spending_name;
	}
	public void setSpending_name(String spending_name) {
		this.spending_name = spending_name;
	}
	public String getSpending_remark() {
		return spending_remark;
	}
	public void setSpending_remark(String spending_remark) {
		this.spending_remark = spending_remark;
	}
	public double getSpending_money() {
		return spending_money;
	}
	public void setSpending_money(double spending_money) {
		this.spending_money = spending_money;
	}
	public String getPayment_name() {
		return payment_name;
	}
	public void setPayment_name(String payment_name) {
		this.payment_name = payment_name;
	}
	public String getGathering_name() {
		return gathering_name;
	}
	public void setGathering_name(String gathering_name) {
		this.gathering_name = gathering_name;
	}
	public String getPayment_accountNum() {
		return payment_accountNum;
	}
	public void setPayment_accountNum(String payment_accountNum) {
		this.payment_accountNum = payment_accountNum;
	}
	public String getGathering_number() {
		return gathering_number;
	}
	public void setGathering_number(String gathering_number) {
		this.gathering_number = gathering_number;
	}
	public String getDeal_type() {
		return deal_type;
	}
	public void setDeal_type(String deal_type) {
		this.deal_type = deal_type;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public Integer getSpending_state() {
		return spending_state;
	}
	public void setSpending_state(Integer spending_state) {
		this.spending_state = spending_state;
	}
}
