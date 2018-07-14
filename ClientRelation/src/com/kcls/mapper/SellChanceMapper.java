package com.kcls.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kcls.bean.Chance;
import com.kcls.bean.ReceiveData;

public interface SellChanceMapper {

	@Select("select * from sms_2904_crm_chance where client_id like concat('%',#{name},'%')")
	public List<Chance> dimSelectSize(ReceiveData data);
	
	@Select("select * from sms_2904_crm_chance where client_id like concat('%',#{name},'%') limit #{pageNumber},#{pageSize}")
	public List<Chance> dimSelectSellChance(ReceiveData data);
	
	@Insert("insert into sms_2904_crm_chance(chance_id,client_id,person_id,source,create_time,probability) values(#{chance_id},#{client_id},#{person_id},#{source},#{create_time},#{probability})")
	public void addChance(Chance chance);
	
	@Delete("delete from sms_2904_crm_chance where chance_id=#{chance_id}")
	public void sellChanceDelete(Chance chance);
	
	@Update("update sms_2904_crm_chance set client_id=#{client_id} , person_id=#{person_id}, source=#{source},probability=#{probability} where chance_id=#{chance_id}")
	public void sellChanceModify(Chance chance);
}
