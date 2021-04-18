package org.soft.erp.service.jggly;

import java.io.IOException;
import java.util.List;

import org.soft.erp.domain.Xszdsz;
import org.soft.erp.domain.jggly.Role;
import org.soft.erp.domain.jggly.User;
import org.soft.erp.domain.sys.Menu;
import org.soft.erp.util.tag.PageModel;

public interface UserService{
	/**
	 * 超级管理员-机构管理
	 * */
//	public User addUser();
	public User editUser(Integer id);
	public void insertUser(User bean);
	public void updateUser(User bean);
	public void deleteUser(String id);
	public List<User> selectUser(PageModel pageModel);
	
//	public  List<Sfield> selectByTablename(String tblname);

		User login(String loginname,String password,String jcode);
		User loginNur(String loginname,String password);
	User Yjyzgc(String loginname,String email,String jcode);
    String Yjyzscyz(String loginname,String jcode);
    public String Yjyzm(String loginname,String jcode);
    public void deleteYjyz(String loginname,String jcode);
	public Xszdsz findXszdsz(String uid);
	public User selectUserByLoginname(String loginname,String jcode);
	public List<Role> selectByRole_id(String role_id);
	public Menu selectMenuByMenu_id(String menu_id);
	
	public List<Menu> selectMenupowers(String loginname,String jcode);

	public List<User> selectAllUsers(String tblName,String keyword);

	public List<Role> selectRole(String jgid);
	public List<User> selectAllUsersByRole();

}
