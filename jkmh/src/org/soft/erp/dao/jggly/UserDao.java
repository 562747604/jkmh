package org.soft.erp.dao.jggly;

import static org.soft.erp.util.common.ErpConstants.USER_TABLE;

import java.awt.RenderingHints.Key;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.jggly.Role;
import org.soft.erp.domain.jggly.User;

import javassist.compiler.ast.Keyword;

public interface UserDao {

	// 根据登录名和密码查询员工
	//@Select("select * from "+USER_TABLE+" where loginname = #{loginname} and password = #{password}")
	//User selectByLoginnameAndPassword(
	//		@Param("loginname") String loginname,
	//		@Param("password") String loginname);
	@SelectProvider(type=UserDaoImpl.class,method="selectByLoginnameAndPassword")
	User selectByLoginnameAndPassword(String loginname,String password,String jcode);
	@SelectProvider(type=UserDaoImpl.class,method="selectByLoginnameAndPasswordNur")
	User selectByLoginnameAndPasswordNur(String loginname,String password);
	// 根据登录名和email查询员工是否存在
	@SelectProvider(type=UserDaoImpl.class,method="selectByLoginnameAndEmail")
	User selectByLoginnameAndEmail(String loginname,String email,String jcode);
	// 根据登录名和机构代码查询邮件验证码是否生成
	@SelectProvider(type=UserDaoImpl.class,method="Yjyzcheck")
	String Yjyzcheck(String loginname,String jcode);
	// 根据登录名和机构代码查询邮件验证码
	@SelectProvider(type=UserDaoImpl.class,method="Yjyzm")
	String Yjyzm(String loginname,String jcode);
	// 根据登录名和验证码查询邮件验证码ID
	@SelectProvider(type=UserDaoImpl.class,method="Yjyzselect")
	String Yjyzselect(String loginname,String yzcode,String jcode);
	//修改邮件验证码
	@Select("update s_yjyz set yzcode=#{yzcode}  where id= #{id}")
	void updateyjyz(@Param("id") String id,@Param("yzcode") String yzcode);
	//插入邮件验证码
	@Select("insert s_yjyz (loginname,yzcode,jgid)  values(#{loginname},#{yzcode},#{jgid})")
	void insertyjyz(@Param("loginname") String loginname,@Param("yzcode") String yzcode,@Param("jgid") String jgid);
	
	//删除邮件验证码
	@SelectProvider(type=UserDaoImpl.class,method="deleteyjyz")
	void deleteyjyz(String loginname,String jgid);
	
	// 根据loginname查询用户
	@SelectProvider(type=UserDaoImpl.class,method="selectByLoginname")
	//@Select("select * from "+USER_TABLE+" where loginname = #{loginname} and jgid=#{jgid}")
	User selectByLoginname(  String loginname,String jgid);
	
	// 根据id删除用户
	@SelectProvider(type=UserDaoImpl.class,method="delete")
	void delete(Integer id);

	// 根据id查询用户
	@SelectProvider(type=UserDaoImpl.class,method="edit")
	User edit(Integer id);
	
	// 动态插入
	@SelectProvider(type=UserDaoImpl.class,method="insert")
	void insert(User bean);

	// 动态更新
	@SelectProvider(type=UserDaoImpl.class,method="update")
	void update(User bean);
	
	// 动态查询
	@SelectProvider(type=UserDaoImpl.class,method="select")
	List<User> select(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type=UserDaoImpl.class,method="count")
	Integer count(Map<String, Object> params);
	
	@Select("select * from s_rbac_role where jgid=#{jgid} or (jtpye=1 and jgid is null)")
	public List<Role> selectRole(String jgid);
	
	//输出Excel
	//@Select("select * from  #{tblName} where 1=1  #{keyword}")
	@SelectProvider(type=UserDaoImpl.class,method="selectAllUsers")
	public List<User> selectAllUsers(String tblName,String keyword);

	//根据Role取得用户
//	@Select("select * from "+USER_TABLE+" where roles like #{roleid}")
	@Select("select * from "+USER_TABLE+" ")
	public List<User> selectAllUsersByRole();

}
