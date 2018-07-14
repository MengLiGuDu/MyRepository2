package com.kcls.mapper.logistice;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.kcls.bean.PageBean;
import com.kcls.bean.StorageBean;

public interface StorageMapper {
	@Select("select * from sms_2102_storage")
	public List<StorageBean> select();
	
	@Select("select count(storage_id) from sms_2102_storage where operate_id like concat('%',#{searchText},'%')")
	public Integer dimAllMessage(PageBean page);
	
	@Select("select * from sms_2102_storage where operate_id like concat('%',#{searchText},'%') limit #{pageNumber},#{pageSize}")
	public List<StorageBean> dimPageMessage(PageBean page);
}
