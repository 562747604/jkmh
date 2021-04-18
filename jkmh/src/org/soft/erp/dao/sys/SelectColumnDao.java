package org.soft.erp.dao.sys;

import static org.soft.erp.util.common.ErpConstants.TOGGLE_COLUMN_TABLE;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.sys.ToggleColumn;

public interface SelectColumnDao {

	// 当前用户搜索显示字段
//	@SelectProvider(type=SelectColumnDaoImpl.class,method="editByUidAndTblname")
	
//	@Select("select * from "+TOGGLE_COLUMN_TABLE+" where id = #{id} and uid = #{uid} and tblname = #{tblname}")
//	ToggleColumn selectById(@Param("id")Integer id,@Param("uid")String uid,@Param("tblname")String tblname);
	
	@Select("select * from "+TOGGLE_COLUMN_TABLE+" where uid = #{uid} and tblname = #{tblname} and jgid = #{jgid}")
	ToggleColumn selectById(@Param("uid")String uid,@Param("tblname")String tblname,@Param("jgid")String jgid);
	
	// 动态更新
	@SelectProvider(type=SelectColumnDaoImpl.class,method="update")
	void update(ToggleColumn bean);
	
	// 动态插入
	@SelectProvider(type=SelectColumnDaoImpl.class,method="insert")
	void insert(ToggleColumn bean);
}
