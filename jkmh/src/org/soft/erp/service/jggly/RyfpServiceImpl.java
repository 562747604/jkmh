package org.soft.erp.service.jggly;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.soft.erp.dao.SfieldDao;
import org.soft.erp.dao.jggly.RyfpDao;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jggly.QJkzjQueue;
import org.soft.erp.domain.jggly.QJkzyQueue;
import org.soft.erp.domain.jggly.QTjyhQueue;
import org.soft.erp.domain.jggly.Ryfp;
import org.soft.erp.domain.jggly.User;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("ryfpService")
public class RyfpServiceImpl implements RyfpService{
	
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
	private RyfpDao ryfpDao;
	
	@Override
	public void insertRyfp(Ryfp bean){
		ryfpDao.insert(bean);
	}
	
	@Transactional(readOnly=true)
	@Override
	public Ryfp editRyfp(Integer id){
		Ryfp bean = ryfpDao.edit(id);
		return bean;
	}

	@Override
	public void updateRyfp(Ryfp bean){
		ryfpDao.update(bean);
	}
	
	@Override
	public void deleteRyfp(String id) {
		String[] ids=id.split(",");
		for(int i=0;i<ids.length;i++){
			ryfpDao.delete(Integer.parseInt(ids[i]));
		}
	}

	@Transactional(readOnly=true)
	@Override
	public List<Ryfp> selectRyfp(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
	    params.put("pageModel", pageModel);

	    //根据prams取得所有数据
		int recordCount = ryfpDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Ryfp> beans = ryfpDao.select(params);
		
		return beans;
	}
	
	
	//取得所有体检用户
	@Transactional(readOnly=true)
	@Override	
	public List<Ryfp> selectRyfps(){
        //System.out.println("sssssssssssssss");

		
		return ryfpDao.selectAllTjyhs();
//        return null;

	}
	
	@Transactional(readOnly=true)
	@Override	
	public  Ryfp  selectByuid(String uid,String jgid){
         
		return ryfpDao.selectByuid(uid,jgid);
//        return null;

	}
 
	/*
	 * 根据体检号手机号取得体检用户
	 * @see org.soft.erp.service.jggly.RyfpService#selectRyfpByTjhAndMobile(java.lang.String, java.lang.String)
	 */
	@Transactional(readOnly=true)
	@Override	
	public Ryfp selectRyfpByTjhAndMobile(String tjh,String mobile){
		return ryfpDao.selectByTjhAndMobile(tjh,mobile);

	}

	
	//////////////////////////////////////////////////////////////
	/*
	 * 初始化,获取体检用户后分配健康专家和健康专员
	 */
	@Override	
	public void initRyfp(List<User> users, List<Ryfp> ryfps) {

		QJkzjQueue.getInstance().putAll(users);
		QJkzyQueue.getInstance().putAll(users);
		QTjyhQueue.getInstance().putAll(ryfps);

		QTjyhQueue.getInstance();
		int taskSize = QTjyhQueue.getSize();
//		System.out.println("QTjyhQueue.getSize()===" + taskSize);

		for (int i = 0; i < taskSize; i++) {
			Ryfp ryfp = (Ryfp) QTjyhQueue.getInstance().take();
			User jkzj = (User) QJkzjQueue.getInstance().takeNext();
			User jkzy = (User) QJkzyQueue.getInstance().takeNext();

			ryfp.setZjname(jkzj.getLoginname());// 健康专家
			ryfp.setZyname(jkzy.getLoginname());// 健康专员
			ryfp.setZjid(jkzj.getId());// 健康专家
			ryfp.setZyid(jkzy.getId());// 健康专员
			updateRyfp(ryfp);
			
			QJkzjQueue.getInstance().put(jkzj);//放入队尾
			QJkzyQueue.getInstance().put(jkzy);//放入队尾
		}
	}

	/*
	 * 新增体检用户后，分配健康专家和健康专员
	 */
	@Override	
	public void singleRyfp(Ryfp ryfp) {
		QTjyhQueue.getInstance().put(ryfp);
		ryfp = (Ryfp) QTjyhQueue.getInstance().take();
		User jkzj = (User) QJkzjQueue.getInstance().takeNext();
		User jkzy = (User) QJkzyQueue.getInstance().takeNext();

		ryfp.setZjname(jkzj.getLoginname());// 健康专家
		ryfp.setZyname(jkzy.getLoginname());// 健康专员
		updateRyfp(ryfp);
		
		QJkzjQueue.getInstance().put(jkzj);//放入队尾
		QJkzyQueue.getInstance().put(jkzy);//放入队尾
	}	
	
	
	
	

}
