package org.soft.erp.dao.jkzy;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.jkzy.Jkfw;

public interface JkfwDao {

	// 根据id删除用户
	@SelectProvider(type=JkfwDaoImpl.class,method="delete")
	void delete(Integer id);
		
	// 根据id查询用户
	@SelectProvider(type=JkfwDaoImpl.class,method="edit")
	Jkfw edit(Integer id);
	
	// 动态插入
	@SelectProvider(type=JkfwDaoImpl.class,method="insert")
	void insert(Jkfw bean);

	// 动态插入
	@SelectProvider(type=JkfwDaoImpl.class,method="update")
	void update(Jkfw bean);
	
	// 动态查询
	@SelectProvider(type=JkfwDaoImpl.class,method="select")
	List<Jkfw> select(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type=JkfwDaoImpl.class,method="count")
	Integer count(Map<String, Object> params);
	
	
}
