package com.kcls.bean;

public class ApprovalBean {

	private String lead_id;
	private String apply_id	;
	private Integer approval_state;
	private String approval_time;
	private String approval_remark;
	public String getLead_id() {
		return lead_id;
	}
	public void setLead_id(String lead_id) {
		this.lead_id = lead_id;
	}
	public String getApply_id() {
		return apply_id;
	}
	public void setApply_id(String apply_id) {
		this.apply_id = apply_id;
	}
	public Integer getApproval_state() {
		return approval_state;
	}
	public void setApproval_state(Integer approval_state) {
		this.approval_state = approval_state;
	}
	public String getApproval_time() {
		return approval_time;
	}
	public void setApproval_time(String approval_time) {
		this.approval_time = approval_time;
	}
	public String getApproval_remark() {
		return approval_remark;
	}
	public void setApproval_remark(String approval_remark) {
		this.approval_remark = approval_remark;
	}
	
}
