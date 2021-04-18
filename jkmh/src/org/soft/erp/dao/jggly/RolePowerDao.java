package org.soft.erp.dao.jggly;

import java.util.List;
import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.jggly.RolePower;

public interface RolePowerDao {

	// 根据角色查询权限
	@SelectProvider(type=RolePowerDaoImpl.class,method="selectRolePowers")
	List<RolePower> selectRolePowers(String roleid);	
}
