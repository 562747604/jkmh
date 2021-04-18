package org.soft.erp.service.jkzj;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.soft.erp.dao.jkzj.ZdyxDao;
import org.soft.erp.domain.jggly.Ryfp;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service("zdyxService")
public class ZdyxServiceImpl implements ZdyxService {
	@Autowired
	private ZdyxDao zdyxDao;
	
	@Override
	public void updateZdyx(Ryfp bean){
		zdyxDao.update(bean);
	}
	
	@Transactional(readOnly=true)
	@Override
	public List<Ryfp> selectZdyx(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
	    params.put("pageModel", pageModel);

	    //根据prams取得所有数据
		int recordCount = zdyxDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Ryfp> beans = zdyxDao.select(params);
		
		return beans;
	}
	
	@Override
	public void updateJkzj(String  id,String zjid,String zjname){
		zdyxDao.updateJkzj(id, zjid, zjname);
	}
}
