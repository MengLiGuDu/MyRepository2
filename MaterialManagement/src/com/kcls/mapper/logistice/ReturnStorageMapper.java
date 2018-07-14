package com.kcls.mapper.logistice;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.kcls.bean.PageBean;
import com.kcls.bean.ReturnBean;
import com.kcls.bean.StorageBean;

public interface ReturnStorageMapper {
	@Select("select * from sms_2102_return")
	public List<ReturnBean> select();
	
	@Select("select count(return_id) from sms_2102_return where goods_id like concat('%',#{searchText},'%')")
	public Integer dimAllMessage(PageBean page);
	
	@Select("select * from sms_2102_return where goods_id like concat('%',#{searchText},'%') limit #{pageNumber},#{pageSize}")
	public List<ReturnBean> dimPageMessage(PageBean page);
}
