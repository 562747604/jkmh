package org.soft.erp.service.jkzj;

import java.util.List;

import org.soft.erp.domain.jkzj.Fcgl;
import org.soft.erp.util.tag.PageModel;

public interface FcglService{
	public List<Fcgl> selectFcgl(PageModel pageModel);
	public void deleteFcgl(String id);
}
