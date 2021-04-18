package org.soft.erp.dao.sys;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.sys.Glygl;

public interface GlyglDao {

	// 根据id删除用户
	@SelectProvider(type=GlyglDaoImpl.class,method="delete")
	void delete(Integer id);
		
	// 根据id查询用户
	@SelectProvider(type=GlyglDaoImpl.class,method="edit")
	Glygl edit(Integer id);
	
	// 动态插入
	@SelectProvider(type=GlyglDaoImpl.class,method="insert")
	void insert(Glygl bean);

	// 动态插入
	@SelectProvider(type=GlyglDaoImpl.class,method="update")
	void update(Glygl bean);
	
	// 动态查询
	@SelectProvider(type=GlyglDaoImpl.class,method="select")
	List<Glygl> select(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type=GlyglDaoImpl.class,method="count")
	Integer count(Map<String, Object> params);
	
	
}
