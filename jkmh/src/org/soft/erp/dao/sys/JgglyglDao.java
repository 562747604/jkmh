package org.soft.erp.dao.sys;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.jggly.Gly;
import org.soft.erp.domain.sys.Organ;

public interface JgglyglDao {

	// 根据id删除用户
	@SelectProvider(type=JgglyglDaoImpl.class,method="delete")
	void delete(Integer id);
		
	// 根据id查询用户
	@SelectProvider(type=JgglyglDaoImpl.class,method="edit")
	Gly edit(Integer id);
	
	// 动态插入
	@SelectProvider(type=JgglyglDaoImpl.class,method="insert")
	void insert(Gly bean);

	// 动态插入
	@SelectProvider(type=JgglyglDaoImpl.class,method="update")
	void update(Gly bean);
	
	// 动态查询
	@SelectProvider(type=JgglyglDaoImpl.class,method="select")
	List<Gly> select(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type=JgglyglDaoImpl.class,method="count")
	Integer count(Map<String, Object> params);
	
	// 动态查询
	@SelectProvider(type=JgglyglDaoImpl.class,method="getJg")
	List<Organ> getJg();

}
