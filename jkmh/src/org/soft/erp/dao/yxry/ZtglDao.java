package org.soft.erp.dao.yxry;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.yxry.Ztgl;;

public interface ZtglDao {

	// 根据id删除用户
	@SelectProvider(type=ZtglDaoImpl.class,method="delete")
	void delete(Integer id);
		
	// 根据id查询用户
	@SelectProvider(type=ZtglDaoImpl.class,method="edit")
	Ztgl edit(Integer id);
	
	// 动态插入
	@SelectProvider(type=ZtglDaoImpl.class,method="insert")
	void insert(Ztgl bean);

	// 动态插入
	@SelectProvider(type=ZtglDaoImpl.class,method="update")
	void update(Ztgl bean);
	
	// 动态查询
	@SelectProvider(type=ZtglDaoImpl.class,method="select")
	List<Ztgl> select(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type=ZtglDaoImpl.class,method="count")
	Integer count(Map<String, Object> params);
	
	
}
