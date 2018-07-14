package com.kcls.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kcls.bean.Page;
import com.kcls.bean.ReimburseBean;
import com.kcls.bean.UserBean;


/*
 * 我的报销草稿
 */
public interface MyReimbursementDraftMapeer {
	
	List<ReimburseBean>  my_reimbursement_draft_list(Page  page);
	
	int  my_reimbursement_draft_count(Page  page);
	
	int   add(ReimburseBean ReimburseBean);
	
	
	@Select("select  DISTINCT   course_id  "
			+ ",(select  course_name  from   kcls_2017_spendingCourse s1  where s1.course_id=r1.course_id ) as  course_name"
			+ " from   kcls_2017_reimburse   r1"
			+ "  where   budgetName_id  = #{user_id} and cashier_type  = 0 ")
	List<ReimburseBean>  my_reimbursement_draft_all(UserBean  UserBean);
	
	@Update("update  kcls_2017_reimburse  set  cashier_type = 2  where budget_id=#{budget_id} ")
	int  my_reimbursement_draft_submit(String budget_id);
	
	
	@Delete("delete from kcls_2017_reimburse where budget_id = #{budget_id}")
	int reimbursement_delate_one(String  budget_id);
	
	@Update("update kcls_2017_reimburse set course_id = #{course_id} , reimburse_title = #{reimburse_title} , reimburse_matter = #{reimburse_matter} , reimburse_money = #{reimburse_money}   where  budget_id = #{budget_id}  ")
	int my_reimbursement_draft_update(ReimburseBean ReimburseBean);
}
