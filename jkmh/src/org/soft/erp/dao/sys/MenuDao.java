package org.soft.erp.dao.sys;

import static org.soft.erp.util.common.ErpConstants.MENU_TABLE;

import org.apache.ibatis.annotations.Select;
import org.soft.erp.domain.sys.Menu;

public interface MenuDao {
	
	// 根据id查询用户
	@Select("select * from "+MENU_TABLE+" where menu_id = #{menu_id}")
	Menu selectByMenu_id(String menu_id);
	

	// 动态查询
	
	
}
