package org.soft.erp.service.yxry;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.soft.erp.dao.SfieldDao;
import org.soft.erp.dao.yxry.FstjDao;
import org.soft.erp.domain.jggly.Dxfsjl;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("fstjService")
public class FstjServiceImpl implements FstjService{

	/*
	 * *************************超级管理员-机构管理*******************************
	 */

	@Autowired
	private FstjDao fstjDao;

	@Transactional(readOnly=true)
	@Override
	public List<Dxfsjl> selectFstj(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
		params.put("pageModel", pageModel);

		//根据prams取得所有数据
		int recordCount = fstjDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Dxfsjl> beans = fstjDao.select(params);

		return beans;
	}

	@Override
	public List<Dxfsjl> selectFstj(String keyword) {	
		return fstjDao.selectAll(keyword);
	}

}
