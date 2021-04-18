package org.soft.erp.dao.jkzj;

import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.soft.erp.domain.Kvs;
import org.soft.erp.domain.jggly.Ryfp;
import org.soft.erp.util.tag.PageModel;

import com.alibaba.fastjson.JSON;

/**   
 * @Description: 代码库SQL语句提供类
 * @author 	   
 * @date 2016年7月11日 上午11:19:23 
 * @version V1.0   
 */
public class WdpgDaoImpl {
	String tblnameString="s_tuser";
	// 分页动态查询
	public String select(final Map<String, Object> params) throws Exception {
		String sql = new SQL() {
			{
				PageModel pageModel = (PageModel) params.get("pageModel");
				SELECT(pageModel.getFieldString());
				FROM(tblnameString);
				String keyword = pageModel.getKeyword();
				WHERE(pageModel.getWhereStr());
				if (keyword != null && !keyword.equals("")) {
					keyword = URLDecoder.decode(keyword, "UTF-8");
					List<Kvs> listKvs = JSON.parseArray(keyword, Kvs.class);
					for (Kvs kvs : listKvs) {
						String enname = kvs.getEnname();
						String cnname = kvs.getCnname();// 注意：cnname临时作为value
						String type = kvs.getType();
						// System.out.println("kvs====" + kvs.getEnname() +
						// kvs.getCnname() + kvs.getType());
						// 日期类型
						if (type.equals("2")) {
							String csrq1 = cnname.substring(0,cnname.indexOf("|"));
							String csrq2 = cnname.substring(cnname.indexOf("|") + 1);
							WHERE(enname + " between '" + csrq1 + "'");
							WHERE(" '" + csrq2 + "'");
						} else {
							WHERE(enname + " LIKE '%" + cnname + "%'");
						}
					}
				}
			}
		}.toString();

		PageModel pageModel = (PageModel) params.get("pageModel");
		sql += " order by " + pageModel.getField() + " "
				+ pageModel.getSortOrder();
		sql += " limit #{pageModel.firstLimitParam},#{pageModel.pageSize}";

		//System.out.println("sql==" + sql);
		return sql;
	}

	// 动态查询总数量
	public String count(final Map<String, Object> params) throws Exception {
		String sql = new SQL() {
			{
				SELECT("count(*)");
				FROM(tblnameString);
				PageModel pageModel = (PageModel) params.get("pageModel");
				String keyword = pageModel.getKeyword();
				WHERE(pageModel.getWhereStr());
				if (keyword != null && !keyword.equals("")) {
					keyword = URLDecoder.decode(keyword, "UTF-8");
					List<Kvs> listKvs = JSON.parseArray(keyword, Kvs.class);
					for (Kvs kvs : listKvs) {
						String enname = kvs.getEnname();
						String cnname = kvs.getCnname();
						String type = kvs.getType();
						if (type.equals("2")) {
							String csrq1 = cnname.substring(0,cnname.indexOf("|"));
							String csrq2 = cnname.substring(cnname.indexOf("|") + 1);
							WHERE(enname + " between '" + csrq1 + "'");
							WHERE(" '" + csrq2 + "'");
						} else {
							WHERE(enname + " LIKE '%" + cnname + "%'");
						}
					}
				}
			}
		}.toString();
		return sql;
	}

	// 动态更新
	public String update(final Ryfp bean) {
		String sql = new SQL() {
			{
				UPDATE(tblnameString);
				if(bean.getZjid() != null){
					SET("zjid = #{zjid}");
				}
				if(bean.getZyid() != null){
					SET("zyid = #{zyid}");
				}
				if(bean.getZt() != null){
					SET("zt = #{zt}");
				}
				if(bean.getHy() != null){
					SET("hy = #{hy}");
				}
				if(bean.getYx() != null){
					SET("yx = #{yx}");
				}
				if(bean.getZdyx() != null){
					SET("zdyx = #{zdyx}");
				}
				if(bean.getZjname() != null){
					SET("zjname = #{zjname}");
				}
				if(bean.getZyname() != null){
					SET("zyname = #{zyname}");
				}
				WHERE(" id = #{id} ");
			}
		}.toString();

		return sql;
	}

	// 动态更新
	public String updateJkzj(final String id,final String zjid,final String zjname) {
		String sql = new SQL() {
			{
				UPDATE(tblnameString);
				if(zjid != ""){
					SET("zjid = '"+zjid+"'");
				}else{
					SET("zjid  = null");
				}
				if(zjname != ""){
					SET("zjname = '"+zjname+"'");
				}else{
					SET("zjname  = null");
				}
				SET("zjshzt  = null");
				WHERE(" id in (  "+id+" )");
			}
		}.toString();

		return sql;
	}
}
