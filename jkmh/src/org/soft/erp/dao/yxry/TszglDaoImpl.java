package org.soft.erp.dao.yxry;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.soft.erp.domain.Kvs;
import org.soft.erp.domain.jkzy.Jkfw;
import org.soft.erp.util.tag.PageModel;

import com.alibaba.fastjson.JSON;

/**   
 * @Description: 代码库SQL语句提供类
 * @author 	   
 * @date 2016年7月11日 上午11:19:23 
 * @version V1.0   
 */
public class TszglDaoImpl {
	String tblnameString="d_group";
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

	// 动态插入
	public String insert(final Jkfw bean) {
		final SimpleDateFormat myFmt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		final Date now=new Date();
		String sql = new SQL() {
			{
				INSERT_INTO(tblnameString);
				if(bean.getJgid() != null && !bean.getJgid().equals("")){
					VALUES("jgid", "#{jgid}");
				}
				if(bean.getCreator() != null && !bean.getCreator().equals("")){
					VALUES("creator", "#{creator}");
				}
				if(bean.getLx() != null && !bean.getLx().equals("")){
					VALUES("lx", "#{lx}");
				}
				if(bean.getMc() != null && !bean.getMc().equals("")){
					VALUES("mc", "#{mc}");
				}
				if(bean.getSfkj() != null && !bean.getSfkj().equals("")){
					VALUES("sfkj", "#{sfkj}");
				}
				if(bean.getSm() != null && !bean.getSm().equals("")){
					VALUES("sm", "#{sm}");
				}
				VALUES("createtime", "'"+myFmt2.format(now)+"'");
			}
		}.toString();
		return sql;
	}

	// 动态更新
	public String update(final Jkfw bean) {
		String sql = new SQL() {
			{
				UPDATE(tblnameString);
				if(bean.getLx() != null){
					SET("lx = #{lx}");
				}
				if(bean.getJgid() != null){
					SET("jgid = #{jgid}");
				}
				if(bean.getMc() != null){
					SET("mc = #{mc}");
				}
				if(bean.getSfkj() != null){
					SET("sfkj = #{sfkj}");
				}
				if(bean.getSm() != null){
					SET("sm = #{sm}");
				}
				WHERE(" id = #{id} ");
			}
		}.toString();

		return sql;
	}

	// 动态更新
	public String edit(Integer id) {
		String sql = new SQL() {
			{
				SELECT("*");
				FROM(tblnameString);
				WHERE("id = #{id} ");
			}
		}.toString();
		return sql;
	}

	// 动态更新
	public String delete(Integer id) {
		String sql = new SQL() {
			{
				DELETE_FROM(tblnameString);
				WHERE("id = #{id} ");
			}
		}.toString();
		return sql;
	}
}
