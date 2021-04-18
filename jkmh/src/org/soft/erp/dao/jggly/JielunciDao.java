package org.soft.erp.dao.jggly;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.jggly.Jielunci;

public interface JielunciDao {

	// 根据id删除用户
	@SelectProvider(type=JielunciDaoImpl.class,method="delete")
	void delete(Integer id);
		
	// 根据id查询用户
	@SelectProvider(type=JielunciDaoImpl.class,method="edit")
	Jielunci edit(Integer id);
	
	// 动态插入
	@SelectProvider(type=JielunciDaoImpl.class,method="insert")
	void insert(Jielunci bean);

	// 动态插入
	@SelectProvider(type=JielunciDaoImpl.class,method="update")
	void update(Jielunci bean);
	
	// 动态查询
	@SelectProvider(type=JielunciDaoImpl.class,method="select")
	List<Jielunci> select(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type=JielunciDaoImpl.class,method="count")
	Integer count(Map<String, Object> params);
	
	
}
