package org.soft.erp.service.yxry;

import java.util.List;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.yxry.Group;
import org.soft.erp.util.tag.PageModel;

public interface GroupService{
	/**
	 * 超级管理员-机构管理
	 * */
//	public Organ addOrgan();
	public Group editGroup(Integer id);
	public void insertGroup(Group bean);
	public void updateGroup(Group bean);
	public void deleteGroup(String id);
	public List<Group> selectGroup(PageModel pageModel);
	
	public  List<Sfield> selectByTablename(String tblname);


}
