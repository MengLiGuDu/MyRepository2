package com.kcls.bean;

/*
 * ������¼��
 */
public class ApproveRecordBean {
	private String approveRecord_id;	//������¼id
	private String user_id;				//������id
	private String approve_id;			//������id
	private String approval_content;	//��������
	private String approval_date;		//����ʱ��
	private Integer approval_state;		//����״̬
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
