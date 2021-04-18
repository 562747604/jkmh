package org.soft.erp.domain.jggly;

import java.io.Serializable;
import java.util.Date;

/**   
 * @Description: 权限表 s_rbac_role
 * @author    :中庸陈
 * @version V1.0   
 */
public class RolePower implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String roleid;//角色ID
	private String powerid;//角色名称
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	public String getPowerid() {
		return powerid;
	}
	public void setPowerid(String powerid) {
		this.powerid = powerid;
	}


	
}
