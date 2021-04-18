package org.soft.erp.dao.sys;

import static org.soft.erp.util.common.ErpConstants.SEARCH_COLUMN_TABLE;

import org.apache.ibatis.jdbc.SQL;
import org.soft.erp.domain.sys.SearchColumn;

/**   
 * @Description: 
 * @author 	   
 * @date 2016年7月11日 上午11:19:23 
 * @version V1.0   
 */
public class SearchColumnDaoImpl {


	// 动态更新
	public String selectById(Integer id,String uid,String tblname) {
		String sql = new SQL() {
			{
				SELECT("*");
				FROM(SEARCH_COLUMN_TABLE);
				WHERE(" id = #{id}");
			}
		}.toString();
		return sql;
	}
	
	
	// 动态更新
	public String update(final SearchColumn bean){
		String sql = new SQL() {
			{
				UPDATE(SEARCH_COLUMN_TABLE);
				if(bean.getField() != null){
					SET("field = #{field}");
				}
				WHERE(" uid = #{uid} ");
				WHERE(" tblname = #{tblname} ");
			}
		}.toString();
//		System.out.println("sql==" + sql);

		return sql;
	}
	
	// 动态插入
	public String insert(final SearchColumn bean){
		
		String sql = new SQL() {
			{
				INSERT_INTO(SEARCH_COLUMN_TABLE);
				if(bean.getUid() != null && !bean.getUid().equals("")){
					VALUES("uid", "#{uid}");
				}
				if(bean.getTblname() != null && !bean.getTblname().equals("")){
					VALUES("tblname", "#{tblname}");
				}
				if(bean.getField() != null && !bean.getField().equals("")){
					VALUES("field", "#{field}");
				}
				if(bean.getJgid() != null && !bean.getJgid().equals("")){
					VALUES("jgid", "#{jgid}");
				}else{
					VALUES("jgid", "''");
				}
			}
		}.toString();
		
		return sql;
	}
	

	
	
}
