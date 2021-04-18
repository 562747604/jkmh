package org.soft.erp.service.jkzj;

import java.util.List;

import javax.servlet.jsp.jstl.sql.Result;

import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jggly.Ryfp;
import org.soft.erp.domain.jkzj.Hfjl;
import org.soft.erp.util.tag.PageModel;

public interface ZdyxService{
	public void updateZdyx(Ryfp bean);
	public List<Ryfp> selectZdyx(PageModel pageModel);
	public void updateJkzj(String id,String zjid,String zjname);
}
