package org.soft.erp.dao.sys;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.soft.erp.domain.sys.Menu;

import static org.soft.erp.util.common.ErpConstants.MENU_TABLE;;

/**   
 * @Description: 用户动态SQL语句提供类
 * @author 	   
 * @date 2016年7月11日 上午11:19:23 
 * @version V1.0   
 */
public class MenuDaoImpl {


	
	// 动态插入
	public String insertUser(final Menu menu){
		
		return new SQL(){
			{
				INSERT_INTO(MENU_TABLE);

			}
		}.toString();
	}
	// 动态更新
		public String updateUser(final Menu menu){
			
			return new SQL(){
				{
					UPDATE(MENU_TABLE);

//					if(menu.getStatus()!= null){
//						SET(" status = #{status} ");
//					}
//					if(menu.getCreateDate()!= null){
//						SET(" create_date = #{createDate} ");
//					}
					WHERE(" id = #{id} ");
				}
			}.toString();
		}
		
	public String selectAllUsers(final Map<String, Object> params,String rp,String pageString,String qtype,String sortorder){
		
		int firstLimitParam = Integer.parseInt(rp)*(Integer.parseInt(pageString)-1);
		
		String sql =  new SQL(){
			{
				SELECT("*");
				FROM(MENU_TABLE);
				if(params.get("menu") != null){
					Menu menu = (Menu)params.get("menu");
//					WHERE("  username LIKE CONCAT ('%',#{menu.username},'%') ");
					
				}
			}
		}.toString();
		
		sql += " order by "+ qtype + " "+ sortorder;
		sql += " limit "+ firstLimitParam+","+rp;
		//System.out.println("sql=="+sql);

		return sql;		
	}

	public String selectAll(final Map<String, Object> params,String pageString){
		
		//System.out.println("params=="+params);
		//System.out.println("pageString=="+pageString);

			
		String sql =  new SQL(){
			{
				SELECT("*");
				FROM(MENU_TABLE);
				if(params.get("menu") != null){
					Menu menu = (Menu)params.get("menu");
//					WHERE("  username LIKE CONCAT ('%',#{menu.username},'%') ");
					
				}
			}
		}.toString();

		//System.out.println("sql=="+sql);

		return sql;		
		
		
	}	
		
		
		
		
}
