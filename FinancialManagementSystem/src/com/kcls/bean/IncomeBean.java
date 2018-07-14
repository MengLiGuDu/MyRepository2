package com.kcls.bean;

public class IncomeBean {
	private String course_name;				// 科目名
	private String income_id; 				// 收入单ID
	private String income_name;				// 标题
	private String income_projects; 		// 收入项目
	private String course_id; 				// 科目ID
	private String accounting_id; 			// 会计ID
	private String payment_name; 			// 付款人
	private String payment_unit; 			// 付款单位
	private String gathering_name; 			// 收款人
	private String payment_accountNum; 		// 付款账号
	private String gathering_accountNum;	// 收款账号
	private String deal_type; 				// 交易方式
	private Double receipts_money; 			// 应收总金额
	private Double payment_money; 			// 缴纳总金额
	private String expenditure_remark; 		// 备注
	private String Income_evidence; 		// 收入凭证编号
	private String create_date; 			// 创建时间
	private String income_date; 			// 创建时间
	private Integer income_state; 			// 状态
	
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getIncome_id() {
		return income_id;
	}
	public String getIncome_name() {
		return income_name;
	}
	public void setIncome_name(String income_name) {
		this.income_name = income_name;
	}
	public String getIncome_projects() {
		return income_projects;
	}
	public String getCourse_id() {
		return course_id;
	}
	public String getAccounting_id() {
		return accounting_id;
	}
	public String getPayment_name() {
		return payment_name;
	}
	public String getPayment_unit() {
		return payment_unit;
	}
	public String getGathering_name() {
		return gathering_name;
	}
	public String getPayment_accountNum() {
		return payment_accountNum;
	}
	public String getGathering_accountNum() {
		return gathering_accountNum;
	}
	public String getDeal_type() {
		return deal_type;
	}
	public Double getReceipts_money() {
		return receipts_money;
	}
	public Double getPayment_money() {
		return payment_money;
	}
	public String getExpenditure_remark() {
		return expenditure_remark;
	}
	public String getIncome_evidence() {
		return Income_evidence;
	}
	public String getCreate_date() {
		return create_date;
	}
	public String getIncome_date() {
		return income_date;
	}
	public Integer getIncome_state() {
		return income_state;
	}
	public void setIncome_id(String income_id) {
		this.income_id = income_id;
	}
	public void setIncome_projects(String income_projects) {
		this.income_projects = income_projects;
	}
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	public void setAccounting_id(String accounting_id) {
		this.accounting_id = accounting_id;
	}
	public void setPayment_name(String payment_name) {
		this.payment_name = payment_name;
	}
	public void setPayment_unit(String payment_unit) {
		this.payment_unit = payment_unit;
	}
	public void setGathering_name(String gathering_name) {
		this.gathering_name = gathering_name;
	}
	public void setPayment_accountNum(String payment_accountNum) {
		this.payment_accountNum = payment_accountNum;
	}
	public void setGathering_accountNum(String gathering_accountNum) {
		this.gathering_accountNum = gathering_accountNum;
	}
	public void setDeal_type(String deal_type) {
		this.deal_type = deal_type;
	}
	public void setReceipts_money(Double receipts_money) {
		this.receipts_money = receipts_money;
	}
	public void setPayment_money(Double payment_money) {
		this.payment_money = payment_money;
	}
	public void setExpenditure_remark(String expenditure_remark) {
		this.expenditure_remark = expenditure_remark;
	}
	public void setIncome_evidence(String income_evidence) {
		Income_evidence = income_evidence;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public void setIncome_date(String income_date) {
		this.income_date = income_date;
	}
	public void setIncome_state(Integer income_state) {
		this.income_state = income_state;
	}

}
