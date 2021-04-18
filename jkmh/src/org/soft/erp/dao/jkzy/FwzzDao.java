package org.soft.erp.dao.jkzy;

import java.util.List;
import java.util.Map;

import javax.servlet.jsp.jstl.sql.Result;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.jggly.Ryfp;

public interface FwzzDao {

	// 动态插入
	@SelectProvider(type=FwzzDaoImpl.class,method="update")
	void update(Ryfp bean);
	
	// 动态查询
	@SelectProvider(type=FwzzDaoImpl.class,method="select")
	List<Ryfp> select(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type=FwzzDaoImpl.class,method="count")
	Integer count(Map<String, Object> params);
	
	// 动态插入
	@SelectProvider(type=FwzzDaoImpl.class,method="addFc")
	void addFc(String id,String zjid,String zjname,Result rs);
	
	// 动态插入
	@SelectProvider(type=FwzzDaoImpl.class,method="updateJkzjzt")
	void updateJkzjzt(String id);
	
	// 动态插入
	@SelectProvider(type=FwzzDaoImpl.class,method="updateJkzj")
	void updateJkzj(String id,String zjid,String zjname);
	
	/***/
	//@Select("select * from s_tuser where jgid = #{jgid} and (zyid = #{zyid} or zyid is null) ")
	@Select("select * from s_tuser where jgid = #{jgid} ")
	List<Ryfp> selectByJgidAndZyid(@Param("jgid") String jgid,@Param("zyid") int zyid);
}
