package org.soft.erp.dao.provider;

import org.apache.ibatis.jdbc.SQL;
import org.soft.erp.domain.Xszdsz;

/**   
 * @Description: 用户动态SQL语句提供类
 * @author 	   
 * @date 2016年7月11日 上午11:19:23 
 * @version V1.0   
 */
public class XszdszDaoImpl {

	// 动态插入
	public String insert(final Xszdsz xszdsz){
		
		return new SQL(){
			{
				INSERT_INTO("d_xszdsz");
				if(xszdsz.getUid() != null && !xszdsz.getUid().equals("")){
					VALUES("uid", "#{uid}");
				}
				if(xszdsz.getField() != null && !xszdsz.getField().equals("")){
					VALUES("field", "#{field}");
				}
				if(xszdsz.getXh() != null && !xszdsz.getXh().equals("")){
					VALUES("xh", "#{xh}");
				}
				if(xszdsz.getTblname() != null && !xszdsz.getTblname().equals("")){
					VALUES("tblname", "#{tblname}");
				}

			}
		}.toString();
	}
	// 动态更新
		public String update(final Xszdsz xszdsz){
			
			return new SQL(){
				{
					UPDATE("d_xszdsz");
//					if(xszdsz.getUid() != null){
//						SET(" uid = #{uid} ");
//					}
					if(xszdsz.getField() != null){
						SET(" field = #{field} ");
					}
//					if(xszdsz.getXh() != null){
//						SET(" xh = #{xh} ");
//					}
//					if(xszdsz.getTblname() != null){
//						SET(" tblname = #{tblname} ");
//					}

					WHERE(" id = #{id} ");
				}
			}.toString();
		}
		
		
}
