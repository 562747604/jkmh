package org.soft.erp.service.sys;

import java.sql.DatabaseMetaData;
import java.sql.ResultSet;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public class TableMeta{
	
	@Autowired
	private static SqlSessionFactory sqlSessionFactory;

	public static void getColumnNames() throws Exception{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		DatabaseMetaData dbmd = sqlSession.getConnection().getMetaData();
		System.out.println(dbmd.getDatabaseProductName());  
		System.out.println(dbmd.getDatabaseProductVersion());//获得数据库的版本。返回的字符串。
		System.out.println(dbmd.getDriverVersion());//获得驱动程序的版本。返回字符串。
		System.out.println(dbmd.getTypeInfo());//获得当前数据库的类型信息
		
		
   	 System.out.println("数据库已知的用户: "+ dbmd.getUserName());    
     System.out.println("数据库的系统函数的逗号分隔列表: "+ dbmd.getSystemFunctions());    
     System.out.println("数据库的时间和日期函数的逗号分隔列表: "+ dbmd.getTimeDateFunctions());    
     System.out.println("数据库的字符串函数的逗号分隔列表: "+ dbmd.getStringFunctions());    
     System.out.println("数据库供应商用于 'schema' 的首选术语: "+ dbmd.getSchemaTerm());    
     System.out.println("数据库URL: " + dbmd.getURL());    
     System.out.println("是否允许只读:" + dbmd.isReadOnly());    
     System.out.println("数据库的产品名称:" + dbmd.getDatabaseProductName());    
     System.out.println("数据库的版本:" + dbmd.getDatabaseProductVersion());    
     System.out.println("驱动程序的名称:" + dbmd.getDriverName());    
     System.out.println("驱动程序的版本:" + dbmd.getDriverVersion());  

		/**
		 * 获取给定类别中使用的表的描述。 方法原型:ResultSet getTables(String catalog,String
		 * schemaPattern,String tableNamePattern,String[] types); catalog -
		 * 表所在的类别名称;""表示获取没有类别的列,null表示获取所有类别的列。 schema -
		 * 表所在的模式名称(oracle中对应于Tablespace);""表示获取没有模式的列,null标识获取所有模式的列;
		 * 可包含单字符通配符("_"),或多字符通配符("%"); tableNamePattern -
		 * 表名称;可包含单字符通配符("_"),或多字符通配符("%"); types - 表类型数组;
		 * "TABLE"、"VIEW"、"SYSTEM TABLE"
		 * 、"GLOBAL TEMPORARY"、"LOCAL TEMPORARY"、"ALIAS" 和
		 * "SYNONYM";null表示包含所有的表类型;可包含单字符通配符("_"),或多字符通配符("%");
		 */
   //这个方法带有四个参数，它们表示的含义如下：
   //String catalog：要获得表所在的编目。"“”"意味着没有任何编目，Null表示所有编目。
   //String schema：要获得表所在的模式。"“”"意味着没有任何模式，Null表示所有模式。
   //String tableName：指出要返回表名与该参数匹配的那些表，
   //String types：一个指出返回何种表的数组。

		ResultSet rs = dbmd.getTables(null, null, "S_RBAC_USER",
				new String[] { "TABLE", "VIEW" });

		while (rs.next()) {
			String tableCat = rs.getString("TABLE_CAT"); // 表类别(可为null)
			String tableSchemaName = rs.getString("TABLE_SCHEM");// 表模式（可能为空）,在oracle中获取的是命名空间,其它数据库未知
			String tableName = rs.getString("TABLE_NAME"); // 表名
			String tableType = rs.getString("TABLE_TYPE"); // 表类型,典型的类型是
		// "TABLE"、"VIEW"、"SYSTEM TABLE"、"GLOBAL TEMPORARY"、"LOCAL TEMPORARY"、"ALIAS"
		// 和 "SYNONYM"。
			String remarks = rs.getString("REMARKS"); // 表备注
			
		     System.out.println("表类别(可为null):" + tableCat);    
		     System.out.println("表模式（可能为空）:" + tableSchemaName);    
		     System.out.println("表名:" + tableName);    
		     System.out.println("表类型,典型的类型是:" + tableType);  
		     System.out.println("表备注:" + remarks);  
		}


	}
	public static void main(String args[]){
		try {
			getColumnNames() ;
			
			
			
//			getDataBaseInfo();  //获取数据库信息
//			getSchemasInfo(); //获取数据库所有Schema
//			getTablesList();  //获取某用户下所有的表
//			getTablesInfo();  //获取表信息
//			getPrimaryKeysInfo(); //获取表主键信息
//			getIndexInfo();  //获取表索引信息
//			getColumnsInfo(); //获取表中列值信息
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
