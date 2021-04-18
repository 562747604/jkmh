package org.soft.erp.dao.yxry;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.jkzj.Fcgl;


public interface FctxDao {
	
	// 动态查询
	@SelectProvider(type=FctxDaoImpl.class,method="select")
	List<Fcgl> select(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type=FctxDaoImpl.class,method="count")
	Integer count(Map<String, Object> params);
}
