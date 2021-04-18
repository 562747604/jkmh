package org.soft.erp.dao.jggly;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.jggly.Role;

public interface RoleDao {

	// 根据id删除用户
	@SelectProvider(type=RoleDaoImpl.class,method="delete")
	void delete(Integer id);

	// 根据id查询用户
	@SelectProvider(type=RoleDaoImpl.class,method="edit")
	Role edit(Integer id);

	// 动态插入
	@SelectProvider(type=RoleDaoImpl.class,method="insert")
	void insert(Role bean);

	// 动态插入
	@SelectProvider(type=RoleDaoImpl.class,method="update")
	void update(Role bean);

	// 动态查询
	@SelectProvider(type=RoleDaoImpl.class,method="select")
	List<Role> select(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type=RoleDaoImpl.class,method="count")
	Integer count(Map<String, Object> params);

	// 根据id查询所有角色
	@SelectProvider(type=RoleDaoImpl.class,method="selectById")
	Role selectById(Integer params);

	// 根据role_id查询角色
	@SelectProvider(type=RoleDaoImpl.class,method="selectRoleByRole_id")
	List<Role> selectRoleByRole_id(String params);	
}
