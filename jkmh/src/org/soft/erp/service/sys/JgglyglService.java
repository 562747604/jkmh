package org.soft.erp.service.sys;

import java.util.List;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jggly.Gly;
import org.soft.erp.util.tag.PageModel;

public interface JgglyglService{
	/**
	 * 超级管理员-机构管理
	 * */
//	public Organ addOrgan();
	public Gly editJgglygl(Integer id);
	public void insertJgglygl(Gly bean);
	public void updateJgglygl(Gly bean);
	public void deleteJgglygl(String id);
	public List<Gly> selectJgglygl(PageModel pageModel);
	
	public  List<Sfield> selectByTablename(String tblname);

	public	String getJg(String jcode);
	

}
