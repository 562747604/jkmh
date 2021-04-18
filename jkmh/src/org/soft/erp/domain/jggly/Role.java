package org.soft.erp.domain.jggly;

import java.io.Serializable;

/**   
 * @Description: 权限表 s_rbac_role
 * @author    :中庸陈
 * @version V1.0   
 */
public class Role implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String role_id;//角色ID
	private String role_name;//角色名称
	private String menu_power;//菜单权限
	
	private String create_date;//创建日期
	private String creator	;//创建人

	private String bz;//菜单权限
	private String jgid;//菜单权限
	private String jtpye;//菜单权限
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getMenu_power() {
		return menu_power;
	}
	public void setMenu_power(String menu_power) {
		this.menu_power = menu_power;
	}

	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getJgid() {
		return jgid;
	}
	public void setJgid(String jgid) {
		this.jgid = jgid;
	}
	public String getJtpye() {
		return jtpye;
	}
	public void setJtpye(String jtpye) {
		this.jtpye = jtpye;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}


	
	

	
}
