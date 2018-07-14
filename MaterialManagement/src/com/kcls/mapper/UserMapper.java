package com.kcls.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserMapper {

	@Select("select user_name from sms_2102_user")
	public List<Map<String,Object>> checkUserNam();
	
	@Insert("insert into sms_2102_user (user_id,user_name,password,money,user_state,user_level) values (#{user_id},#{user_name},#{password},#{money},0,2);")
	public void addUser(HashMap<String,Object> map);
	
	@Select("select * from sms_2102_user where user_name = #{user_name} and password = #{password}")
	public List<Map<String,Object>> loginUser(HashMap<String,Object> map);
	
	@Insert("insert into sms_2102_apply (apply_id,user_id,apply_time,money_count,submit_state,apply_state,apply_type,apply_explain,goods_id) values (#{apply_id},#{user_id},#{apply_time},#{money_count},1,0,1,#{apply_explain},#{goods_id});")
	public void addApply(HashMap<String,Object> map);
	
	@Insert("insert into sms_2102_apply (apply_id,user_id,apply_time,money_count,submit_state,apply_state,apply_type,apply_explain,goods_id) values (#{apply_id},#{user_id},#{apply_time},#{money_count},0,0,1,#{apply_explain},#{goods_id});")
	public void addDraftApply(HashMap<String,Object> map);
	
	@Insert("insert into sms_2102_receive (receive_id,goods_id,operater,user_id,receive_time,goods_count,receive_remark,apply_id) values (#{receive_id},#{goods_id},#{operater},#{user_id},#{receive_time},#{goods_count},#{receive_remark},#{apply_id});")
	public void addReceive(HashMap<String,Object> map);
	
	@Select("select *,(select approval_state from sms_2102_approval where apply_id = a.apply_id) approval_state,(select user_name from sms_2102_user where user_id = a.user_id) user_name from sms_2102_apply a where a.submit_state = 1 and apply_type = 1 and apply_state = #{searchText} and user_id = #{uuid} limit #{pageNumber},#{pageSize};")
	public List<HashMap<String, Object>> queryReceive(HashMap<String, Object> map);
	
	@Select("select *,(select approval_state from sms_2102_approval where apply_id = a.apply_id) approval_state,(select user_name from sms_2102_user where user_id = a.user_id) user_name from sms_2102_apply a where a.submit_state = 1 and apply_type = 1 and apply_state = #{searchText} and user_id = #{uuid} ")
	public List<HashMap<String, Object>> queryReceiveCount(HashMap<String, Object> map);
	
	@Select("select * from sms_2102_receive r,sms_2102_goods g,sms_2102_apply a,sms_2102_type t where r.apply_id = a.apply_id and g.goods_id = a.goods_id and t.type_id = g.type_id and receive_id = #{receive_id}")
	public List<HashMap<String,Object>> detailReceive(HashMap<String, Object> map);
	
	@Select("select *,(select approval_state from sms_2102_approval where apply_id = a.apply_id) approval_state,(select user_name from sms_2102_user where user_id = a.user_id) user_name from sms_2102_apply a where a.submit_state = 0 and apply_type in (1,2) and user_id = #{uuid} limit #{pageNumber},#{pageSize};")
	public List<HashMap<String, Object>> queryReceive1(HashMap<String, Object> map);
	
	@Select("select *,(select approval_state from sms_2102_approval where apply_id = a.apply_id) approval_state,(select user_name from sms_2102_user where user_id = a.user_id) user_name from sms_2102_apply a where a.submit_state = 0 and apply_type in (1,2) and user_id = #{uuid}")
	public List<HashMap<String, Object>> queryReceiveCount1(HashMap<String, Object> map);
	
	@Delete("delete from sms_2102_apply where apply_id = #{apply_id}")
	public void delDraft(HashMap<String, Object> map);
	
	@Select("select apply_type from sms_2102_apply where apply_id = #{idd}")
	public Integer checkApplyType(HashMap<String, Object> map);
	
	@Select("select * from sms_2102_goods g,sms_2102_apply a,sms_2102_type t where a.goods_id = g.goods_id and  t.type_id = g.type_id and  apply_id = #{apply_id};")
	public List<HashMap<String, Object>> detailReceive1(HashMap<String, Object> map);
	
	@Update("update sms_2102_apply set goods_id = #{goods_id},apply_time = #{apply_time},money_count = #{money_count},submit_state = 0,apply_explain=#{apply_explain} where apply_id = #{apply_id}")
	public void modApply(HashMap<String, Object> map);
	
	@Update("update sms_2102_apply set goods_id = #{goods_id},apply_time = #{apply_time},money_count = #{money_count},submit_state = 1,apply_explain=#{apply_explain} where apply_id = #{apply_id}")
	public void modApply1(HashMap<String, Object> map);
	
	@Select("select *,(select user_name from sms_2102_user where user_id = a.user_id) user_name from sms_2102_apply a where submit_state = 1 and apply_type = 2 and user_id = #{uuid} limit #{pageNumber},#{pageSize};")
	public  List<HashMap<String, Object>> borrowRecordList(HashMap<String, Object> map);
	
	@Select("select count(*) from sms_2102_apply a where submit_state = 1 and apply_type = 2 and user_id = #{uuid}")
	public Integer borrowRecordListCount(HashMap<String, Object> map);
	
	
	@Select("select *,(select user_name from sms_2102_user where user_id = a.user_id) user_name from sms_2102_apply a where submit_state = 1 and apply_type = 1 and user_id = #{uuid} limit #{pageNumber},#{pageSize};")
	public  List<HashMap<String, Object>> receive1RecordList(HashMap<String, Object> map);
	
	@Select("select count(*) from sms_2102_apply a where submit_state = 1 and apply_type = 1 and user_id = #{uuid}")
	public Integer receive1RecordListCount(HashMap<String, Object> map);
	
	
}
