package org.soft.erp.service.yxry;

import java.util.List;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.yxry.Ztgl;
import org.soft.erp.util.tag.PageModel;

public interface ZtglService{
	/**
	 * 超级管理员-机构管理
	 * */
//	public Organ addOrgan();
	public Ztgl editZtgl(Integer id);
	public void insertZtgl(Ztgl bean);
	public void updateZtgl(Ztgl bean);
	public void deleteZtgl(String id);
	public List<Ztgl> selectZtgl(PageModel pageModel);
	
	public  List<Sfield> selectByTablename(String tblname);


}
