package org.soft.erp.service.jkzj;

import java.util.List;

import javax.servlet.jsp.jstl.sql.Result;

import org.soft.erp.domain.jggly.Ryfp;
import org.soft.erp.domain.jkzj.StatInfo;
import org.soft.erp.util.tag.PageModel;

public interface PgywService{

//	public List getGuideDatas(String uid ) throws Exception ;
//
//	public List getHealthDatas(String uid ) throws Exception ;
	public void updatePgyw(Ryfp bean);
	public List<Ryfp> selectPgyw(PageModel pageModel);
	public void updateJkzj(String id,String zjid,String zjname,String zc);
	public void updateJkzj1(String id,String zyid,String zyname,String zc);
	public void updateJkzjzt(String id);
	public void addFc(String id,String zjid,String zjname,Result rs);
	
	
	//阳性统计
//	public List<StatInfo> getCompanyStatsinfo(YxtjCondition yc) throws Exception;
	
	public String getYxtjLegendStr(List<StatInfo> statInfo);
	public String getYxtjListJson(List<StatInfo> statInfo);
	
	public void exportYxtjExcel(String pathName,List<StatInfo> statInfoList) throws Exception;

	
	//根据机构和专家取得体检用户列表
	public List<Ryfp> selectByJgidAndZjid(String jgid,int zjid);
	
	//根据机构和专家取得体检用户列表-已审核
	public List<Ryfp> selectYshByJgidAndZjid(String jgid,int zjid);
	
	//根据机构取得体检用户列表-已审核
	public List<Ryfp> selectYshByJgid(String jgid);
	
}
