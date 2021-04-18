package org.soft.erp.service.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.soft.erp.dao.SfieldDao;
import org.soft.erp.dao.sys.JgglyglDao;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jggly.Gly;
import org.soft.erp.domain.sys.Jgglygl;
import org.soft.erp.domain.sys.Organ;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("JgglyglService")
public class JgglyglServiceImpl implements JgglyglService{
	
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
	private JgglyglDao JgglyglDao;

	@Transactional(readOnly=true)
	@Override
	public Gly editJgglygl(Integer id){
		Gly bean = JgglyglDao.edit(id);
		return bean;
	}

	@Override
	public void insertJgglygl(Gly bean){
		JgglyglDao.insert(bean);
	}
	
	@Override
	public void updateJgglygl(Gly bean){
		JgglyglDao.update(bean);
	}
	
	@Override
	public void deleteJgglygl(String id) {
		String[] ids=id.split(",");
		for(int i=0;i<ids.length;i++){
			JgglyglDao.delete(Integer.parseInt(ids[i]));
		}
	}

	@Transactional(readOnly=true)
	@Override
	public List<Gly> selectJgglygl(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
	    params.put("pageModel", pageModel);

	    //根据prams取得所有数据
		int recordCount = JgglyglDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Gly> beans = JgglyglDao.select(params);
		
		return beans;
	}

	@Override
	public String getJg(String jcode) {
		String reString="";
		List<Organ> beans=JgglyglDao.getJg();
		reString="<option value=''>机构代码</option>";
		for(int i=0;i<beans.size();i++){
			if(reString.equals("")){
				if(beans.get(i).getJcode().equals(jcode)){
					reString+="<option value='"+beans.get(i).getJcode()+"' selected='selected'>"+beans.get(i).getCompanyName()+"</option>";
				}else{
					reString+="<option value='"+beans.get(i).getJcode()+"'>"+beans.get(i).getCompanyName()+"</option>";
				}
			}else{
				if(beans.get(i).getJcode().equals(jcode)){
					reString+="<option value='"+beans.get(i).getJcode()+"' selected='selected'>"+beans.get(i).getCompanyName()+"</option>";
				}else{
					reString+="<option value='"+beans.get(i).getJcode()+"'>"+beans.get(i).getCompanyName()+"</option>";
				}
			}
		}
		return reString;
	}

}
