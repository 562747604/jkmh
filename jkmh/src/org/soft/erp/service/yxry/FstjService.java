package org.soft.erp.service.yxry;

import java.util.List;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jggly.Dxfsjl;
import org.soft.erp.util.tag.PageModel;

public interface FstjService{
	/**
	 * 超级管理员-机构管理
	 * */
	public List<Dxfsjl> selectFstj(PageModel pageModel);
	

	public List<Dxfsjl> selectFstj(String keyword);
}
