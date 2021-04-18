package org.soft.erp.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.sys.SearchColumn;

/**   
 * @Description: UserMapper接口

 * @version V1.0   
 */
public interface SfieldDao { 

	@Select("select * from "+"s_field"+" where tblname= #{tblname} and issys=1")
	List<Sfield> selectByTablename(String tblname);

	@Select("select * from "+"s_field"+" where tblname= #{tblname}  and issys=1 order by px")
	List<Sfield> selectByTablenameAndIsSys(String tblname);

	@Select("select * from "+"s_field"+" where tblname= #{tblname} and hasTbl like #{hasTbl} and issys=1 order by px")
	List<Sfield> selectByTablenameAndIsSys1(@Param("tblname")String tblname,@Param("hasTbl")String hasTbl);
	
	@Select("select * from "+"s_field"+" where tblname= #{tblname} and issys=1 and hasTbl like #{hasTbl} order by px")
	List<Sfield> selectByTablenameAndIsSysTbl(@Param("tblname")String tblname,@Param("hasTbl")String hasTbl);
	
	@Select("select * from "+"s_field"+" where tblname= #{tblname} and enname= #{enname}")
	Sfield selectByTblnameAndEnname(@Param("tblname")String tblname,@Param("enname")String enname);

	@Select("select * from "+"s_field"+" where tblname= #{tblname} and (kjtype=1 or kjtype=2 or kjtype=3) and issys=1")
	List<Sfield> selectByTablenameAndKjtype(String tblname);
	
	@Select("select * from "+"s_field"+" where tblname= #{tblname} and (kjtype=1 or kjtype=2 or kjtype=3) and issys=1 and hasTbl like #{hasTbl} order by px")
	List<Sfield> selectByTablenameAndKjtypeTbl(@Param("tblname")String tblname,@Param("hasTbl")String hasTbl);
	
	@Select("select * from "+"s_field"+" where tblname= #{tblname} and chname= #{cnname}")
	Sfield selectByTblnameAndCnname(@Param("tblname")String tblname,@Param("cnname")String cnname);

}
