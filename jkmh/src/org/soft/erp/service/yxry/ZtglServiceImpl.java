package org.soft.erp.service.yxry;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.soft.erp.dao.SfieldDao;
import org.soft.erp.dao.yxry.ZtglDao;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.yxry.Ztgl;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("ztglService")
public class ZtglServiceImpl implements ZtglService{
	
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
	private ZtglDao ztglDao;

	@Transactional(readOnly=true)
	@Override
	public Ztgl editZtgl(Integer id){
		Ztgl bean = ztglDao.edit(id);
		return bean;
	}

	@Override
	public void insertZtgl(Ztgl bean){
		ztglDao.insert(bean);
	}
	
	@Override
	public void updateZtgl(Ztgl bean){
		ztglDao.update(bean);
	}
	
	@Override
	public void deleteZtgl(String id) {
		String[] ids=id.split(",");
		for(int i=0;i<ids.length;i++){
			ztglDao.delete(Integer.parseInt(ids[i]));
		}
	}

	@Transactional(readOnly=true)
	@Override
	public List<Ztgl> selectZtgl(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
	    params.put("pageModel", pageModel);

	    //根据prams取得所有数据
		int recordCount = ztglDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Ztgl> beans = ztglDao.select(params);
		
		return beans;
	}

}
