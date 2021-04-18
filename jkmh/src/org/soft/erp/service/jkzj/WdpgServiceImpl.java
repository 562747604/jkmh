package org.soft.erp.service.jkzj;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.soft.erp.dao.jkzj.WdpgDao;
import org.soft.erp.domain.jggly.Ryfp;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service("wdpgService")
public class WdpgServiceImpl implements WdpgService {
	@Autowired
	private WdpgDao wdpgDao;
	
	@Override
	public void updateWdpg(Ryfp bean){
		wdpgDao.update(bean);
	}
	
	@Transactional(readOnly=true)
	@Override
	public List<Ryfp> selectWdpg(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
	    params.put("pageModel", pageModel);

	    //根据prams取得所有数据
		int recordCount = wdpgDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Ryfp> beans = wdpgDao.select(params);
		
		return beans;
	}
	
	@Override
	public void updateJkzj(String  id,String zjid,String zjname){
		wdpgDao.updateJkzj(id, zjid, zjname);
	}
}
