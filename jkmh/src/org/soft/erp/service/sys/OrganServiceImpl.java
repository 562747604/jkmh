package org.soft.erp.service.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.soft.erp.dao.SfieldDao;
import org.soft.erp.dao.sys.OrganDao;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.sys.Organ;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("organService")
public class OrganServiceImpl implements OrganService{
	
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
	private OrganDao organDao;

	@Transactional(readOnly=true)
	@Override
	public Organ editOrgan(Integer id){
		Organ bean = organDao.edit(id);
		return bean;
	}

	@Override
	public void insertOrgan(Organ bean){
		organDao.insert(bean);
	}
	
	@Override
	public void updateOrgan(Organ bean){
		organDao.update(bean);
	}
	
	@Override
	public void deleteOrgan(String id) {
		String[] ids=id.split(",");
		for(int i=0;i<ids.length;i++){
			organDao.delete(Integer.parseInt(ids[i]));
		}
	}

	@Transactional(readOnly=true)
	@Override
	public List<Organ> selectOrgan(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
	    params.put("pageModel", pageModel);

	    //根据prams取得所有数据
		int recordCount = organDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Organ> beans = organDao.select(params);
		
		return beans;
	}

	@Override
	public Organ getOrgan(String jgid) {
		Organ bean = organDao.get(jgid);
		return bean;
	}

	@Override
	public Organ selectByComapnyId(String companyId) {
		return organDao.selectByComapnyId(companyId);
	}
	
}
