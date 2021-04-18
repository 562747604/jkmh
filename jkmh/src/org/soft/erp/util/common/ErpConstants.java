package org.soft.erp.util.common;

public class ErpConstants {
	
	// 数据库表常量
	public static final String USER_TABLE = "s_rbac_user";
	public static final String ROLE_TABLE = "s_rbac_role";
	public static final String MENU_TABLE = "s_rbac_menu";
	
	public static final String SEARCH_COLUMN_TABLE="d_search_column";
	public static final String TOGGLE_COLUMN_TABLE="d_toggle_column";
	
	//////////////////////
	public static final String DEPTTABLE = "dept_inf";
	public static final String JOBTABLE = "job_inf";
	public static final String EMPLOYEETABLE = "employee_inf";
	public static final String NOTICETABLE = "notice_inf";
	public static final String DOCUMENTTABLE = "document_inf";
	
	//
	public static final String STTEMP_TABLE = "s_sttemp";
	public static final String ST_KEYVALUE_TABLE = "s_st_keyvalue";
	
	// 登录
	public static final String LOGIN = "/user/loginForm";
	
	public static final String SESSION_EXPIRED = "/user/loginForm";
	// 用户的session对象
	public static final String USER_SESSION = "user_session";
	// 体检用户的session对象
	public static final String PERSON_SESSION = "person_session";
		
	// 默认每页4条数据
	public static int PAGE_DEFAULT_SIZE = 4;
	
	// 体检用户接口执行标志
	public static boolean  RYFPBZ = false;
	
	// 服务用户接口执行标志
	public static boolean  FWRYBZ = false;
		
	// 消息推送执行标志
	public static boolean  XXTSBZ = false;
	

	public static final String APIKEY = "abcde";

	
}
