package com.kcls.bean;

public class GoodsBean {

	private String goods_id	;
	private String type_id;
	private String goods_name;
	private Double goods_price;
	private String goods_spec;
	private Integer goods_count	;
	private Integer userable_count;
	private Integer repaired_count;
	private Integer scrap_count	;
	private String goods_remark	;
	private Integer goods_state;
	
	public Integer getGoods_state() {
		return goods_state;
	}
	public void setGoods_state(Integer goods_state) {
		this.goods_state = goods_state;
	}
	public String getType_id() {
		return type_id;
	}
	public void setType_id(String type_id) {
		this.type_id = type_id;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public Double getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(Double goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_spec() {
		return goods_spec;
	}
	public void setGoods_spec(String goods_spec) {
		this.goods_spec = goods_spec;
	}
	public Integer getGoods_count() {
		return goods_count;
	}
	public void setGoods_count(Integer goods_count) {
		this.goods_count = goods_count;
	}
	public Integer getUserable_count() {
		return userable_count;
	}
	public void setUserable_count(Integer userable_count) {
		this.userable_count = userable_count;
	}
	public Integer getRepaired_count() {
		return repaired_count;
	}
	public void setRepaired_count(Integer repaired_count) {
		this.repaired_count = repaired_count;
	}
	public Integer getScrap_count() {
		return scrap_count;
	}
	public void setScrap_count(Integer scrap_count) {
		this.scrap_count = scrap_count;
	}
	public String getGoods_remark() {
		return goods_remark;
	}
	public void setGoods_remark(String goods_remark) {
		this.goods_remark = goods_remark;
	}
	
	
}
