package org.soft.erp.service.yxry;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.soft.erp.dao.jkzj.FcglDao;
import org.soft.erp.dao.yxry.FctxDao;
import org.soft.erp.domain.jkzj.Fcgl;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service("fctxService")
public class FctxServiceImpl implements FctxService {
	@Autowired
	private FctxDao fctxDao;
	
	@Transactional(readOnly=true)
	@Override
	public List<Fcgl> selectFctx(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
	    params.put("pageModel", pageModel);

	    //根据prams取得所有数据
		int recordCount = fctxDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Fcgl> beans = fctxDao.select(params);
		
		return beans;
	}
}
