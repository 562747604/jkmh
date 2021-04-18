package org.soft.erp.service.jggly;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.soft.erp.dao.SfieldDao;
import org.soft.erp.dao.XszdszDao;
import org.soft.erp.dao.jggly.RoleDao;
import org.soft.erp.dao.jggly.UserDao;
import org.soft.erp.dao.sys.MenuDao;
import org.soft.erp.domain.Xszdsz;
import org.soft.erp.domain.jggly.Role;
import org.soft.erp.domain.jggly.User;
import org.soft.erp.domain.sys.Menu;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("userService")
public class UserServiceImpl implements UserService{
	
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	/*
	 * *************************超级管理员-用户管理*******************************
	 */
	
	/*****************用户服务接口实现*************************************/
	/**
	 * HrmServiceImpl接口login方法实现
	 *  @see { HrmService }
	 * */
	@Transactional(readOnly=true)
	@Override
	public User login(String loginname, String password,String jcode) {			
		/*
		 * start login
		 */
		
//		password = Md5Encrypt.md5(password);
		logger.info("机构管理员登录，loginname:{}, password:{},jcode:{}", loginname, password, jcode);
		return userDao.selectByLoginnameAndPassword(loginname, password,jcode);
	}
	@Transactional(readOnly=true)
	@Override
	public User loginNur(String loginname, String password) {			
		/*
		 * start login
		 */
		
//		password = Md5Encrypt.md5(password);
		return userDao.selectByLoginnameAndPasswordNur(loginname, password);
	}	
	@Transactional(readOnly=true)
	@Override
	public User Yjyzgc(String loginname,String email,String jcode){			
		/*
		 * start login
		 */
		return userDao.selectByLoginnameAndEmail(loginname,email,jcode);
	}
	
	@Override
	public String Yjyzscyz(String loginname,String jcode){			
		 
		String yzid= userDao.Yjyzcheck(loginname,jcode);

		String yzcode= Integer.toString((int)((Math.random()*9+1)*100000));

		if (yzid==null)
		{
			userDao.insertyjyz(loginname, yzcode, jcode);
		}
		else
		{
			userDao.updateyjyz(yzid, yzcode);
		}
		return yzcode;
	}
	
	@Override
	public String Yjyzm(String loginname,String jcode){			
		 
		String yzcode= userDao.Yjyzm(loginname,jcode);		 
		return yzcode;
	}
	
	@Override
	public void deleteYjyz(String loginname,String jcode) {
		userDao.deleteyjyz(loginname,jcode);
	}

	@Autowired
	private UserDao userDao;

	@Transactional(readOnly=true)
	@Override
	public User editUser(Integer id){
		User bean = userDao.edit(id);
		return bean;
	}

	@Override
	public void insertUser(User bean){
		userDao.insert(bean);
	}
	
	@Override
	public void updateUser(User bean){
		userDao.update(bean);
	}
	
	@Override
	public void deleteUser(String id) {
		String[] ids=id.split(",");
		for(int i=0;i<ids.length;i++){
			userDao.delete(Integer.parseInt(ids[i]));
		}
	}

	@Transactional(readOnly=true)
	@Override
	public List<User> selectUser(PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
	    params.put("pageModel", pageModel);

	    //根据prams取得所有数据
		int recordCount = userDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<User> beans = userDao.select(params);
		return beans;
	}
	
	
	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	private MenuDao menuDao;
	
	@Transactional(readOnly=true)
	@Override
	public User selectUserByLoginname(String loginname,String jcode){
		return userDao.selectByLoginname(loginname,jcode);
	}

	
	@Transactional(readOnly=true)
	@Override
	public List<Role> selectByRole_id(String role_id){
		return roleDao.selectRoleByRole_id(role_id);
	}	
	
	
	@Transactional(readOnly=true)
	@Override
	public Menu selectMenuByMenu_id(String menu_id){
		return menuDao.selectByMenu_id(menu_id);
	}


	@Autowired
	private XszdszDao xszdszDao;
	
	@Transactional(readOnly=true)
	@Override
	public Xszdsz findXszdsz(String uid){
		
		//System.out.println("hrm-tableName=="+tableName);
		//System.out.println("hrm-uid=="+uid);
		
		return xszdszDao.selectByKeyword(uid);
	}
	
	

	
	/*
	 * 获取菜单权限列表
	 */
	public List<Menu> selectMenupowers(String loginname,String jgcode) {
		User user = selectUserByLoginname(loginname,jgcode);
//		System.out.println("用户角色====" + user.getRoles());
		List<Role> role = selectByRole_id(user.getRoles());
		//		System.out.println("功能列表====" + role.getMenu_power());
		String roleString="";
		for(int i=0;i<role.size();i++){
			if(roleString==""){
				roleString=role.get(i).getMenu_power();
			}else{
				roleString+=","+role.get(i).getMenu_power();
			}
		}
		String[] t=roleString.split(",");
		List<String> rList=new ArrayList<String>();
		for(int i=0;i<t.length;i++){
			if(!rList.contains(t[i])&&t[i].length()==5){
				rList.add(t[i]);
			}
		}
		roleString="";
		for(int i=0;i<rList.size();i++){
			if(roleString==""){
				roleString=rList.get(i);
			}else{
				roleString+=","+rList.get(i);
			}
		}
		List<Menu> list = new ArrayList<Menu>();
		Menu menu = null;
		StringTokenizer st = new StringTokenizer(roleString, ",");
		while (st.hasMoreTokens()) {
			String menuid = st.nextToken();
			if(menuid.length()==5){
				menu = selectMenuByMenu_id(menuid);
				//System.out.println("menu.getMenu_id()=="+menuid);
				//System.out.println("menu.getMenu_name()==="+menu.getMenu_name());
				list.add(menu);
			}
		}
		
		//System.out.println("list.size()=="+list.size());

		
		return list;
	}
	
	
	
	
	/*
	 * **************************************************************************************
	 * 导出Excel
	 */

	@Transactional(readOnly=true)
	@Override
	public List<User> selectAllUsers(String tblName,String keyword){
		return userDao.selectAllUsers(tblName,keyword);
	}
	@Transactional(readOnly=true)
	@Override
	public List<Role> selectRole(String jgid){
	    return userDao.selectRole(jgid);
	}
	
	@Autowired
	public SfieldDao sfieldDao;

	
	
	//根据Role取得用户
	public List<User> selectAllUsersByRole(){
		return userDao.selectAllUsersByRole();
	}
	
	
	
	
	
	
	
	
}
