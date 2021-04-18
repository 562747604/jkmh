package org.soft.erp.dao.sys;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.soft.erp.domain.Kvs;
import org.soft.erp.domain.sys.Organ;
import org.soft.erp.util.tag.PageModel;

import com.alibaba.fastjson.JSON;

/**   
 * @Description: 代码库SQL语句提供类
 * @author 	   
 * @date 2016年7月11日 上午11:19:23 
 * @version V1.0   
 */
public class OrganDaoImpl {
	String tblnameString="s_organ";
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
	public String insert(final Organ bean) {
		final SimpleDateFormat myFmt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		final Date now=new Date();
		String sql = new SQL() {
			{
				INSERT_INTO(tblnameString);
				if(bean.getCompanyId() != null && !bean.getCompanyId().equals("")){
					VALUES("companyId", "#{companyId}");
				}
				if(bean.getCompanyName() != null && !bean.getCompanyName().equals("")){
					VALUES("companyName", "#{companyName}");
				}
				if(bean.getCompanySName() != null && !bean.getCompanySName().equals("")){
					VALUES("companySName", "#{companySName}");
				}
				if(bean.getAddress() != null && !bean.getAddress().equals("")){
					VALUES("address", "#{address}");
				}
				if(bean.getMobile() != null && !bean.getMobile().equals("")){
					VALUES("mobile", "#{mobile}");
				}
				if(bean.getPostcode() != null && !bean.getPostcode().equals("")){
					VALUES("postcode", "#{postcode}");
				}
				if(bean.getEmail() != null && !bean.getEmail().equals("")){
					VALUES("email", "#{email}");
				}
				if(bean.getRemark() != null && !bean.getRemark().equals("")){
					VALUES("remark", "#{remark}");
				}
				if(bean.getCreator() != null && !bean.getCreator().equals("")){
					VALUES("creator", "#{creator}");
				}
				if(bean.getJcode() != null && !bean.getJcode().equals("")){
					VALUES("jcode", "#{jcode}");
				}
				if(bean.getFwsh() != null && !bean.getFwsh().equals("")){
					VALUES("fwsh", "#{fwsh}");
				}
				if(bean.getPgsh() != null && !bean.getPgsh().equals("")){
					VALUES("pgsh", "#{pgsh}");
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
	public String update(final Organ bean) {
		String sql = new SQL() {
			{
				UPDATE(tblnameString);
				if(bean.getCompanyId() != null){
					SET("companyId = #{companyId}");
				}
				if(bean.getCompanyName() != null){
					SET("companyName = #{companyName}");
				}
				if(bean.getCompanySName() != null){
					SET("companySName = #{companySName}");
				}
				if(bean.getAddress() != null){
					SET("address = #{address}");
				}
				if(bean.getMobile() != null){
					SET("mobile = #{mobile}");
				}
				if(bean.getPostcode() != null){
					SET("postcode = #{postcode}");
				}
				if(bean.getEmail() != null){
					SET("email = #{email}");
				}
				if(bean.getRemark() != null){
					SET("remark = #{remark}");
				}
				if(bean.getJcode() != null){
					SET("jcode = #{jcode}");
				}
				if(bean.getFwsh() != null){
					SET("fwsh = #{fwsh}");
				}
				if(bean.getPgsh() != null){
					SET("pgsh = #{pgsh}");
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

	// 动态更新
	public String get(String jgid) {
		String sql = new SQL() {
			{
				SELECT("*");
				FROM(tblnameString);
				WHERE("jcode = #{jgid} ");
			}
		}.toString();
		return sql;
	}

	// 动态更新
	public String selectByComapnyId(String companyId) {
		String sql = new SQL() {
			{
				SELECT("*");
				FROM(tblnameString);
				WHERE("companyId = #{companyId} ");
			}
		}.toString();
		return sql;
	}
}
