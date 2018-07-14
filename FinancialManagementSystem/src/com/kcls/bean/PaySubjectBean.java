package com.kcls.bean;

/*
 * 支出科目表
 */
public class PaySubjectBean {
	private String course_id;			//科目id
	private String fatherCourse_id;		//父科目id
	private String fatherCourse_name;	//父科目名称
	private String course_name;			//科目名称
	private String course_remark;		//科目描述
	private String create_name;			//创建人
	private String create_date;			//创建时间
	public String getCourse_id() {
		return course_id;
	}
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	public String getFatherCourse_id() {
		return fatherCourse_id;
	}
	public void setFatherCourse_id(String fatherCourse_id) {
		this.fatherCourse_id = fatherCourse_id;
	}
	public String getFatherCourse_name() {
		return fatherCourse_name;
	}
	public void setFatherCourse_name(String fatherCourse_name) {
		this.fatherCourse_name = fatherCourse_name;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getCourse_remark() {
		return course_remark;
	}
	public void setCourse_remark(String course_remark) {
		this.course_remark = course_remark;
	}
	public String getCreate_name() {
		return create_name;
	}
	public void setCreate_name(String create_name) {
		this.create_name = create_name;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
}
