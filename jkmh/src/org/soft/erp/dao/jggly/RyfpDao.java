package org.soft.erp.dao.jggly;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.jggly.Ryfp;

public interface RyfpDao {
	
	// 动态插入
	@SelectProvider(type=RyfpDaoImpl.class,method="insert")
	void insert(Ryfp bean);

	// 根据id删除用户
	@SelectProvider(type=RyfpDaoImpl.class,method="delete")
	void delete(Integer id);
		
	// 根据id查询用户
	@SelectProvider(type=RyfpDaoImpl.class,method="edit")
	Ryfp edit(Integer id);

	// 动态插入
	@SelectProvider(type=RyfpDaoImpl.class,method="update")
	void update(Ryfp bean);
	
	// 动态查询
	@SelectProvider(type=RyfpDaoImpl.class,method="select")
	List<Ryfp> select(Map<String, Object> params);
	
	@SelectProvider(type=RyfpDaoImpl.class,method="selectByuid")
	Ryfp selectByuid(String uid,String jgid);

	// 根据参数查询用户总数
	@SelectProvider(type=RyfpDaoImpl.class,method="count")
	Integer count(Map<String, Object> params);
	
	//取得所有体检用户
	@Select("select * from s_tuser ")
	List<Ryfp> selectAllTjyhs();
	
	//根据体检号手机号取得体检用户
	@Select("select * from s_tuser where tjh = #{tjh} and mobile = #{mobile}")
	Ryfp selectByTjhAndMobile(@Param("tjh")String tjh,@Param("mobile")String mobile);
}




















