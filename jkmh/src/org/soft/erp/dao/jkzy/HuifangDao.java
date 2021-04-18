package org.soft.erp.dao.jkzy;

import static org.soft.erp.util.common.ErpConstants.USER_TABLE;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.jstl.sql.Result;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.domain.jggly.Dxfsjl;
import org.soft.erp.domain.jggly.Ryfp;
import org.soft.erp.domain.jggly.User;
import org.soft.erp.domain.jkzy.Hfjl;

public interface HuifangDao {
	@SelectProvider(type=HuifangDaoImpl.class,method="insertHfjl")
	void insertHfjl(Hfjl hfjl);
			
	@SelectProvider(type=HuifangDaoImpl.class,method="getHfjls")
	List<Hfjl> getHfjls(String where);
	
	@SelectProvider(type=HuifangDaoImpl.class,method="insertXxfs")
	void insertXxfs(Dxfsjl dxfsjl);
	
	@SelectProvider(type=HuifangDaoImpl.class,method="selectXxfsByZtandtsfs")
	 List<Dxfsjl> selectXxfsByZtandtsfs(String zt,String tsfs,String mc,String nr);
	
	//修改推送信息状态
	@SelectProvider(type=HuifangDaoImpl.class,method="updateyjfs")
	void updateyjfs(String id);
	
}
