package com.kcls.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.kcls.bean.ReceiveData;
import com.kcls.bean.Relation;

public interface ClientRelationsMapper {

	@Select("select * from sms_2907_crm_relation where relation_id like concat('%',#{name},'%')")
	public List<Relation> dimSelectSize(ReceiveData data);
	
	@Select("select * from sms_2907_crm_relation where relation_id like concat('%',#{name},'%') limit #{pageNumber},#{pageSize}")
	public List<Relation> dimSelectSellChance(ReceiveData data);
	
	@Insert("insert into sms_2907_crm_relation(relation_id,person_id,client_id,time,address,remark) values(#{relation_id},#{person_id},#{client_id},#{time},#{address},#{remark})")
	public void addClientManage(Relation relation);
	
}
