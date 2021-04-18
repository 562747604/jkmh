package org.soft.erp.service.sys;

import java.util.List;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.sys.Glygl;
import org.soft.erp.util.tag.PageModel;

public interface GlyglService{
	/**
	 * 超级管理员-机构管理
	 * */
//	public Organ addOrgan();
	public Glygl editGlygl(Integer id);
	public void insertGlygl(Glygl bean);
	public void updateGlygl(Glygl bean);
	public void deleteGlygl(String id);
	public List<Glygl> selectGlygl(PageModel pageModel);
	
	public  List<Sfield> selectByTablename(String tblname);


}
