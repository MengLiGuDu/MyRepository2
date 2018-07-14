package com.kcls.mapper.logistice;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.kcls.bean.CheckBean;

import com.kcls.bean.PageBean;

public interface CheckMapper {
	
	@Select("insert into sms_2801_forum_notice (notice_title,notice_content,notice_source,create_time,author_id)"
			+ " VALUES (#{notice_title},#{notice_content},#{notice_source},#{create_time},#{author_id})")
	public List<CheckBean> add(CheckBean input);

	@Select("update sms_2801_forum_notice set notice_title = #{notice_title},notice_content = #{notice_content},notice_source = #{notice_source},update_time = #{update_time},author_id = #{author_id}  where notice_id = #{notice_id}")
	public List<CheckBean> update(CheckBean input);

	@Select("delete from sms_2801_forum_notice where notice_id=#{notice_id}")
	public List<CheckBean> delete(CheckBean input);
	
	@Select("select * from sms_2102_check")
	public List<CheckBean> select();
	
	@Select("select count(check_id) from sms_2102_check where goods_id like concat('%',#{searchText},'%')")
	public Integer dimAllMessage(PageBean page);
	
	@Select("select * from sms_2102_check where goods_id like concat('%',#{searchText},'%') limit #{pageNumber},#{pageSize}")
	public List<CheckBean> dimPageMessage(PageBean page);

	
	
	
}
