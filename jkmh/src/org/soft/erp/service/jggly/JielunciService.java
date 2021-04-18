package org.soft.erp.service.jggly;

import java.util.List;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jggly.Jielunci;
import org.soft.erp.util.tag.PageModel;

public interface JielunciService{
	/**
	 * 超级管理员-机构管理
	 * */
//	public Jielunci addJielunci();
	public Jielunci editJielunci(Integer id);
	public void insertJielunci(Jielunci bean);
	public void updateJielunci(Jielunci bean);
	public void deleteJielunci(String id);
	public List<Jielunci> selectJielunci(PageModel pageModel);
	
	public  List<Sfield> selectByTablename(String tblname);


}
