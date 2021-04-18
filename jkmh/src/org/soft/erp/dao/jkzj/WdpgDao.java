package org.soft.erp.dao.jkzj;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.jggly.Ryfp;

public interface WdpgDao {

	// 动态插入
	@SelectProvider(type=PgywDaoImpl.class,method="update")
	void update(Ryfp bean);
	
	// 动态查询
	@SelectProvider(type=PgywDaoImpl.class,method="select")
	List<Ryfp> select(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type=PgywDaoImpl.class,method="count")
	Integer count(Map<String, Object> params);
	
	// 动态插入
	@SelectProvider(type=PgywDaoImpl.class,method="updateJkzj")
	void updateJkzj(String id,String zjid,String zjname);
}
