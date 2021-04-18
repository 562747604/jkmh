package org.soft.erp.service.yxry;

import java.util.List;

import org.soft.erp.domain.jkzj.Fcgl;
import org.soft.erp.util.tag.PageModel;

public interface FctxService{
	public List<Fcgl> selectFctx(PageModel pageModel);
}
