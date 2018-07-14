package com.kcls.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kcls.bean.GoodsBean;
import com.kcls.bean.TypeBean;

public interface MaterialsTypeMapper {

	@Select("select * from sms_2102_type limit #{pageNumber},#{pageSize};")
	public List<HashMap<String,Object>> MaterialsTypeList(HashMap<String,Object> map);
	
	@Select("select count(*) from sms_2102_type")
	public Integer MaterialsTypeCount(HashMap<String,Object> map);
	
	@Insert("insert into sms_2102_type (type_id,type_name,type_describe) values (#{type_id},#{type_name},#{type_describe});")
	public void addMaterialsType(TypeBean type);
	
	@Update("update sms_2102_type set type_name = #{type_name},type_describe = #{type_describe} where type_id = #{type_id}")
	public void modMaterialsType(TypeBean type);
	
	@Delete("delete from sms_2102_type where type_id = #{type_id}")
	public void deldMaterialsType(TypeBean type);
	
	@Select("select * from sms_2102_type")
	public List<TypeBean> queryAllType();
	
	@Select("select * from sms_2102_goods where goods_id = #{goods_id}")
	public List<GoodsBean> getBorrow(HashMap<String,Object> map);
	
	@Select("select * from sms_2102_goods g where g.type_id in (select type_id from sms_2102_storage)")
	public List<HashMap<String,Object>> fillForm();
}
