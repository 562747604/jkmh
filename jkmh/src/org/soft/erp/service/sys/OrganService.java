package org.soft.erp.service.sys;

import java.util.List;

import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.sys.Organ;
import org.soft.erp.util.tag.PageModel;

public interface OrganService{
	/**
	 * 超级管理员-机构管理
	 * */
//	public Organ addOrgan();
	public Organ editOrgan(Integer id);
	public void insertOrgan(Organ bean);
	public void updateOrgan(Organ bean);
	public void deleteOrgan(String id);
	public List<Organ> selectOrgan(PageModel pageModel);
	
	public  List<Sfield> selectByTablename(String tblname);

	public Organ getOrgan(String jgid);
	
	public Organ selectByComapnyId(String companyId) ;

}
