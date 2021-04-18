package org.soft.erp.service.jggly;

import java.util.List;

import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jggly.Ryfp;
import org.soft.erp.domain.jggly.User;
import org.soft.erp.util.tag.PageModel;

public interface RyfpService{
	/**
	 * 超级管理员-机构管理
	 * */
	public void insertRyfp(Ryfp bean);
	public Ryfp editRyfp(Integer id);
	public void updateRyfp(Ryfp bean);
	public void deleteRyfp(String id);
	public List<Ryfp> selectRyfp(PageModel pageModel);
	
	public  List<Sfield> selectByTablename(String tblname);

	public List<Ryfp> selectRyfps();
	
	public  Ryfp  selectByuid(String uid,String jgid);
	//初始化人员分配批量
	public void initRyfp(List<User> users, List<Ryfp> ryfps);
	//新增人员分配
	public void singleRyfp(Ryfp ryfp);
	
	
	public Ryfp selectRyfpByTjhAndMobile(String tjh,String mobile);


}
