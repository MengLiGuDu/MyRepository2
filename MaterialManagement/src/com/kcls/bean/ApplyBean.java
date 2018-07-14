package com.kcls.bean;

public class ApplyBean {

	private String apply_id	;
	private String user_id;
	private String apply_time;
	private Integer money_count;
	private Integer submit_state;
	private Integer apply_state;
	private Integer apply_type;
	private String apply_explain;
	private String[] array;
	
	public String[] getArray() {
		return array;
	}
	public void setArray(String[] array) {
		this.array = array;
	}
	public String getApply_id() {
		return apply_id;
	}
	public void setApply_id(String apply_id) {
		this.apply_id = apply_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getApply_time() {
		return apply_time;
	}
	public void setApply_time(String apply_time) {
		this.apply_time = apply_time;
	}
	public Integer getMoney_count() {
		return money_count;
	}
	public void setMoney_count(Integer money_count) {
		this.money_count = money_count;
	}
	public Integer getSubmit_state() {
		return submit_state;
	}
	public void setSubmit_state(Integer submit_state) {
		this.submit_state = submit_state;
	}
	public Integer getApply_state() {
		return apply_state;
	}
	public void setApply_state(Integer apply_state) {
		this.apply_state = apply_state;
	}
	public Integer getApply_type() {
		return apply_type;
	}
	public void setApply_type(Integer apply_type) {
		this.apply_type = apply_type;
	}
	public String getApply_explain() {
		return apply_explain;
	}
	public void setApply_explain(String apply_explain) {
		this.apply_explain = apply_explain;
	}
	
}
