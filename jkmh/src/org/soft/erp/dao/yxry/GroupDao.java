package org.soft.erp.dao.yxry;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.yxry.Group;

public interface GroupDao {

	// 根据id删除用户
	@SelectProvider(type=GroupDaoImpl.class,method="delete")
	void delete(Integer id);
		
	// 根据id查询用户
	@SelectProvider(type=GroupDaoImpl.class,method="edit")
	Group edit(Integer id);
	
	// 动态插入
	@SelectProvider(type=GroupDaoImpl.class,method="insert")
	void insert(Group bean);

	// 动态插入
	@SelectProvider(type=GroupDaoImpl.class,method="update")
	void update(Group bean);
	
	// 动态查询
	@SelectProvider(type=GroupDaoImpl.class,method="select")
	List<Group> select(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type=GroupDaoImpl.class,method="count")
	Integer count(Map<String, Object> params);
	
	
}
