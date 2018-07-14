package com.kcls.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kcls.bean.IncomeSubjectBean;
import com.kcls.bean.NodeBean;
import com.kcls.bean.Page;
 

public interface IncomeSubjectMapper {
	
	
	int  selectCount(Page page);
	
	List<IncomeSubjectBean> select(Page page);
	
	int   insert(IncomeSubjectBean  bean);
	
	@Delete("delete from kcls_2017_incomeCourse where course_id = #{course_id}")
	int   delete_one(IncomeSubjectBean  bean);
	
	@Select(" select * from  kcls_2017_incomeCourse  where fatherCourse_id is null  ")
	List<IncomeSubjectBean> select_parent_income_subject();
	
	@Select(" select *  ,(SELECT  course_name   from kcls_2017_incomeCourse   s2  where  s1.fatherCourse_id=s2.course_id  ) as  fatherCourse_name  from   kcls_2017_incomeCourse  s1 where course_id = #{course_id}")
	List<IncomeSubjectBean> select_one(IncomeSubjectBean  bean);

	@Update(" update kcls_2017_incomeCourse   SET    fatherCourse_id = #{fatherCourse_id},course_name = #{course_name},course_remark = #{course_remark}   where course_id = #{course_id} ")
	int  update(IncomeSubjectBean  bean);
	
	@Select("select course_id as node_id ,course_name as text,fatherCourse_id as parent_id from kcls_2017_incomeCourse")
	List<NodeBean> selectTree();
}
