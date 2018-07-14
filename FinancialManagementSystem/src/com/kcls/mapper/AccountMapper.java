package com.kcls.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.kcls.bean.AccountBean;
import com.kcls.bean.Page;

public interface AccountMapper {

	/**
	 * 
	 * @param page
	 * @return
	 * 分页查询
	 */
	@Select("select * from kcls_2017_account where account_name like concat('%',#{searchText},'%') ")
	public List<AccountBean> selectCountAccount(Page page);
	
	@Select("select * from kcls_2017_account where account_name like concat('%',#{searchText},'%') limit #{pageNumber},#{pageSize}")
	public List<AccountBean> selectAccount(Page page);
	
	/**
	 * 添加
	 * @param accountBean
	 */
	@Insert("insert into kcls_2017_account(account_id,account_name,account,banks_type,account_oldMoney,account_newMoney,create_name,create_date)"+
			"values(#{account_id},#{account_name},#{account},#{banks_type},#{account_oldMoney},#{account_newMoney},#{create_name},#{create_date});")
	public void accountAdd(AccountBean accountBean);

	/**
	 * 
	 * @param accountBean
	 * 删除
	 */
	@Delete("delete from kcls_2017_account where account_id = #{account_id}")
	public void deleteAccount(AccountBean accountBean);

	/**
	 * 
	 * @param accountBean
	 * @return
	 * 修改
	 */
	@Select("select * from kcls_2017_account where account_id = #{account_id}")
	public List<AccountBean> selectAccountId(AccountBean accountBean);

	@Update("update kcls_2017_account set account_name = #{account_name},account = #{account},banks_type = #{banks_type},account_oldMoney = #{account_oldMoney},"
			+ "account_newMoney = #{account_newMoney},create_name = #{create_name}, create_date = #{create_date} where account_id = #{account_id}")
	public void modifyAccount(AccountBean accountBean);

	/**
	 * 
	 * @param page
	 * @return
	 * 账户资金查看
	 */
	public List<AccountBean> accountMoneyLookCount(Page page);

	public List<AccountBean> numberMoneyLook(Page page);
		
}
