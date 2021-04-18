package org.soft.erp.controller.jggly;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.sql.Result;

import org.soft.erp.controller.BaseController;
import org.soft.erp.domain.jggly.Role;
import org.soft.erp.domain.jggly.User;
import org.soft.erp.service.jggly.RoleService;
import org.soft.erp.util.common.ErpConstants;
import org.soft.erp.util.common.Md5Encrypt;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**   
 * @Description: 处理用户请求
 * <br>网站： 
 * @author 
 * @version V1.0   
 */

@Controller
@RequestMapping(value="/jggly")
public class RoleController extends BaseController{

	@Autowired
	@Qualifier("roleService")
	private RoleService roleService;
	/////////////////////////////////////////////////////////////////////////////////////////////
	
	/*
	 * 机构管理 2.分页查询
	 */
	@RequestMapping(value = "/selectRole")
	@ResponseBody
	public Object selectRole(@ModelAttribute PageModel pageModel,HttpSession session) throws Exception {
		User user = (User) session.getAttribute(ErpConstants.USER_SESSION);
		pageModel.setWhereStr(" jgid='"+user.getJgid()+"' ");
		pageModel.setFieldString(baseService.getField(pageModel.getFieldString()));
		List<Role> beans = roleService.selectRole(pageModel);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("total", pageModel.getRecordCount());
		hm.put("rows", beans);	
		return hm;
	}

	/*
	 * 代码库管理 4.执行增加
	 */
	@RequestMapping(value = "/insertRole",name="角色管理-增加")
	@ResponseBody
	public Object insertRole(@ModelAttribute Role bean, Model model,HttpSession session,HttpServletResponse response) throws Exception {
		User user=(User) session.getAttribute(ErpConstants.USER_SESSION);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		response.setContentType("text/html;charset=UTF-8");
		int count =baseService.getCount("s_rbac_role"," and (jgid='' or jgid is null or jgid='"+user.getJgid()+"') and role_id='"+bean.getRole_id()+"' ");
		if(count==0){
			bean.setJgid(user.getJgid());
			bean.setCreator(user.getXm());
			bean.setJtpye("3");
			roleService.insertRole(bean);
			hm.put("success", "true");
			hm.put("msg", "新增成功");
		}else{
			hm.put("error", "true");
			hm.put("msg", "对应的值已存在");
		}
		return hm;
	}

	/*
	 * 代码库管理 5.修改页面
	 */
	@RequestMapping(value = "/editRole")
	public void editRole(@ModelAttribute Role  bean,
			HttpServletResponse response, Model model) throws Exception {

		bean = roleService.editRole(bean.getId());
		ArrayList<Role> al = new ArrayList<Role>();
		al.add(bean);

		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		hm.put("rows", al);

		String str = JSON.toJSONString(hm); 
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println(str);
	}

	/*
	 * 代码库管理 6.执行修改
	 */
	@RequestMapping(value = "/updateRole",name="角色管理-修改")
	@ResponseBody
	public Object updateRole(@ModelAttribute Role bean,HttpSession session,HttpServletResponse response) throws Exception {
		User user=(User) session.getAttribute(ErpConstants.USER_SESSION);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		response.setContentType("text/html;charset=UTF-8");
		int count =baseService.getCount("s_rbac_role"," and (jgid='' or jgid is null or jgid='"+user.getJgid()+"') and role_id='"+bean.getRole_id()+"' and id<>"+bean.getId());
		if(count==0){
			roleService.updateRole(bean);
			hm.put("success", "true");
			hm.put("msg", "修改成功");
		}else{
			hm.put("error", "true");
			hm.put("msg", "对应的值已存在");
		}
		return  hm;
	}

	/**
	 * 代码库管理 7.执行删除
	 * */
	@RequestMapping(value = "/deletRole",name="角色管理-删除")
	public void deleteRole(String id, HttpServletResponse response,HttpSession session)
			throws Exception {
		roleService.deleteRole(id);
		response.setContentType("text/html;charset=UTF-8");
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		hm.put("msg", "删除成功");
		response.getWriter().println(JSONObject.toJSONString(hm));
	}
	@RequestMapping(value = "/getTbl")
	@ResponseBody
	public Object getTbl(HttpSession session,String id) throws Exception {
		String dx="<option value=''></option>";
		String menu_power =baseService.getSingle("select menu_power from s_rbac_role where id="+id);
		menu_power="'"+menu_power.replace(",", "','")+"'";
		Result result=baseService.query("select * from s_rbac_menu where menu_id in ("+menu_power+") and menu_sx IS NOT NULL");
		for(int h=0;h<result.getRowCount();h++){
			    Map row = result.getRows()[h];	 
				dx+="<option value='"+row.get("id")+"'>"+row.get("menu_name")+"</option>";			 
		}
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		hm.put("dx", dx);
		return hm;
	}
	@RequestMapping(value = "/getField")
	@ResponseBody
	public Object getField(HttpSession session,String rid,String mid) throws Exception {
		String dx="<table style=\"width:80%;margin:20px auto;\">";
		dx+="<tr><td style=\"width:40%;text-align:center;border:1px silver solid;\">字段名称</td><td style=\"width:60%;text-align:center;border:1px silver solid;\">显示顺序(文本框中输入数字即可根据数字由小到大顺序显示)</td></tr>";
		String menu_sx =baseService.getSingle("select menu_sx from s_rbac_menu where id="+mid);
		Result result=baseService.query("select * from s_field where hasTbl like '%|"+menu_sx+"|%' and issys=1  order by px");
		for(int h=0;h<result.getRowCount();h++){
			    Map row = result.getRows()[h];	 
			    String vaString =baseService.getSingle("select px from s_role_field where rid= "+rid+" and mid="+mid+" and field='"+row.get("enname")+"'") ;
			    dx+="<tr><td style=\"text-align:center;border:1px silver solid;\">"+row.get("chname")+"</td><td style=\"text-align:center;border:1px silver solid;\"><input type=\"text\" id=\""+row.get("enname")+"\" name=\"fieldInp\" style=\"width:50px;border:1px silver solid;\" value=\""+(vaString==null?"":vaString)+"\"></td></tr>";		 
		}
		dx+="</table>";
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		hm.put("dx", dx);
		return hm;
	}
	@RequestMapping(value = "/saveField")
	@ResponseBody
	public Object saveField(HttpSession session,String rid,String mid,String field) throws Exception {
		baseService.executeUpdate("delete from s_role_field where rid ="+rid +" and mid="+mid);
		String[] fieldString=field.split("\\|");
		for(int i=0;i<fieldString.length;i++){
			String nameString=fieldString[i].split(",")[0];
			String pxString=fieldString[i].split(",")[1];
			baseService.executeUpdate("insert into s_role_field (rid,mid,field,px) values ("+rid+","+mid+",'"+nameString+"',"+pxString+")");
		}
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		return hm;
	}
}
