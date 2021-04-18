package org.soft.erp.dao.jkzj;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.jkzj.Fcgl;

public interface FcglDao {
	
	// 动态查询
	@SelectProvider(type=FcglDaoImpl.class,method="select")
	List<Fcgl> select(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type=FcglDaoImpl.class,method="count")
	Integer count(Map<String, Object> params);

	// 根据id删除用户
	@SelectProvider(type=FcglDaoImpl.class,method="delete")
	void delete(Integer id);
}
