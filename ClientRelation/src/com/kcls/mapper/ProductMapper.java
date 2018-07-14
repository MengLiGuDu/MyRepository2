package com.kcls.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kcls.bean.Product;
import com.kcls.bean.ReceiveData;

public interface ProductMapper{
	
	@Select("select * from sms_2905_crm_product where product_id = #{product_id}")
	public List<Product> modalSelect(Product product);
	
	@Select("select * from sms_2905_crm_product where name like CONCAT('%',#{name},'%')")
	public List<Product> dimSelectSize(ReceiveData data);
	
	@Select("select * from sms_2905_crm_product where name like CONCAT('%',#{name},'%') limit #{pageNumber},#{pageSize}")
	public List<Product> dimSelectDemo(ReceiveData data);
	
	@Update("update sms_2905_crm_product set name = #{name},count = #{count},source = #{source},product_desc = #{product_desc},create_time = #{create_time} where product_id = #{product_id}")
	public void update(Product product);
	
	@Delete("delete from sms_2905_crm_product where product_id = #{product_id}")
	public void delete(Product product);
	
	@Insert("insert into sms_2905_crm_product(product_id,name,count,source,product_desc,create_time)values(#{product_id},#{name},#{count},#{source},#{product_desc},#{create_time})")
	public void insert(Product product);
	
	@Select("select * from sms_2905_crm_product")
	public List<Product> selectAllProduct();
}
