package org.soft.erp.service.yxry;

import java.util.List;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jggly.Dxfsjl;
import org.soft.erp.util.tag.PageModel;

public interface DftjService{
	/**
	 * 超级管理员-机构管理
	 * */
	public List<Dxfsjl> selectDftj(PageModel pageModel);
	
	public  List<Sfield> selectByTablename(String tblname);

	public List<Dxfsjl> selectDftj(String keyword);
}
