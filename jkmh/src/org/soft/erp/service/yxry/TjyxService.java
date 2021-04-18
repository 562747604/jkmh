package org.soft.erp.service.yxry;

import java.util.List;
import java.util.Map;

import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jggly.Dxfsjl;
import org.soft.erp.util.tag.PageModel;

public interface TjyxService{
	/**
	 * 超级管理员-机构管理
	 * */
	public List<Dxfsjl> selectTjyx(PageModel pageModel);
	
	public  List<Sfield> selectByTablename(String tblname);

	public List<Dxfsjl> selectTjyx(String keyword);
}
