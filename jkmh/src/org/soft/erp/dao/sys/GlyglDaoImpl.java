package org.soft.erp.dao.sys;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.jdbc.SQL;
import org.soft.erp.domain.Kvs;
import org.soft.erp.domain.sys.Glygl;
import org.soft.erp.util.tag.PageModel;

import com.alibaba.fastjson.JSON;

/**   
 * @Description: 代码库SQL语句提供类
 * @author 	   
 * @date 2016年7月11日 上午11:19:23 
 * @version V1.0   
 */
public class GlyglDaoImpl {
	String tblnameString="s_rbac_user";
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
	public String insert(final Glygl bean) {
		final SimpleDateFormat myFmt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		final Date now=new Date();
		String sql = new SQL() {
			{
				INSERT_INTO(tblnameString);
				if(bean.getLoginname() != null && !bean.getLoginname().equals("")){
					VALUES("loginname", "#{loginname}");
				}
				if(bean.getPassword() != null && !bean.getPassword().equals("")){
					VALUES("password", "#{password}");
				}
				if(bean.getXm() != null && !bean.getXm().equals("")){
					VALUES("xm", "#{xm}");
				}
				if(bean.getSfzh() != null && !bean.getSfzh().equals("")){
					VALUES("sfzh", "#{sfzh}");
				}
				if(bean.getSjh() != null && !bean.getSjh().equals("")){
					VALUES("sjh", "#{sjh}");
				}
				if(bean.getYx() != null && !bean.getYx().equals("")){
					VALUES("yx", "#{yx}");
				}
				if(bean.getCreator() != null && !bean.getCreator().equals("")){
					VALUES("creator", "#{creator}");
				}
				if(bean.getXb() != null && !bean.getXb().equals("")){
					VALUES("xb", "#{xb}");
				}
				if(bean.getCsrq() != null && !bean.getCsrq().equals("")){
					VALUES("csrq", "#{csrq}");
				}
				if(bean.getJgid() != null && !bean.getJgid().equals("")){
					VALUES("jgid", "#{jgid}");
				}
				if(bean.getRoles() != null && !bean.getRoles().equals("")){
					VALUES("roles", "#{roles}");
				}
				if(bean.getOrganid() != null && !bean.getOrganid().equals("")){
					VALUES("organid", "#{organid}");
				}
				if(bean.getTxPath() != null && !bean.getTxPath().equals("")){
					VALUES("txPath", "#{txPath}");
				}
				if(bean.getJgbm() != null && !bean.getJgbm().equals("")){
					VALUES("jgbm", "#{jgbm}");
				}
				VALUES("createDate", "'"+myFmt2.format(now)+"'");
			}
		}.toString();
		return sql;
	}

	// 动态更新
	public String update(final Glygl bean) {
		String sql = new SQL() {
			{
				UPDATE(tblnameString);
				if(bean.getLoginname() != null){
					SET("loginname = #{loginname}");
				}
				if(bean.getJgid() != null){
					SET("jgid = #{jgid}");
				}
				if(bean.getPassword() != null && !bean.getPassword().equals("")){
					SET("password = #{password}");
				}
				if(bean.getXm() != null){
					SET("xm = #{xm}");
				}
				if(bean.getSfzh() != null){
					SET("sfzh = #{sfzh}");
				}
				if(bean.getSjh() != null){
					SET("sjh = #{sjh}");
				}
				if(bean.getYx() != null){
					SET("yx = #{yx}");
				}
				if(bean.getXb() != null){
					SET("xb = #{xb}");
				}
				if(bean.getCsrq() != null){
					SET("csrq = #{csrq}");
				}
				if(bean.getRoles() != null){
					SET("roles = #{roles}");
				}
				if(bean.getOrganid() != null){
					SET("organid = #{organid}");
				}
				if(bean.getJgbm() != null){
					SET("jgbm = #{jgbm}");
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
