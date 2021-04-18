package org.soft.erp.util.common;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.jsp.jstl.sql.Result;
import javax.servlet.jsp.jstl.sql.ResultSupport;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.formula.functions.Count;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.soft.erp.controller.BaseController;
import org.soft.erp.dao.TestSqlDao;
import org.soft.erp.dao.baseDao;
import org.soft.erp.dao.baseDaoImpl;
import org.soft.erp.domain.Sfield;
import org.soft.erp.service.BaseService;

public class ExcelUtils {

	public static final String HEADERINFO = "headInfo";// List
	public static final String DATAINFON = "dataInfo";// TreeMap
	public static final String DATAINFO = "dataInfo";// List
	private static final Logger log = Logger.getLogger(TestSqlDao.class);
	/*
	 * tblName:表名 headList:中文名,表头数据 ennameList:英文名 selectList:数据
	 */

	public static void doTj(String filename, Result rs) throws Exception {
		Workbook wb = new XSSFWorkbook();// 创建一个新的excel的文档对象

		// 表单数据
		List<String> dataList = new ArrayList<String>();
		List<String> headList = new ArrayList<String>();
		headList.add("姓名");
		headList.add("份数");
		for (int i = 0; i < rs.getRowCount(); i++) {
			dataList.add(rs.getRows()[i].get("pname") + "");
			dataList.add(rs.getRows()[i].get("c") + "");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put(ExcelUtils.HEADERINFO, headList);
		map.put(ExcelUtils.DATAINFO, dataList);

		ExcelUtils.writeExcel(filename, map, wb);
	}

	public static void exportExcel(String fileName, String tblName, List<String> headList, List<String> ennameList,
			List selectList) throws Exception {
		Workbook wb = new XSSFWorkbook();// 创建一个新的excel的文档对象

		// 表单数据
		List<String> dataList = new ArrayList<String>();
		for (Object bean : selectList) {
			Map map = ExcelUtils.objectToMap(bean);
			Set<Map.Entry<String, String>> entrySet = map.entrySet();
			for (String enName : ennameList) {
				for (Map.Entry<String, String> entry : entrySet) {
					String key = entry.getKey();
					String value = (String) entry.getValue();
					if (enName.equals(key)) {
						dataList.add(value);
						break;
					}
				}
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(ExcelUtils.HEADERINFO, headList);
		map.put(ExcelUtils.DATAINFO, dataList);

		ExcelUtils.writeExcel(fileName, map, wb);
	}

	public static void exportYxtjExcel(String fileName, List<String> headList, List selectList) throws Exception {
		Workbook wb = new XSSFWorkbook();// 创建一个新的excel的文档对象

		Map<String, Object> map = new HashMap<String, Object>();
		map.put(ExcelUtils.HEADERINFO, headList);
		map.put(ExcelUtils.DATAINFO, selectList);

		ExcelUtils.writeExcel(fileName, map, wb);
	}

	/**
	 * 
	 * @Title: writeExcel
	 * @Description: TODO(导出Excel表)
	 * @param pathname
	 *            :导出Excel表的文件路径
	 * @param map
	 *            ：封装需要导出的数据(HEADERINFO封装表头信息，DATAINFON：封装要导出的数据信息,此处需要使用TreeMap
	 *            ) 例如： map.put(ExcelUtil.HEADERINFO,List<String> headList);
	 *            map.put(ExcelUtil.DATAINFON,List<TreeMap<String,Object>>
	 *            dataList);
	 * @param wb
	 * @throws IOException
	 */
	public static void writeExcel(String pathname, Map<String, Object> map, Workbook wb) throws IOException {
		if (null != map && null != pathname) {
			List<Object> headList = (List<Object>) map.get(ExcelUtils.HEADERINFO);
			List<Object> dataList2 = (List<Object>) map.get(ExcelUtils.DATAINFO);
			// List<TreeMap<String, Object>> dataList = (List<TreeMap<String,
			// Object>>) map.get(ExcelUtils.DATAINFON);

			CellStyle style = getCellStyle(wb);
			// 在文档对象中创建一个表单..默认是表单名字是Sheet0、Sheet1....
			Sheet sheet = wb.createSheet();
			// 在创建表单的时候指定表单的名字
			// Sheet sheet = wb.createSheet("hell poi");

			/**
			 * 设置Excel表的第一行即表头
			 */
			Row row = sheet.createRow(0);
			for (int i = 0; i < headList.size(); i++) {
				Cell headCell = row.createCell(i);
				headCell.setCellType(CellType.BLANK);// 设置这个单元格的数据的类型,是文本类型还是数字类型
				headCell.setCellStyle(style);// 设置表头样式
				headCell.setCellValue(String.valueOf(headList.get(i)));// 给这个单元格设置值
			}
			//
			int k = dataList2.size() / headList.size() + 1;
			int dd = 0;
			for (int i = 1; i < k; i++) {
				Row rowdata = sheet.createRow(i);// 创建数据行
				for (int j = 0; j < headList.size(); j++) {
					Cell headCell = rowdata.createCell(j);
					headCell.setCellValue(dataList2.get(dd++) + "");// 给这个单元格设置值
				}
			}

			// for (int i = 0; i < dataList.size(); i++) {
			// Row rowdata = sheet.createRow(i + 1);// 创建数据行
			// TreeMap<String, Object> mapdata = dataList.get(i);
			// Iterator<String> it = mapdata.keySet().iterator();
			// int j = 0;
			// while (it.hasNext()) {
			// String strdata = String.valueOf(mapdata.get(it.next()));
			// Cell celldata = rowdata.createCell(j);// 在一行中创建某列..
			// celldata.setCellType(CellType.BLANK);
			// celldata.setCellValue(strdata);
			// j++;
			// }
			// }

			// 文件流
			File file = new File(pathname);
			OutputStream os = new FileOutputStream(file);
			os.flush();
			wb.write(os);
			os.close();
		}
	}

	/*
	 * 从excel中取得第一行表头,获得中文,然后和sfield判断是否争取，如果有不符，就放弃读取。 如果正确读取第一行数据
	 */
	public static int importExcel(List<Sfield> sfieldList, List<String> cnnameList, String xlsPath) {

		int rs = 0;
		String tblName = "s_rbac_user";
		SimpleDateFormat myFmt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now=new Date();
		try {
			Workbook workbook = getWeebWork(xlsPath);
			executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('0','','','用户管理','读取导入表','"+myFmt2.format(now)+"')");
			//System.out.println("总表页数为：" + workbook.getNumberOfSheets());// 获取表页数
			Sheet sheet = workbook.getSheetAt(0);// 获取第1个表单
			int rownum = sheet.getLastRowNum();// 获取总行数
			executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('0','','','用户管理','读取表行数','"+myFmt2.format(now)+"')");
			Row rowHead = sheet.getRow(0);// 获取表达的第i行
			int jgnum = -1;
			int lonum = -1;
			int sum = 0;
			for (int j = rowHead.getFirstCellNum(); j < rowHead.getLastCellNum(); j++) {
				Cell celldata = rowHead.getCell(j);
				if (celldata.toString().equals("机构代码")) {
					jgnum = j;
				}
				if (celldata.toString().equals("个人账号")) {
					lonum = j;
				}
				//System.out.print(celldata.getCellType());
				executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('0','','','用户管理','获取数据字段类型"+celldata.getCellType()+"','"+myFmt2.format(now)+"')");
				if (!cnnameList.contains(celldata.toString()))// celldata必须为String类型
				{
					executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('0','','','用户管理','不包含字段类"+celldata.toString()+"','"+myFmt2.format(now)+"')");
					//System.out.println("不包含" + celldata.toString());
					return rs;
				}
			}

			HashMap<String, String> hm = new HashMap<String, String>();
			for (Sfield sf : sfieldList) {
				hm.put(sf.getChname(), sf.getEnname());
			}
			executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('0','','','用户管理','对应中英文字段','"+myFmt2.format(now)+"')");
			// System.out.println("hm：" + hm);//
			String sqlString = "";
			for (int i = 1; i <= rownum; i++) {
				Row row = sheet.getRow(i);// 获取表达的第i行
				if (jgnum != -1 && lonum != -1 && row != null) {
					int s = getCount(tblName,
							" and jgid='" + row.getCell(jgnum) + "' and loginname='" + row.getCell(lonum) + "'");
					executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('0','','','用户管理','获取数据是否已存在"+s+"','"+myFmt2.format(now)+"')");
					if (s > 0) {
						sqlString = "update " + tblName + " set ";
						for (int j = rowHead.getFirstCellNum(); j < rowHead.getLastCellNum(); j++) {
							Cell celldata = rowHead.getCell(j);
							String columnName = hm.get(celldata + "");
							sqlString += columnName + "='" + row.getCell(j) + "',";
						}
						sqlString = sqlString.substring(0, sqlString.length() - 1);
						sqlString += " where  jgid='" + row.getCell(jgnum) + "' and loginname='" + row.getCell(lonum)
								+ "'";
					} else {
						sqlString = "insert into " + tblName + " (";
						for (int j = rowHead.getFirstCellNum(); j < rowHead.getLastCellNum(); j++) {
							Cell celldata = rowHead.getCell(j);
							String columnName = hm.get(celldata + "");
							sqlString += columnName + ",";
						}
						sqlString += "password,txPath,organid) values(";
						for (int j = row.getFirstCellNum(); j < row.getLastCellNum(); j++) {// 遍历一行中的所有列
							sqlString += "'" + row.getCell(j) + "',";
						}
						sqlString += "'670b14728ad9902aecba32e22fa4f6bd','/images/tx/none.jpg','" + row.getCell(jgnum)
								+ "') ";
					}
					executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('0','','','用户管理','生成对应sql语句"+sqlString.replace("'", "''")+"','"+myFmt2.format(now)+"')");
					System.out.print(sqlString);
					int kk=executeUpdate(sqlString);
					executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('0','','','用户管理','执行结果"+kk+"','"+myFmt2.format(now)+"')");
					sum ++;
				}
			}
			rs=sum;
		} catch (Exception ex) {
			executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('0','','','用户管理','报错"+ex.toString()+"','"+myFmt2.format(now)+"')");
			System.out.print(ex.toString());
		}
		return rs;

		/*
		 * String sql = "insert into " + tblName + " ("; for(int j =
		 * rowHead.getFirstCellNum(); j < rowHead.getLastCellNum(); j++){ Cell
		 * celldata = rowHead.getCell(j); String columnName =
		 * hm.get(celldata+""); sql += columnName + ","; } sql =
		 * sql.substring(0, sql.length() - 1); sql += ") values("; for (int j =
		 * rowHead.getFirstCellNum(); j < rowHead.getLastCellNum(); j++) { sql
		 * += "?,"; } sql = sql.substring(0, sql.length() - 1); sql += ")";
		 * 
		 * System.out.println("sql==="+sql);
		 * 
		 * SqlSession sqlSession = ERPSqlSessionFactory.getSqlSession();
		 * Connection con = sqlSession.getConnection();
		 * System.out.println("con==="+con);
		 * 
		 * try { PreparedStatement pstmt = null; pstmt =
		 * con.prepareStatement(sql); for (int i = 1; i <= rownum; i++) { Row
		 * row = sheet.getRow(i);// 获取表达的第i行 for (int j = row.getFirstCellNum();
		 * j < row.getLastCellNum(); j++) {// 遍历一行中的所有列 Cell celldata =
		 * row.getCell(j);// 获取一行中的第j列返回Cell类型的数据
		 * 
		 * System.out.println("celldata==="+celldata);
		 * 
		 * 
		 * pstmt.setString(j + 1, celldata + ""); } pstmt.addBatch(); }
		 * pstmt.executeBatch(); pstmt.close(); } catch (Exception e) {
		 * e.printStackTrace(); } finally { } sqlSession.close();
		 */
	}

	public static int getCount(String tblname, String where) {
		int result = 0;
		SqlSession sqlSession = null;

		PreparedStatement ps = null;
		ResultSet rs = null;
		Result rowset = null;
		try {
			sqlSession = ERPSqlSessionFactory.getSqlSession();
			Connection con = sqlSession.getConnection();
			ps = con.prepareStatement("select * from " + tblname + " where 1=1 " + where);
			rs = ps.executeQuery();
			rowset = ResultSupport.toResult(rs);
			result = rowset.getRowCount();
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
					log.error("预编译SQL语句对象PreparedStatement关闭异常！" + e.getMessage(), e);
				}
			}
			sqlSession.close();
		}
		return result;
	}

	public static int executeUpdate(String sql) {
		int result = 0; // 定义保存返回值的变量
		PreparedStatement ps = null;
		SqlSession sqlSession = null;
		try { // 捕捉异常
			sqlSession = ERPSqlSessionFactory.getSqlSession();
			Connection con = sqlSession.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate(); // 执行更新操作
		} catch (Exception e) {
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
			sqlSession.close();
		}
		return result; // 返回保存返回值的变量
	}

	/*
	 * 将java bean转换成map
	 */
	public static Map<String, Object> objectToMap(Object obj) throws Exception {
		if (obj == null)
			return null;

		Map<String, Object> map = new HashMap<String, Object>();

		BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
		PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
		for (PropertyDescriptor property : propertyDescriptors) {
			String key = property.getName();
			if (key.compareToIgnoreCase("class") == 0) {
				continue;
			}
			java.lang.reflect.Method getter = property.getReadMethod();
			Object value = getter != null ? getter.invoke(obj) : null;
			if (value == null)
				value = "";
			map.put(key, value + "");
		}

		return map;
	}

	/**
	 * 
	 * @Title: getWeebWork
	 * @Description: TODO(根据传入的文件名获取工作簿对象(Workbook))
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	public static Workbook getWeebWork(String filename) throws IOException {
		Workbook workbook = null;
		if (null != filename) {
			String fileType = filename.substring(filename.lastIndexOf("."), filename.length());
			FileInputStream fileStream = new FileInputStream(new File(filename));
			if (".xls".equals(fileType.trim().toLowerCase())) {
				workbook = new HSSFWorkbook(fileStream);// 创建 Excel 2003 工作簿对象
			} else if (".xlsx".equals(fileType.trim().toLowerCase())) {
				workbook = new XSSFWorkbook(fileStream);// 创建 Excel 2007 工作簿对象
			}
		}
		return workbook;
	}

	//////////////////////////////////////////// 以下未用////////////////////////////////////////////////////

	/**
	 * 
	 * @Title: getCellStyle
	 * @Description: TODO（设置表头样式）
	 * @param wb
	 * @return
	 */
	public static CellStyle getCellStyle(Workbook wb) {
		CellStyle style = wb.createCellStyle();
		Font font = wb.createFont();
		font.setFontName("宋体");
		font.setFontHeightInPoints((short) 12);// 设置字体大小
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);// 加粗
		style.setFillForegroundColor(HSSFColor.LIME.index);// 设置背景色
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style.setAlignment(HSSFCellStyle.SOLID_FOREGROUND);// 让单元格居中
		// style.setWrapText(true);//设置自动换行
		style.setFont(font);
		return style;
	}

	public static void readFromExcel() throws IOException {
		Workbook workbook = getWeebWork("D:/Tomcat7/webapps/jkmh/test1.xlsx");
		// System.out.println("总表页数为：" + workbook.getNumberOfSheets());// 获取表页数
		Sheet sheet = workbook.getSheetAt(0);// 获取第二个表单
		int rownum = sheet.getLastRowNum();// 获取总行数

		Row rowHead = sheet.getRow(0);// 获取表达的第i行
		for (int j = rowHead.getFirstCellNum(); j < rowHead.getLastCellNum(); j++) {// 遍历一行中的所有列
			Cell celldata = rowHead.getCell(j);// 获取一行中的第j列返回Cell类型的数据
			System.out.print(celldata + "\t");//
		}
		System.out.println();//

		for (int i = 1; i <= rownum; i++) {
			Row row = sheet.getRow(i);// 获取表达的第i行
			/**
			 * row.getFirstCellNum(): 获取行的第一个单元格的位置 row.getLastCellNum():
			 * 获取行的最后一个单元格的位置
			 */
			for (int j = row.getFirstCellNum(); j < row.getLastCellNum(); j++) {// 遍历一行中的所有列
				Cell celldata = row.getCell(j);// 获取一行中的第j列返回Cell类型的数据
				System.out.print(celldata + "\t");//
			}
			System.out.println();
		}

		// 用户名, 姓名, 身份证号, 手机号, 邮箱, 性别, 出生日期
		List list = new ArrayList();
		list.add("中国");
		boolean b = list.contains("中国");
		// System.out.println(b);

	}

	public static void readFromExcelDemo(String fileAbsolutePath) throws IOException {
		/**
		 * 读取Excel表中的所有数据
		 */
		Workbook workbook = getWeebWork(fileAbsolutePath);
		// System.out.println("总表页数为：" + workbook.getNumberOfSheets());// 获取表页数
		Sheet sheet = workbook.getSheetAt(0);
		// Sheet sheet = workbook.getSheetAt(1);
		int rownum = sheet.getLastRowNum();// 获取总行数
		for (int i = 0; i <= rownum; i++) {
			Row row = sheet.getRow(i);
			Cell orderno = row.getCell(2);// 获取指定单元格中的数据

			// System.out.println(orderno.getColumnIndex());// 这个打印的是cell的type

			// System.out.println(orderno.getCellType());//这个打印的是cell的type
			short cellnum = row.getLastCellNum(); // 获取单元格的总列数
			for (int j = row.getFirstCellNum(); j < row.getLastCellNum(); j++) {
				Cell celldata = row.getCell(j);
				System.out.print(celldata + "\t");
			}
			System.out.println();
		}

		/**
		 * 读取指定位置的单元格
		 */
		// Row row1 = sheet.getRow(1);
		// Cell cell1 = row1.getCell(2);
		// System.out.print("(1,2)位置单元格的值为："+cell1);
		// BigDecimal big = new
		// BigDecimal(cell1.getNumericCellValue());//将科学计数法表示的数据转化为String类型
		// System.out.print("\t"+String.valueOf(big));
	}

	public static void main(String[] args) throws Exception {
		readFromExcel();
		// String filePath = "d:/test1.xlsx";
		// readFromExcelDemo(filePath);// 从一个指定的excel文件中读取内容

		// writeToExcelDemo();
	}

	public static void writeToExcelDemo() throws Exception {

		Workbook wb = new XSSFWorkbook();// 创建一个新的excel的文档对象
		Map<String, Object> map = new HashMap<String, Object>();
		List headList = new ArrayList();// 表头数据
		headList.add("下单时间");
		headList.add("结账时间");
		headList.add("订单编号");
		headList.add("订单金额");
		headList.add("用户名");// excel的都

		/**
		 * TreeMap基于红黑树实现
		 */
		List dataList = new ArrayList();// 表格内的数据
		for (int i = 0; i < 15; i++) {
			TreeMap<String, Object> treeMap = new TreeMap<String, Object>();// 此处的数据必须为有序数据，所以使用TreeMap进行封装
			treeMap.put("m1", "2013-10-" + i + 1);
			treeMap.put("m2", "2013-11-" + i + 1);
			treeMap.put("m3", "20124" + i + 1);
			treeMap.put("m4", 23.5 + i + 1);
			treeMap.put("m5", "张三_" + i);
			dataList.add(treeMap);
		}

		map.put(ExcelUtils.HEADERINFO, headList);
		map.put(ExcelUtils.DATAINFON, dataList);
		writeExcel("d:/test1.csv", map, wb);// 往wb里面写map中内容，生成E:/test1.xlsx这个文件....
	}

}