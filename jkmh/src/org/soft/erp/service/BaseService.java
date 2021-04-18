package org.soft.erp.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Map;

import javax.servlet.jsp.jstl.sql.Result;
import javax.servlet.jsp.jstl.sql.ResultSupport;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.soft.erp.dao.TestSqlDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("baseService")
public class BaseService {
	@Autowired   
	private  SqlSessionFactory sqlSessionFactory;  
	// 日志管理器
	private static final Logger log = Logger.getLogger(TestSqlDao.class);

	public String boolDis(String roles,String btn) throws SQLException {
		String[] rolsString=roles.split(",");
		String temp="";
		for(int i=0;i<rolsString.length;i++){
			if(!rolsString[i].equals("")){
				Result rSet=query("select * from s_rbac_role where role_id='"+rolsString[i]+"'");
				for(int h=0;h<rSet.getRowCount();h++){
					Map row = rSet.getRows()[h];
					temp+= row.get("menu_power")+",";			
				}
			}
		}
		String rs="";
		if(temp.indexOf(btn)==-1){
			rs="display:none;";
		}
		return rs;
	}

	public String getOptions(String tblname,String whereString ,String key,String value,String selected) throws SQLException {
		Result rSet=query("select * from "+tblname+" where 1=1 "+whereString +" order by "+key);
		String temp="";
		for(int h=0;h<rSet.getRowCount();h++){
			Map row = rSet.getRows()[h];			
			if(row.get(key).equals(selected)){
				temp+="<option value=\""+row.get(key)+"\" selected=\"selected\">"+row.get(value)+"</option>";
			}else{
				temp+="<option value=\""+row.get(key)+"\">"+row.get(value)+"</option>";
			}
		}
		return temp;
	}

	public Result query(String sql) {
		Connection con = sqlSessionFactory.openSession().getConnection();
		PreparedStatement ps = null;
		ResultSet  rs = null;
		Result rowset = null;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rowset = ResultSupport.toResult(rs);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					log.error("关闭结果集ResultSet异常！" + e.getMessage(), e);
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception e) {
					log.error(
							"预编译SQL语句对象PreparedStatement关闭异常！" + e.getMessage(),
							e);
				}
			}
			/*if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					log.error("关闭连接对象Connection异常！" + e.getMessage(), e);
				}
			}*/
		}
		return rowset;
	}

	/*
	 * 功能:执行更新操作
	 */
	public int executeUpdate(String sql)
	{
		int result = 0; // 定义保存返回值的变量
		PreparedStatement ps = null;
		try
		{ // 捕捉异常
			Connection con = sqlSessionFactory.openSession().getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate(); // 执行更新操作
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return result; // 返回保存返回值的变量
	}

	public int getCount(String tblname,String where) {
		int result=0;
		Connection con = sqlSessionFactory.openSession().getConnection();
		PreparedStatement ps = null;
		ResultSet  rs = null;
		Result rowset = null;
		try {
			ps = con.prepareStatement("select * from "+tblname+" where 1=1 "+where);
			rs = ps.executeQuery();
			rowset = ResultSupport.toResult(rs);
			result=rowset.getRowCount();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					log.error("关闭结果集ResultSet异常！" + e.getMessage(), e);
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception e) {
					log.error(
							"预编译SQL语句对象PreparedStatement关闭异常！" + e.getMessage(),
							e);
				}
			}
		}
		return result;
	}

	public String getSingle(String sql) {
		Connection con = sqlSessionFactory.openSession().getConnection();
		PreparedStatement ps = null;
		ResultSet  rs = null;
		String result="";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				if(result==""){
					result=rs.getString(1);		
				}else{
					result+=","+rs.getString(1);	
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					log.error("关闭结果集ResultSet异常！" + e.getMessage(), e);
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception e) {
					log.error(
							"预编译SQL语句对象PreparedStatement关闭异常！" + e.getMessage(),
							e);
				}
			}
			/*if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					log.error("关闭连接对象Connection异常！" + e.getMessage(), e);
				}
			}*/
		}
		return result;
	}

	//获取某年某月的第一天日期
	public  Date getStartMonthDate(int year, int month) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month-1, 1);
		return calendar.getTime();
	}

	//获取某年某月的最后一天日期
	public  Date getEndMonthDate(int year, int month) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month-1, 1);
		int day = calendar.getActualMaximum(5);
		calendar.set(year, month-1, day);
		return calendar.getTime();
	}

	public  int getDiffDays(Date beginDate, Date endDate) {

		if (beginDate == null || endDate == null) {
			throw new IllegalArgumentException("getDiffDays param is null!");
		}

		long diff = (endDate.getTime() - beginDate.getTime())
				/ (1000 * 60 * 60 * 24);

		int days = new Long(diff).intValue();

		return days;
	}
	public  Date getNextDay(Date date, int i) {
		Calendar cal = new GregorianCalendar();
		cal.setTime(date);
		cal.set(Calendar.DATE, cal.get(Calendar.DATE) + i);
		return cal.getTime();
	}

	public String getField(String tblname) throws SQLException {
		Result rSet=query("select enname from s_field where hasTbl like'%|"+tblname+"|%' order by px ");
		String temp="";
		for(int h=0;h<rSet.getRowCount();h++){
			Map row = rSet.getRows()[h];			
			if(temp==""){
				temp=row.get("enname")+"";
			}else{
				temp+=","+row.get("enname")+"";
			}
		}
		return temp;
	}
}
