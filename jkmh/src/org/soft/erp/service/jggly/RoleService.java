package org.soft.erp.service.jggly;

import java.util.List;

import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jggly.Role;
import org.soft.erp.domain.jggly.RolePower;
import org.soft.erp.util.tag.PageModel;

public interface RoleService{
	/**
	 * 超级管理员-机构管理
	 * */
//	public Organ addOrgan();
	public Role editRole(Integer id);
	public void insertRole(Role bean);
	public void updateRole(Role bean);
	public void deleteRole(String id);
	public List<Role> selectRole(PageModel pageModel);
	
	public  List<Sfield> selectByTablename(String tblname);

	public List<RolePower> selectRolePowers(String roleid);

}
