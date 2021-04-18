package org.soft.erp.service.yxry;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.soft.erp.dao.SfieldDao;
import org.soft.erp.dao.yxry.TjyxDao;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jggly.Dxfsjl;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("tjyxService")
public class TjyxServiceImpl implements TjyxService{
	
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
	private TjyxDao tjyxDao;

	@Transactional(readOnly=true)
	@Override
	public List<Dxfsjl> selectTjyx(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
	    params.put("pageModel", pageModel);

	    //根据prams取得所有数据
		int recordCount = tjyxDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Dxfsjl> beans = tjyxDao.select(params);
		
		return beans;
	}

	@Override
	public List<Dxfsjl> selectTjyx(String keyword) {	
		return tjyxDao.selectAll(keyword);
	}
	
}
