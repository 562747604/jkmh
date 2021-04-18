package org.soft.erp.service.sys;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.jstl.sql.Result;

import org.soft.erp.dao.SfieldDao;
import org.soft.erp.domain.Sfield;
import org.soft.erp.util.common.ExcelUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service("sfieldService")
public class SfieldServiceImpl implements SfieldService {

	@Autowired
	private SfieldDao sfieldDao;

	@Transactional(readOnly = true)
	@Override
	public List<Sfield> selectByTablename(String tblname) {
		return sfieldDao.selectByTablename(tblname);
	}

	public List<String> selectHeadList(String tblName) {
		// 表头数据
		List<String> list = new ArrayList<String>();
		for (Sfield sfield : sfieldDao.selectByTablename(tblName)) {
			list.add(sfield.getChname());
		}
		return list;
	}

	public List<String> selectEnnameList(String tblName) {
		List<String> list = new ArrayList<String>();
		for (Sfield sfield : sfieldDao.selectByTablename(tblName)) {
			list.add(sfield.getEnname());
		}
		return list;
	}

	public List<String> selectCnnameList(String tblName) {
		List<String> list = new ArrayList<String>();
		for (Sfield sfield : sfieldDao.selectByTablename(tblName)) {
			list.add(sfield.getChname());
		}
		return list;
	}


	@Transactional(readOnly = true)
	@Override
	public Sfield selectByTblnameAndCnname(String tblname,String cnname) {
		return sfieldDao.selectByTblnameAndCnname(tblname,cnname);
	}

	
	
	/*
	 * tblName:表名
	 * headList:中文名,表头数据
	 * ennameList:英文名
	 * selectList:数据
	 */
	public void exportExcel(String filename,String tblName,List selectList) throws Exception {

		ExcelUtils.exportExcel(filename,tblName, selectHeadList(tblName), selectEnnameList(tblName), selectList);
	}	
	public void exportExcel1(String filename,String dcCnfields,String dcEnfields,List selectList) throws Exception {
		List<String> list = new ArrayList<String>();
		String[] tempStrings=dcEnfields.split(",");
		for(int i=0;i<tempStrings.length;i++){
			list.add(tempStrings[i]);
		}
		List<String> list1 = new ArrayList<String>();
		String[] tempStrings1=dcCnfields.split(",");
		for(int i=0;i<tempStrings1.length;i++){
			list1.add(tempStrings1[i]);
		}
		ExcelUtils.exportExcel(filename,"", list1, list, selectList);
	}	
	public void doTj(String filename,Result rs) throws Exception {

		ExcelUtils.doTj( filename,rs);
	}	
	/*
	 * tblName:表名
	 * headList:中文名,表头数据
	 * ennameList:英文名
	 * selectList:数据
	 */
	public void importExcel(List<Sfield>sfieldList,List<String> cnnameList,String xlsPath) throws Exception {
		ExcelUtils.importExcel(sfieldList,cnnameList,xlsPath);
	}

}
