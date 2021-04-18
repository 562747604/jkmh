package org.soft.erp.service.sys;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.jstl.sql.Result;

import org.soft.erp.dao.SfieldDao;
import org.soft.erp.dao.sys.SearchColumnDao;
import org.soft.erp.dao.sys.SelectColumnDao;
import org.soft.erp.domain.Kvs;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.jggly.User;
import org.soft.erp.domain.sys.SearchColumn;
import org.soft.erp.domain.sys.ToggleColumn;
import org.soft.erp.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service("columnService")
public class ColumnServiceImpl implements ColumnService {
	/*

	 * 显示字段
	 */
	@Autowired
	private SearchColumnDao searchColumnDao; 
	@Autowired
	private SfieldDao sfieldDao;

	@Autowired
	private BaseService baseService;
	
	@Autowired
	private SelectColumnDao selectColumnDao;

	/*
	 * 取得当前用户的toggleColumnJson
	 */
	@Override
	public String getCurrentToggleColumnJson1(String uid,String tblname,String name,String mid,String jgid){
		ToggleColumn toggleColumn = selectColumnDao.selectById(uid,name,jgid);
		
		String x=toggleColumn.getField();
		String[] xsStrings=x.replace("[", "").replace("]", "").replace("\"", "").split(",");
		List<Sfield> list = sfieldDao.selectByTablenameAndIsSys1(tblname,"%|"+name+"|%");
		List<HashMap<String, Object>> list1 = new ArrayList<HashMap<String, Object>>();
		boolean status=false;
		for (Sfield sf : list) {
			status=false;
			HashMap<String, Object> hm = new HashMap<String, Object>();
			hm.put("field", sf.getEnname());
			hm.put("title", sf.getChname());
			hm.put("sortable", true);
			hm.put("align", "center");
			for(int i=0;i<xsStrings.length;i++){
				if(xsStrings[i].equals(sf.getEnname())||x==null||x.equals("")){
					hm.put("visible", true);
					status=true;break;
				}
			}
			if(!status){
				hm.put("visible", false);
			}

			list1.add(hm);

		}
		String str = JSON.toJSONString(list1).substring(1);
		str = str.substring(0, str.length() - 1);

		return str;

	}
	@Transactional(readOnly = true)
	@Override
	public String getCurrentSearchColumnJson1(String uid, String tblname, String name,String whString,String jgid,String mid) {
		List<Sfield> list = sfieldDao.selectByTablenameAndKjtypeTbl(tblname,"%|"+name+"|%");
		for (Sfield sf : list) {
			if (getSearchColumnJson1( uid,  tblname, name, whString, jgid,mid).contains(sf.getEnname())) {
				sf.setSearchStatus("true");
			} else {
				sf.setSearchStatus("false");
			}
		}
		String str = JSON.toJSONString(list);
		return str;
	}
	@Override	
	public String getSearchColumnJson1(String uid, String tblname,String name,String whString,String jgid,String mid) {
		SearchColumn searchColumn = searchColumnDao.selectByUidAndTblname(uid,name,jgid);
		//		System.out.println("searchColumn=="+searchColumn);
		

		ArrayList<Kvs> list = new ArrayList<Kvs>();
		String fields = searchColumn.getField();

		JSONArray array = JSON.parseArray(fields);  
		for(int i=0;i<array.size();i++){
			String enname = array.getString(i);
			Sfield sfield = sfieldDao.selectByTblnameAndEnname(tblname,enname);
			String kjtype = sfield.getKjtype()+"";
			String cnname = sfield.getChname();
			Kvs kvs = new Kvs();
			String sql="";
			Result rSet=null;
			if((sfield.getKjtype()+"").equals("3")){
				HashMap<String,String> map1 = new HashMap<String,String>();
				if(sfield.getIsgroup().equals("是")){
					if(sfield.getDytblname().equals("s_codebase")){
						whString="";
					}else{
						whString+=" and jgid='"+jgid+"'";
					}
					sql="select "+sfield.getDyfield()+" from "+sfield.getDytblname()+" where 1=1 "+whString+" group by "+sfield.getDyfield()+" order by "+sfield.getDyfield();
					rSet=baseService.query(sql);
					for(int h=0;h<rSet.getRowCount();h++){
						Map row = rSet.getRows()[h];
						map1.put(row.get(sfield.getDyfield())+"", row.get(sfield.getDyfield())+"");	
					}
				}else if(sfield.getDytblname().equals("s_codebase")){
					sql="select cvalue,cname from s_codebase where 1=1 and "+sfield.getDyfield()+"='"+sfield.getDyvalue()+"' order by cvalue";
					rSet=baseService.query(sql);
					for(int h=0;h<rSet.getRowCount();h++){
						Map row = rSet.getRows()[h];
						map1.put(row.get("cvalue")+"", row.get("cname")+"");	
					}
				}else{
					if(sfield.getDytblname().equals("s_codebase")){
						whString="";
					}else{
						whString+=" and jgid='"+jgid+"' ";
					}
					sql="select "+sfield.getDyvalue()+","+sfield.getDyfield()+" from "+sfield.getDytblname()+" where 1=1 "+whString+"  order by "+sfield.getDyfield();				
					rSet=baseService.query(sql);
					for(int h=0;h<rSet.getRowCount();h++){
						Map row = rSet.getRows()[h];
						map1.put(row.get(sfield.getDyvalue())+"", row.get(sfield.getDyfield())+"");	
					}
				}				
				kvs.setMap(map1);
			}	
			kvs.setEnname(enname);
			kvs.setCnname(cnname);
			kvs.setType(kjtype);
			list.add(kvs);
		}
		String str = JSON.toJSON(list).toString();
		return str;
	}
}
