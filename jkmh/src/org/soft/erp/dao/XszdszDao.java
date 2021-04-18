package org.soft.erp.dao;



import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.soft.erp.dao.provider.XszdszDaoImpl;
import org.soft.erp.domain.Xszdsz;

/**   
 * @Description: UserMapper接口
 * <br>网站：
 * @author  
 * @version V1.0   
 */
public interface XszdszDao {
		
	// 动态修改用户
	@SelectProvider(type=XszdszDaoImpl.class,method="update")
	void update(Xszdsz Xszdsz);
	
	// 动态插入用户
	@SelectProvider(type=XszdszDaoImpl.class,method="insert")
	void insert(Xszdsz Xszdsz);

	@Select("select * from d_xszdsz where id = #{id}")
	Xszdsz selectByKeyword(String id);

}
