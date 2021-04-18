package org.soft.erp.dao;


/**   
 * @Description: 代码库SQL语句提供类
 * @author 	   
 * @date 2016年7月11日 上午11:19:23 
 * @version V1.0   
 */
public class baseDaoImpl {

	public String getOption(final String tblname,final String value,final String text,final String order,final String group,final String where) throws Exception {
		String sql="select "+value+","+text+" from "+tblname +" where 1=1 "+where ;
		if(!group.equals("")){
			sql+=" group by "+group+ " ";
		}
		if(!order.equals("")){
			sql+=" order by "+order+ " ";
		}
		return sql;
	}
	
	public String getOptionToCode(final String ctype) throws Exception {
		String sql="select * from s_codebase where ctype='"+ctype+"' order by cvalue" ;
		return sql;
	}
}
