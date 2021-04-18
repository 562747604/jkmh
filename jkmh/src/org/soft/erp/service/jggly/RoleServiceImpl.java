package org.soft.erp.service.jggly;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.soft.erp.dao.SfieldDao;
import org.soft.erp.dao.jggly.RoleDao;
import org.soft.erp.dao.jggly.RolePowerDao;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jggly.Role;
import org.soft.erp.domain.jggly.RolePower;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("roleService")
public class RoleServiceImpl implements RoleService{
	
	@Autowired
	private SfieldDao sfieldDao;
	@Transactional(readOnly=true)
	@Override
	public List<Sfield> selectByTablename(String tblname){
		return sfieldDao.selectByTablename(tblname);
	}

	/*
	 * *************************超级管理员-机构管理*******************************
	 */
	
	@Autowired
	private RoleDao roleDao;

	@Transactional(readOnly=true)
	@Override
	public Role editRole(Integer id){
		Role bean = roleDao.edit(id);
		return bean;
	}

	@Override
	public void insertRole(Role bean){
		roleDao.insert(bean);
	}
	
	@Override
	public void updateRole(Role bean){
		roleDao.update(bean);
	}
	
	@Override
	public void deleteRole(String id) {
		String[] ids=id.split(",");
		for(int i=0;i<ids.length;i++){
			roleDao.delete(Integer.parseInt(ids[i]));
		}
	}

	@Transactional(readOnly=true)
	@Override
	public List<Role> selectRole(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
	    params.put("pageModel", pageModel);

	    //根据prams取得所有数据
		int recordCount = roleDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Role> beans = roleDao.select(params);
		
		return beans;
	}
	
	
	@Autowired
	private RolePowerDao rolePowerDao;
	
	@Transactional(readOnly=true)
	@Override
	public List<RolePower> selectRolePowers(String roleid){
		return rolePowerDao.selectRolePowers(roleid);
	}

}
