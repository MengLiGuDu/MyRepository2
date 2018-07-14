package com.kcls.bean;

/*
 * 审批记录表
 */
public class ApproveRecordBean {
	private String approveRecord_id;	//审批记录id
	private String user_id;				//审批人id
	private String approve_id;			//审批单id
	private String approval_content;	//审批内容
	private String approval_date;		//审批时间
	private Integer approval_state;		//审批状态
	public String getApproveRecord_id() {
		return approveRecord_id;
	}
	public void setApproveRecord_id(String approveRecord_id) {
		this.approveRecord_id = approveRecord_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getApprove_id() {
		return approve_id;
	}
	public void setApprove_id(String approve_id) {
		this.approve_id = approve_id;
	}
	public String getApproval_content() {
		return approval_content;
	}
	public void setApproval_content(String approval_content) {
		this.approval_content = approval_content;
	}
	public String getApproval_date() {
		return approval_date;
	}
	public void setApproval_date(String approval_date) {
		this.approval_date = approval_date;
	}
	public Integer getApproval_state() {
		return approval_state;
	}
	public void setApproval_state(Integer approval_state) {
		this.approval_state = approval_state;
	}
}
