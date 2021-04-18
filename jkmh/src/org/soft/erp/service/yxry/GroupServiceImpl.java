package org.soft.erp.service.yxry;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.soft.erp.dao.SfieldDao;
import org.soft.erp.dao.yxry.GroupDao;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.yxry.Group;
import org.soft.erp.domain.sys.Organ;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("groupService")
public class GroupServiceImpl implements GroupService{
	
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
	private GroupDao GroupDao;

	@Transactional(readOnly=true)
	@Override
	public Group editGroup(Integer id){
		Group bean = GroupDao.edit(id);
		return bean;
	}

	@Override
	public void insertGroup(Group bean){
		GroupDao.insert(bean);
	}
	
	@Override
	public void updateGroup(Group bean){
		GroupDao.update(bean);
	}
	
	@Override
	public void deleteGroup(String id) {
		String[] ids=id.split(",");
		for(int i=0;i<ids.length;i++){
			GroupDao.delete(Integer.parseInt(ids[i]));
		}
	}

	@Transactional(readOnly=true)
	@Override
	public List<Group> selectGroup(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
	    params.put("pageModel", pageModel);

	    //根据prams取得所有数据
		int recordCount = GroupDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Group> beans = GroupDao.select(params);
		
		return beans;
	}
}
