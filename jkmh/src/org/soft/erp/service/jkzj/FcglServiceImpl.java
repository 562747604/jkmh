package org.soft.erp.service.jkzj;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.soft.erp.dao.jkzj.FcglDao;
import org.soft.erp.domain.jkzj.Fcgl;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service("fcglService")
public class FcglServiceImpl implements FcglService {
	@Autowired
	private FcglDao fcglDao;
	
	@Transactional(readOnly=true)
	@Override
	public List<Fcgl> selectFcgl(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
	    params.put("pageModel", pageModel);

	    //根据prams取得所有数据
		int recordCount = fcglDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Fcgl> beans = fcglDao.select(params);
		
		return beans;
	}
	
	@Override
	public void deleteFcgl(String id) {
		String[] ids=id.split(",");
		for(int i=0;i<ids.length;i++){
			fcglDao.delete(Integer.parseInt(ids[i]));
		}
	}
}
