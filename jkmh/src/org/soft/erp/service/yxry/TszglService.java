package org.soft.erp.service.yxry;

import java.util.List;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jkzy.Jkfw;
import org.soft.erp.util.tag.PageModel;

public interface TszglService{
	/**
	 * 超级管理员-机构管理
	 * */
//	public Organ addOrgan();
	public Jkfw editTszgl(Integer id);
	public void insertTszgl(Jkfw bean);
	public void updateTszgl(Jkfw bean);
	public void deleteTszgl(String id);
	public List<Jkfw> selectTszgl(PageModel pageModel);
	
	public  List<Sfield> selectByTablename(String tblname);


}
