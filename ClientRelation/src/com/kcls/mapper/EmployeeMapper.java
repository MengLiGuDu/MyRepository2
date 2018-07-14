package com.kcls.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kcls.bean.Person;
import com.kcls.bean.ReceiveData;

public interface EmployeeMapper {
	
	@Select("select count(person_id) from sms_2903_crm_person where name like concat('%',#{name},'%')")
	public Integer allMessage(ReceiveData receive);
	
	@Select("select * from sms_2903_crm_person where name like concat('%',#{name},'%') limit #{pageNumber},#{pageSize}")
	public List<Person> pageMessage(ReceiveData receive);
	
	@Insert("insert into sms_2903_crm_person (person_id,name,Password,age,sex,position,phone,id_card,mailbox,"
			+ "address,create_time,status) values (#{person_id},#{name},#{Password},#{age},#{sex},#{position},"
			+ "#{phone},#{id_card},#{mailbox},#{address},#{create_time},#{status})")
	public void insertPerson(Person person);
	
	@Delete("delete from sms_2903_crm_person where person_id = #{person_id}")
	public void deletePerson(Person person);
	
	@Select("select * from sms_2903_crm_person where person_id = #{person_id}")
	public List<Person> findList(Person person);
	
	@Update("update sms_2903_crm_person set name=#{name},age=#{age},sex=#{sex},position=#{position},phone=#{phone},"
			+ "id_card=#{id_card},mailbox=#{mailbox},address=#{address},update_time=#{update_time} where person_id = #{person_id}")
	public void modifyEmployee(Person person);
	
	@Update("update sms_2903_crm_person set status=#{status} where person_id = #{person_id}")
	public void modigyStatus(Person person);
	
	@Select("select * from sms_2903_crm_person where status=1")
	public List<Person> selectAllPerson();
	
}
