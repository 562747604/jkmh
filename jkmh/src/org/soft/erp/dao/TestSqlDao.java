package org.soft.erp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

public class TestSqlDao extends SqlSessionDaoSupport {
	// 日志管理器
	private static final Logger log = Logger.getLogger(TestSqlDao.class);

    @Autowired   
    private  SqlSessionFactory sqlSessionFactory;  

//    SqlSession session = sqlSessionFactory.openSession();
    
	
	// 测试自己拼写的sql
	public List<Integer> testStringSql(String sql) {
		List<Integer> list = new ArrayList<Integer>();
		Connection con = sqlSessionFactory.openSession().getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(rs.getInt("id"));
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
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					log.error("关闭连接对象Connection异常！" + e.getMessage(), e);
				}
			}
		}
		return list;
	}

	public static void main(String[] args){
		TestSqlDao tsd = new TestSqlDao();
		List<Integer> list = tsd.testStringSql("select id from s_rbac_user");
		for (int i = 0; i < list.size(); i++) {
			//System.out.println(list.get(i));
		}
	}
}