package org.soft.erp.dao.jkzj;

import java.util.List;
import java.util.Map;

import javax.servlet.jsp.jstl.sql.Result;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.jggly.Ryfp;

public interface PgywDao {

	// 动态插入
	@SelectProvider(type=PgywDaoImpl.class,method="update")
	void update(Ryfp bean);
	
	// 动态查询
	@SelectProvider(type=PgywDaoImpl.class,method="select")
	List<Ryfp> select(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type=PgywDaoImpl.class,method="count")
	Integer count(Map<String, Object> params);
	
	// 动态插入
	@SelectProvider(type=PgywDaoImpl.class,method="addFc")
	void addFc(String id,String zjid,String zjname,Result rs);
	
	// 动态插入
	@SelectProvider(type=PgywDaoImpl.class,method="updateJkzjzt")
	void updateJkzjzt(String id);
	
	// 动态插入
	@SelectProvider(type=PgywDaoImpl.class,method="updateJkzj")
	void updateJkzj(String id,String zjid,String zjname,String zc);
	
	// 动态插入
	@SelectProvider(type=PgywDaoImpl.class,method="updateJkzj1")
	void updateJkzj1(String id,String zjid,String zjname,String zc);
	//根据机构和专家取得体检用户列表
	@Select("select * from s_tuser where jgid = #{jgid} and (zjid = #{zjid} and (zjshzt!='已审核' or zjshzt is null or zjshzt='待选择')) ")
	List<Ryfp> selectByJgidAndZjid(@Param("jgid") String jgid,@Param("zjid") int zjid);
	
	//根据机构和专家取得体检用户列表-已审核
	@Select("select * from s_tuser where jgid = #{jgid} and zjid = #{zjid} and zjshzt='已审核' ")
	List<Ryfp> selectYshByJgidAndZjid(@Param("jgid") String jgid,@Param("zjid") int zjid);
	
	//根据机构取得体检用户列表-已审核,用于上级领导查看
	@Select("select * from s_tuser where jgid = #{jgid} and zjshzt='已审核' ")
	List<Ryfp> selectYshByJgid(@Param("jgid") String jgid);
	
}
