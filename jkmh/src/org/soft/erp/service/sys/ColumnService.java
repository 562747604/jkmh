package org.soft.erp.service.sys;

import java.util.List;

import org.soft.erp.domain.Sfield;

public interface ColumnService{


	public String getCurrentToggleColumnJson1(String uid,String tblname,String name,String mid, String jgid);
	public String getSearchColumnJson1(String uid,String tblname,String name,String whereString,String jgid,String mid);
	public String getCurrentSearchColumnJson1(String uid,String tblname,String name,String whereString,String jgid,String mid);
}
