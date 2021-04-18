package org.soft.erp.dao.sys;

import static org.soft.erp.util.common.ErpConstants.SEARCH_COLUMN_TABLE;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.sys.SearchColumn;

public interface SearchColumnDao {

	// 当前用户搜索显示字段
//	@SelectProvider(type=SearchColumnDaoImpl.class,method="editByUidAndTblname")
	
	@Select("select * from "+SEARCH_COLUMN_TABLE+" where uid = #{uid} and tblname = #{tblname} and jgid = #{jgid}")
	SearchColumn selectByUidAndTblname(@Param("uid")String uid,@Param("tblname")String tblname,@Param("jgid")String jgid);
//	
	
	// 动态更新
	@SelectProvider(type=SearchColumnDaoImpl.class,method="update")
	void update(SearchColumn bean);
	
	// 动态插入
	@SelectProvider(type=SearchColumnDaoImpl.class,method="insert")
	void insert(SearchColumn bean);
}
