package org.soft.erp.dao.jggly;

import org.apache.ibatis.jdbc.SQL;

/**   
 * @Description: 代码库SQL语句提供类
 * @author 	   
 * @date 2016年7月11日 上午11:19:23 
 * @version V1.0   
 */
public class RolePowerDaoImpl {
	String tblnameString="s_rbac_role_power";

	// 根据角色选择权限
	public String selectRolePowers(String roleid) {
		String sql = new SQL() {
			{
				SELECT("*");
				FROM(tblnameString);
				WHERE("roleid = #{roleid} ");
			}
		}.toString();
		return sql;
	}
}
