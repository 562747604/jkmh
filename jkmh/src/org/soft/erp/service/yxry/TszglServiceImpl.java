package org.soft.erp.service.yxry;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.soft.erp.dao.SfieldDao;
import org.soft.erp.dao.yxry.TszglDao;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jkzy.Jkfw;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("tszglService")
public class TszglServiceImpl implements TszglService{
	
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
	private TszglDao tszglDao;

	@Transactional(readOnly=true)
	@Override
	public Jkfw editTszgl(Integer id){
		Jkfw bean = tszglDao.edit(id);
		return bean;
	}

	@Override
	public void insertTszgl(Jkfw bean){
		tszglDao.insert(bean);
	}
	
	@Override
	public void updateTszgl(Jkfw bean){
		tszglDao.update(bean);
	}
	
	@Override
	public void deleteTszgl(String id) {
		String[] ids=id.split(",");
		for(int i=0;i<ids.length;i++){
			tszglDao.delete(Integer.parseInt(ids[i]));
		}
	}

	@Transactional(readOnly=true)
	@Override
	public List<Jkfw> selectTszgl(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
	    params.put("pageModel", pageModel);

	    //根据prams取得所有数据
		int recordCount = tszglDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Jkfw> beans = tszglDao.select(params);
		
		return beans;
	}
}
