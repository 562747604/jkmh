package org.soft.erp.service.yxry;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.soft.erp.dao.SfieldDao;
import org.soft.erp.dao.yxry.DftjDao;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jggly.Dxfsjl;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("dftjService")
public class DftjServiceImpl implements DftjService{

	@Autowired
	private SfieldDao sfieldDao;
	@Transactional(readOnly=true)
	@Override
	public List<Sfield> selectByTablename(String tblname){
		return sfieldDao.selectByTablename(tblname);
	}

	/*
	 * *************************超级管理员-机构管理*******************************
	 */

	@Autowired
	private DftjDao dftjDao;

	@Transactional(readOnly=true)
	@Override
	public List<Dxfsjl> selectDftj(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
		params.put("pageModel", pageModel);

		//根据prams取得所有数据
		int recordCount = dftjDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Dxfsjl> beans = dftjDao.select(params);

		return beans;
	}

	@Override
	public List<Dxfsjl> selectDftj(String keyword) {	
		return dftjDao.selectAll(keyword);
	}

}
