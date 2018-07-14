package com.kcls.mapper.logistice;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kcls.bean.TypeBean;


public interface ApplyMapper {

	@Insert("insert into sms_2102_apply (apply_id,user_id,apply_time,money_count,submit_state,apply_state,apply_type,apply_explain,goods_id) values (#{apply_id},#{user_id},#{apply_time},#{money_count},1,0,2,#{apply_explain},#{goods_id});")
	public void addApply(HashMap<String,Object> map);
	
	@Insert("insert into sms_2102_apply (apply_id,user_id,apply_time,money_count,submit_state,apply_state,apply_type,apply_explain,goods_id) values (#{apply_id},#{user_id},#{apply_time},#{money_count},0,0,2,#{apply_explain},#{goods_id});")
	public void addDraftApply(HashMap<String,Object> map);
	
	@Insert("insert into sms_2102_borrow (borrow_id,goods_id,borrowpeople_id,borrow_time,operater_id,borrow_count,return_time,borrow_remark,apply_id) values (#{borrow_id},#{goods_id},#{borrowpeople_id},#{borrow_time},#{operater_id},#{borrow_count},#{return_time},#{borrow_remark},#{apply_id});")
	public void addBorrow(HashMap<String,Object> map);
	
	@Select("select * from sms_2102_type where type_id in (select DISTINCT(type_id) from sms_2102_storage)")
	public List<TypeBean> typeCheck();
	
	@Select("select *,(select approval_state from sms_2102_approval where apply_id = a.apply_id) approval_state,(select user_name from sms_2102_user where user_id = a.user_id) user_name from sms_2102_apply a where a.submit_state = 1 and apply_type = 2 and apply_state = #{searchText} and user_id = #{uuid}  limit #{pageNumber},#{pageSize};")
	public List<HashMap<String, Object>> queryBorrow(HashMap<String, Object> map);
	
	@Select("select *,(select approval_state from sms_2102_approval where apply_id = a.apply_id) approval_state,(select user_name from sms_2102_user where user_id = a.user_id) user_name from sms_2102_apply a where a.submit_state = 1 and apply_type = 2 and apply_state = #{searchText} and user_id = #{uuid}  ")
	public List<HashMap<String, Object>> queryBorrowCount(HashMap<String, Object> map);
	
	@Select("select * from sms_2102_apply a ,sms_2102_goods g,sms_2102_type t where a.goods_id = g.goods_id and g.type_id = t.type_id  and a.apply_id = #{apply_id}")
	public List<HashMap<String,Object>> detailBorrow(HashMap<String, Object> map);
	
	@Update("update sms_2102_apply set submit_state = 0 where apply_id = #{apply_id}")
	public void withdrawApply(HashMap<String, Object> map);
}
