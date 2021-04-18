package org.soft.erp.dao.sys;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.sys.Organ;

public interface OrganDao {

	// 根据id删除用户
	@SelectProvider(type=OrganDaoImpl.class,method="delete")
	void delete(Integer id);
		
	// 根据id查询用户
	@SelectProvider(type=OrganDaoImpl.class,method="edit")
	Organ edit(Integer id);
	
	// 动态插入
	@SelectProvider(type=OrganDaoImpl.class,method="insert")
	void insert(Organ bean);

	// 动态插入
	@SelectProvider(type=OrganDaoImpl.class,method="update")
	void update(Organ bean);
	
	// 动态查询
	@SelectProvider(type=OrganDaoImpl.class,method="select")
	List<Organ> select(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type=OrganDaoImpl.class,method="count")
	Integer count(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type=OrganDaoImpl.class,method="get")
	Organ get(String jgid);

	// 根据参数查询用户总数
	@SelectProvider(type=OrganDaoImpl.class,method="selectByComapnyId")
	Organ selectByComapnyId(String companyId);
	
	
}
