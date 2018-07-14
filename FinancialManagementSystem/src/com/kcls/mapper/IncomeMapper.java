package com.kcls.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kcls.bean.Page;
import com.kcls.bean.AccountBean;
import com.kcls.bean.IncomeBean;
import com.kcls.bean.IncomeSubjectBean;

public interface IncomeMapper {
	public List<IncomeBean> select();
	public Integer allMessage(Page page);
	public List<IncomeBean> pageMessage(Page page);
	public List<AccountBean> selectAccount();
	public List<IncomeSubjectBean> accounName();
	public List<IncomeBean> updateIncomeList(IncomeBean incomeBean);
	public void updateIncomeState(IncomeBean incomeBean);
	
	public void insertIncome(IncomeBean incomeBean);
	
	public void deleteIncome(IncomeBean incomeBean);
	
	public void updateIncome(IncomeBean incomeBean);
	
	@Select("select * from kcls_2017_income  where  course_id like concat('%',#{searchText2},'%') and income_state = #{state} and income_name like concat('%',#{searchText},'%') and payment_name like concat('%',#{searchText1},'%') ")
	public List<IncomeBean> selectWaitTellerCount(Page page);
	
	@Select("select incon.* ,(select course_name from kcls_2017_incomeCourse incoc where incoc.course_id = incon.course_id) as course_name  from kcls_2017_income incon where income_state = #{state} and "
			+ "  course_id like concat('%',#{searchText2},'%')  and income_name like concat('%',#{searchText},'%') and payment_name like concat('%',#{searchText1},'%') limit #{pageNumber},#{pageSize};")
	public List<IncomeBean> selectWaitTeller(Page page);
	
	@Update("update kcls_2017_income set income_state = 2 where income_id = #{income_id};")
	public void updateIncomeAffirmState(IncomeBean incomeBean);
	
}
