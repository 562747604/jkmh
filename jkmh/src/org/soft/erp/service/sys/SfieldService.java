package org.soft.erp.service.sys;

import java.util.List;

import javax.servlet.jsp.jstl.sql.Result;

import org.soft.erp.domain.Sfield;

public interface SfieldService {
	/**
	 * 超级管理员-机构管理
	 * */

	public List<Sfield> selectByTablename(String tblname);
	public List<String> selectHeadList(String tblName);
	public List<String> selectEnnameList(String tblName);
	public List<String> selectCnnameList(String tblName);
	
	/*
	 * tblName:表名
	 * headList:中文名,表头数据
	 * ennameList:英文名
	 * selectList:数据
	 */
	public void exportExcel(String fileName,String tblName,List selectList) throws Exception;
	public void exportExcel1(String fileName,String dcCnfields,String dcEnfields,List selectList) throws Exception;
	public void importExcel(List<Sfield>sfieldList,List<String> cnnameList,String xlsPath) throws Exception;
	public Sfield selectByTblnameAndCnname(String tblname,String cnname) ;
	public void doTj(String filename,Result rs) throws Exception;
}
