package com.kcls.bean;

public class AccountBean {
	
	private String account_id;
	private String account_name;
	private String account;
	private String banks_type;
	private Double account_oldMoney;
	private Double account_newMoney;
	private String create_name;
	private String create_date;
	public String getAccount_id() {
		return account_id;
	}
	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}
	public String getAccount_name() {
		return account_name;
	}
	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getBanks_type() {
		return banks_type;
	}
	public void setBanks_type(String banks_type) {
		this.banks_type = banks_type;
	}
	public Double getAccount_oldMoney() {
		return account_oldMoney;
	}
	public void setAccount_oldMoney(Double account_oldMoney) {
		this.account_oldMoney = account_oldMoney;
	}
	public Double getAccount_newMoney() {
		return account_newMoney;
	}
	public void setAccount_newMoney(Double account_newMoney) {
		this.account_newMoney = account_newMoney;
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
	@Override
	public String toString() {
		return "AccountBean [account_id=" + account_id + ", account_name="
				+ account_name + ", account=" + account + ", banks_type="
				+ banks_type + ", account_oldMoney=" + account_oldMoney
				+ ", account_newMoney=" + account_newMoney + ", create_name="
				+ create_name + ", create_date=" + create_date + "]";
	}
	
}
