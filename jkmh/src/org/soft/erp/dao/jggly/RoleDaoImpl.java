package org.soft.erp.dao.jggly;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.soft.erp.domain.Kvs;
import org.soft.erp.domain.jggly.Role;
import org.soft.erp.util.tag.PageModel;

import com.alibaba.fastjson.JSON;

/**   
 * @Description: 代码库SQL语句提供类
 * @author 	   
 * @date 2016年7月11日 上午11:19:23 
 * @version V1.0   
 */
public class RoleDaoImpl {
	String tblnameString="s_rbac_role";
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
	public String insert(final Role bean) {
		final SimpleDateFormat myFmt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		final Date now=new Date();
		String sql = new SQL() {
			{
				INSERT_INTO(tblnameString);
				if(bean.getRole_id() != null && !bean.getRole_id().equals("")){
					VALUES("role_id", "#{role_id}");
				}
				if(bean.getMenu_power() != null && !bean.getMenu_power().equals("")){
					VALUES("menu_power", "#{menu_power}");
				}
				if(bean.getRole_name() != null && !bean.getRole_name().equals("")){
					VALUES("role_name", "#{role_name}");
				}
				if(bean.getBz() != null && !bean.getBz().equals("")){
					VALUES("bz", "#{bz}");
				}
				if(bean.getJtpye() != null && !bean.getJtpye().equals("")){
					VALUES("jtpye", "#{jtpye}");
				}
				if(bean.getJgid() != null && !bean.getJgid().equals("")){
					VALUES("jgid", "#{jgid}");
				}
				if(bean.getCreator() != null && !bean.getCreator().equals("")){
					VALUES("creator", "#{creator}");
				}
				VALUES("createDate", "'"+myFmt2.format(now)+"'");
			}
		}.toString();
		return sql;
	}

	// 动态更新
	public String update(final Role bean) {
		String sql = new SQL() {
			{
				UPDATE(tblnameString);
				if(bean.getRole_id() != null){
					SET("role_id = #{role_id}");
				}
				if(bean.getJgid() != null){
					SET("jgid = #{jgid}");
				}
				if(bean.getMenu_power() != null){
					SET("menu_power = #{menu_power}");
				}
				if(bean.getRole_name() != null){
					SET("role_name = #{role_name}");
				}
				if(bean.getBz() != null){
					SET("bz = #{bz}");
				}
				if(bean.getJtpye() != null){
					SET("jtpye = #{jtpye}");
				}
				if(bean.getCreator() != null){
					SET("creator = #{creator}");
				}
				if(bean.getCreate_date() != null){
					SET("createDate = #{createDate}");
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

	// 动态更新
	public String selectById(Integer id) {
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
	public String selectRoleByRole_id(String id) {
		id="'"+id.replace(",","','")+"'";
		String sql="select * from "+tblnameString+" where role_id in ("+id+")";
		return sql;
	}
}
