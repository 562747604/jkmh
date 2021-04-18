package org.soft.erp.service.jggly;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.soft.erp.dao.SfieldDao;
import org.soft.erp.dao.jggly.JielunciDao;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jggly.Jielunci;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("jielunciService")
public class JielunciServiceImpl implements JielunciService{
	
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
	private JielunciDao jielunciDao;

	@Transactional(readOnly=true)
	@Override
	public Jielunci editJielunci(Integer id){
		Jielunci bean = jielunciDao.edit(id);
		return bean;
	}

	@Override
	public void insertJielunci(Jielunci bean){
		jielunciDao.insert(bean);
	}
	
	@Override
	public void updateJielunci(Jielunci bean){
		jielunciDao.update(bean);
	}
	
	@Override
	public void deleteJielunci(String id) {
		String[] ids=id.split(",");
		for(int i=0;i<ids.length;i++){
			jielunciDao.delete(Integer.parseInt(ids[i]));
		}
	}

	@Transactional(readOnly=true)
	@Override
	public List<Jielunci> selectJielunci(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
	    params.put("pageModel", pageModel);

	    //根据prams取得所有数据
		int recordCount = jielunciDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Jielunci> beans = jielunciDao.select(params);
		
		return beans;
	}
	
}
