package org.soft.erp.dao.yxry;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.jggly.Dxfsjl;

public interface FstjDao {
	// 动态查询
	@SelectProvider(type=FstjDaoImpl.class,method="select")
	List<Dxfsjl> select(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type=FstjDaoImpl.class,method="count")
	Integer count(Map<String, Object> params);
	
	@SelectProvider(type=FstjDaoImpl.class,method="selectAll")
	List<Dxfsjl> selectAll(String keyword);
}
