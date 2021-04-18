package org.soft.erp.dao.jggly;

import static org.soft.erp.util.common.ErpConstants.USER_TABLE;

import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.soft.erp.domain.Kvs;
import org.soft.erp.domain.jggly.Ryfp;
import org.soft.erp.domain.jggly.User;
import org.soft.erp.util.tag.PageModel;

import com.alibaba.fastjson.JSON;

/**   
 * @Description: 代码库SQL语句提供类
 * @author 	   
 * @date 2016年7月11日 上午11:19:23 
 * @version V1.0   
 */
public class RyfpDaoImpl {
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
		if(pageModel.getField()!=null&&pageModel.getSortOrder()!=null){
		sql += " order by " + pageModel.getField() + " "
				+ pageModel.getSortOrder();		
		}
		sql += " limit #{pageModel.firstLimitParam},#{pageModel.pageSize}";

		//System.out.println("sql==" + sql);
		return sql;
	}
    
	public String selectByuid(final String uid,final String jgid) throws Exception {		
		String sql = new SQL() {
			{
				SELECT("*");
				FROM(tblnameString);
				WHERE(" uid='"+uid+"' and jgid='"+jgid+"'");
			}
		}.toString();
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
				if(bean.getRealname() != null){
					SET("realname = #{realname}");
				}
				if(bean.getMobile() != null){
					SET("mobile = #{mobile}");
				}
				if(bean.getTjh() != null){
					SET("tjh = #{tjh}");
				}
				if(bean.getXb() != null){
					SET("xb = #{xb}");
				}
				if(bean.getSfzh() != null){
					SET("sfzh = #{sfzh}");
				}
				if(bean.getEmail() != null){
					SET("email = #{email}");
				}
				if(bean.getCsrq() != null){
					SET("csrq = #{csrq}");
				}
				if(bean.getfUpdatedTime() != null){
					SET("fUpdatedTime = #{fUpdatedTime}");
				}
				if(bean.getfBirthplace() != null){
					SET("fBirthplace = #{fBirthplace}");
				}
				if(bean.getfPhone() != null){
					SET("fPhone = #{fPhone}");
				}
				if(bean.getJobtitle()!= null){
					SET("jobtitle = #{jobtitle}");
				}
				if(bean.getZyjobtitle()!= null){
					SET("zyjobtitle = #{zyjobtitle}");
				}
				if(bean.getFwzt() != null){
					SET("fwzt = #{fwzt}");
				}
				if(bean.getZjshzt() != null){
					SET("zjshzt = #{zjshzt}");
				}
				if(bean.getDw() != null){
					SET("dw = #{dw}");
				}
				if(bean.getNl() != null){
					SET("nl = #{nl}");
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
	

	// 动态插入
	public String insert(final Ryfp bean) {
		String sql = new SQL() {
			{				
				INSERT_INTO(tblnameString);
				if(bean.getTjh() != null && !bean.getTjh().equals("")){
					VALUES("tjh", "#{tjh}");
				}
				if(bean.getSfzh() != null && !bean.getSfzh().equals("")){
					VALUES("sfzh", "#{sfzh}");
				}
				if(bean.getRealname() != null && !bean.getRealname().equals("")){
					VALUES("realname", "#{realname}");
				}
				if(bean.getXb() != null && !bean.getXb().equals("")){
					VALUES("xb", "#{xb}");
				}
				if(bean.getMobile() != null && !bean.getMobile().equals("")){
					VALUES("mobile", "#{mobile}");
				}
				if(bean.getCsrq() != null && !bean.getCsrq().equals("")){
					VALUES("csrq", "#{csrq}");
				}

				if(bean.getfBirthplace() != null && !bean.getfBirthplace().equals("")){
					VALUES("fBirthplace", "#{fBirthplace}");
				}
				if(bean.getfCreatedTime() != null && !bean.getfCreatedTime().equals("")){
					VALUES("fCreatedTime", "#{fCreatedTime}");
				}
				if(bean.getfUpdatedTime() != null && !bean.getfUpdatedTime().equals("")){
					VALUES("fUpdatedTime", "#{fUpdatedTime}");
				}
				if(bean.getfPhone() != null && !bean.getfPhone().equals("")){
					VALUES("fPhone", "#{fPhone}");
				}
				
				if(bean.getJgid() != null && !bean.getJgid().equals("")){
					VALUES("jgid", "#{jgid}");
				}
				if(bean.getJtime() != null && !bean.getJtime().equals("")){
					VALUES("jtime", "#{jtime}");
				}
				if(bean.getUid() != null && !bean.getUid().equals("")){
					VALUES("uid", "#{uid}");
				}
				if(bean.getZjid() != null && !bean.getZjid().equals("")){
					VALUES("zjid", "#{zjid}");
				}
				if(bean.getZjname() != null && !bean.getZjname().equals("")){
					VALUES("zjname", "#{zjname}");
				}
				if(bean.getZyid() != null && !bean.getZyid().equals("")){
					VALUES("zyid", "#{zyid}");
				}
				if(bean.getZyname() != null && !bean.getZyname().equals("")){
					VALUES("zyname", "#{zyname}");
				}
				if(bean.getJobtitle()  != null && !bean.getJobtitle().equals("")){
					VALUES("jobtitle", "#{jobtitle}");
				}
				if(bean.getZyjobtitle()  != null && !bean.getZyjobtitle().equals("")){
					VALUES("zyjobtitle", "#{zyjobtitle}");
				}
				if(bean.getZt() != null && !bean.getZt().equals("")){
					VALUES("zt", "#{zt}");
				}
				if(bean.getZjshzt() != null && !bean.getZjshzt().equals("")){
					VALUES("zjshzt", "#{zjshzt}");
				}
				if(bean.getfCompanyId() != null && !bean.getfCompanyId().equals("")){
					VALUES("fCompanyId", "#{fCompanyId}");
				}
				if(bean.getFwzt() != null && !bean.getFwzt().equals("")){
					VALUES("fwzt", "#{fwzt}");
				}
				if(bean.getDw() != null && !bean.getDw().equals("")){
					VALUES("dw", "#{dw}");
				}
				if(bean.getNl() != null && !bean.getNl().equals("")){
					VALUES("nl", "#{nl}");
				}
				if(bean.getHy() != null && !bean.getHy().equals("")){
					VALUES("hy", "#{hy}");
				}
			}
		}.toString();
		return sql;
	}
	

}
