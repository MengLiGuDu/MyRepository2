package com.kcls.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kcls.bean.ApprovallimBean;

public interface ApprovallimMapper {

	@Insert("insert into sms_2102_approvallim (lead_id,approval_type) values (#{lead_id},#{approval_type})")
	public void addApprovallim(ApprovallimBean approvallim);
	
	@Select("select * from sms_2102_approvallim limit #{pageNumber},#{pageSize};")
	public List<HashMap<String, Object>> queryApprovallim(HashMap<String, Object> map);
	
	@Select("select count(*) from sms_2102_approvallim ")
	public Integer queryApprovallimCount(HashMap<String, Object> map);
	
	/*@Select("select * from sms_2102_approvallim where lead_id = #{lead_id}")*/
	public List<ApprovallimBean> fillModApprovallim(ApprovallimBean approvallim);
	
	@Update("update sms_2102_approvallim set approval_type = #{approval_type} where lead_id = #{lead_id}")
	public void modApprovallim(ApprovallimBean approvallim);
	
	@Delete("delete from sms_2102_approvallim where lead_id = #{lead_id}")
	public void delApprovallim(ApprovallimBean approvallim);
}
