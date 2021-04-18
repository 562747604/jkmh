package org.soft.erp.service.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.soft.erp.dao.SfieldDao;
import org.soft.erp.dao.sys.GlyglDao;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.sys.Glygl;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("glyglService")
public class GlyglServiceImpl implements GlyglService{
	
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
	private GlyglDao glyglDao;

	@Transactional(readOnly=true)
	@Override
	public Glygl editGlygl(Integer id){
		Glygl bean = glyglDao.edit(id);
		return bean;
	}

	@Override
	public void insertGlygl(Glygl bean){
		glyglDao.insert(bean);
	}
	
	@Override
	public void updateGlygl(Glygl bean){
		glyglDao.update(bean);
	}
	
	@Override
	public void deleteGlygl(String id) {
		String[] ids=id.split(",");
		for(int i=0;i<ids.length;i++){
			glyglDao.delete(Integer.parseInt(ids[i]));
		}
	}

	@Transactional(readOnly=true)
	@Override
	public List<Glygl> selectGlygl(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
	    params.put("pageModel", pageModel);

	    //根据prams取得所有数据
		int recordCount = glyglDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Glygl> beans = glyglDao.select(params);
		
		return beans;
	}

}
