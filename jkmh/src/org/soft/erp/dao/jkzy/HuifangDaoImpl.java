package org.soft.erp.dao.jkzy;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.jstl.sql.Result;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.SQL;
import org.soft.erp.domain.Kvs;
import org.soft.erp.domain.jggly.Dxfsjl;
import org.soft.erp.domain.jggly.Ryfp;
import org.soft.erp.domain.jkzy.Hfjl;
import org.soft.erp.util.tag.PageModel;

import com.alibaba.fastjson.JSON;

/**   
 * @Description: 代码库SQL语句提供类
 * @author 	   
 * @date 2016年7月11日 上午11:19:23 
 * @version V1.0   
 */
public class HuifangDaoImpl {
	String tblnameString="d_hfjl";
	// 分页动态查询
	public String getHfjls(final String where) throws Exception {
		String sql = new SQL() {
			{
				SELECT("*");
				FROM(tblnameString);
				WHERE(where);
			}
		}.toString();
		
		return sql;
	}

	public String selectXxfsByZtandtsfs(final String zt,final String tsfs,final String mc,final String nr) throws Exception {
		String sql = new SQL() {
			{
				SELECT("*");
				FROM("d_yjfs");
				WHERE("zt ='"+zt+"'");
				WHERE("tsfs ='"+tsfs+"'");
				WHERE("mc ='"+mc+"'");
				WHERE("nr ='"+nr+"'");
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

	// 动态插入
	public String insertHfjl(final Hfjl hfjl) {
		final SimpleDateFormat myFmt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		final Date now=new Date();

		String sql = new SQL() {
			{
				INSERT_INTO("d_hfjl");
					VALUES("hid","'"+ hfjl.getHid()+"'");
					VALUES("jgid","'"+ hfjl.getJgid()+"'");
					VALUES("jy","'"+ hfjl.getJy()+"'");
					VALUES("nr", "'"+ hfjl.getNr()+"'");
					VALUES("yid", "'"+ hfjl.getYid()+"'");
					VALUES("yname","'"+ hfjl.getYname()+"'");
					VALUES("htime", "'"+myFmt2.format(now)+"'");
			}
		}.toString();
		return sql;
	}
	
	// 动态插入
		public String insertXxfs(final Dxfsjl dxfsjl) {
			final SimpleDateFormat myFmt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			final Date now=new Date();

			String sql = new SQL() {
				{
					INSERT_INTO("d_yjfs");
						VALUES("jgid","'"+ dxfsjl.getJgid()+"'");
						VALUES("uid","'"+ dxfsjl.getUid()+"'");
						VALUES("fname","'"+ dxfsjl.getFname()+"'");
						VALUES("juid", "'"+ dxfsjl.getJuid()+"'");
						VALUES("jname", "'"+ dxfsjl.getJname()+"'");
						VALUES("yx","'"+ dxfsjl.getYx()+"'");
						VALUES("mc","'"+ dxfsjl.getMc()+"'");
						VALUES("nr","'"+ dxfsjl.getNr()+"'");
						VALUES("zt","'"+ dxfsjl.getZt()+"'");
						VALUES("tslx","'"+ dxfsjl.getTslx()+"'");
						VALUES("cffs","'"+ dxfsjl.getCffs()+"'");
						VALUES("tsfs","'"+ dxfsjl.getTsfs()+"'");
						VALUES("dsfs","'"+ dxfsjl.getDsfs()+"'");
						VALUES("zqts","'"+ dxfsjl.getZqts()+"'");
						VALUES("moble","'"+ dxfsjl.getMoble()+"'");
						VALUES("ftime", "'"+myFmt2.format(now)+"'");
				}
			}.toString();
			return sql;
		}
		//修改推送信息状态
		public String updateyjfs(final String id) {
			final SimpleDateFormat myFmt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			final Date now=new Date();
			String sql ="update d_yjfs set zt='已发送',stime='"+myFmt2.format(now)+"' where id="+id; 
			return sql;
		}
		
}
