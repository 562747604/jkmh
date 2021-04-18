package org.soft.erp.controller.sys;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.soft.erp.controller.BaseController;
import org.soft.erp.domain.jggly.User;
import org.soft.erp.domain.sys.Organ;
import org.soft.erp.service.sys.OrganService;
import org.soft.erp.util.common.ErpConstants;
import org.soft.erp.util.http.user.Company;
import org.soft.erp.util.http.user.HttpCompany;
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
 * @Description: 超级管理员 <br>
 *               ：
 * @author 
 * @version V1.0
 */

@Controller
@RequestMapping("/sys")
public class OrganController extends BaseController{

	@Autowired
	@Qualifier("organService")
	private OrganService organService;

	/*
	 * ***********************************机构管理***********************************
	 * *******
	 */

	/*
	 * 机构管理 1.初始化
	 */
	@RequestMapping(value = "/organ")
	public String organ(String tableName,String name, Model model,HttpSession session,String mid,HttpServletRequest request,HttpServletResponse response) throws Exception {
		User user = (User) session.getAttribute(ErpConstants.USER_SESSION);
		if(user==null){
			//return "/user/loginForm";
			PrintWriter out = response.getWriter();  
			out.println("<html>");      
			out.println("<script>");      
			out.println("window.open ('"+request.getContextPath()+"/user/loginForm?message=长时间未操作,请重新登录','_top')");      
			out.println("</script>");      
			out.println("</html>");    
			return "";  
		}
		String uid = user.getLoginname();
		//取得当前用户的toggleColumnJson
		//String currentToggleColumnJson = columnService.getCurrentToggleColumnJson(uid,tableName,name);

		//取得searchColumnJson
		//String searchColumnJson = columnService.getSearchColumnJson(uid,tableName,name,"",user.getJgid());

		//取得当前currentSearchColumnJson
		//String currentSearchColumnJson = columnService.getCurrentSearchColumnJson(uid,tableName,name,"",user.getJgid());
		String currentToggleColumnJson = columnService.getCurrentToggleColumnJson1(uid,tableName,name,mid,user.getJgid());

		//取得searchColumnJson
		String searchColumnJson = columnService.getSearchColumnJson1(uid,tableName,name,"",user.getJgid(),mid);

		//取得当前currentSearchColumnJson
		String currentSearchColumnJson = columnService.getCurrentSearchColumnJson1(uid,tableName,name,"",user.getJgid(),mid);

		model.addAttribute("searchs", searchColumnJson);
		model.addAttribute("currentSearchColumnJson", currentSearchColumnJson);

		model.addAttribute("fields", currentToggleColumnJson);
		return "/sys/organ";
	}
	@RequestMapping(value = "/organself")
	public String organself(String tableName,String name, Model model,HttpSession session,String mid,HttpServletRequest request,HttpServletResponse response) throws Exception {
		User user = (User) session.getAttribute(ErpConstants.USER_SESSION);
		if(user==null){
			//return "/user/loginForm";
			PrintWriter out = response.getWriter();  
			out.println("<html>");      
			out.println("<script>");      
			out.println("window.open ('"+request.getContextPath()+"/user/loginForm?message=长时间未操作,请重新登录','_top')");      
			out.println("</script>");      
			out.println("</html>");    
			return "";  
		}
		String uid = user.getLoginname();
		//取得当前用户的toggleColumnJson
		//String currentToggleColumnJson = columnService.getCurrentToggleColumnJson(uid,tableName,name);

		//取得searchColumnJson
		//String searchColumnJson = columnService.getSearchColumnJson(uid,tableName,name,"",user.getJgid());

		//取得当前currentSearchColumnJson
		//String currentSearchColumnJson = columnService.getCurrentSearchColumnJson(uid,tableName,name,"",user.getJgid());
		String currentToggleColumnJson = columnService.getCurrentToggleColumnJson1(uid,tableName,name,mid,user.getJgid());

		//取得searchColumnJson
		String searchColumnJson = columnService.getSearchColumnJson1(uid,tableName,name,"",user.getJgid(),mid);

		//取得当前currentSearchColumnJson
		String currentSearchColumnJson = columnService.getCurrentSearchColumnJson1(uid,tableName,name,"",user.getJgid(),mid);

		//model.addAttribute("searchs", searchColumnJson);
		model.addAttribute("currentSearchColumnJson", currentSearchColumnJson);

		model.addAttribute("fields", currentToggleColumnJson);
		model.addAttribute("editBtn",baseService.boolDis(user.getRoles(), "05-09-001"));
		model.addAttribute("scBtn",baseService.boolDis(user.getRoles(), "05-09-002"));
		model.addAttribute("tbBtn",baseService.boolDis(user.getRoles(), "05-09-003"));
		return "/jggly/organself";
	}
	/*
	 * 机构管理 2.分页查询
	 */
	@RequestMapping(value = "/selectOrgan")
	@ResponseBody
	public Object selectOrgan(@ModelAttribute PageModel pageModel) throws Exception {
		pageModel.setFieldString(baseService.getField(pageModel.getFieldString()));
		pageModel.setWhereStr(" 1=1 ");
		List<Organ> beans = organService.selectOrgan(pageModel);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("total", pageModel.getRecordCount());
		hm.put("rows", beans);	
		return hm;
	}
	/*
	 * 机构管理 2.分页查询
	 */
	@RequestMapping(value = "/selectOrganself")
	@ResponseBody
	public Object selectOrganself(@ModelAttribute PageModel pageModel,HttpSession session) throws Exception {
		User user = (User) session.getAttribute(ErpConstants.USER_SESSION);
		pageModel.setWhereStr(" jcode='"+user.getJgid()+"' ");
		pageModel.setFieldString(baseService.getField(pageModel.getFieldString()));
		List<Organ> beans = organService.selectOrgan(pageModel);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("total", pageModel.getRecordCount());
		hm.put("rows", beans);	
		return hm;
	}
	/*
	 * 代码库管理 4.执行增加
	 */
	@RequestMapping(value = "/insertOrgan",name="机构管理-增加")
	@ResponseBody
	public Object insertOrgan(@ModelAttribute Organ bean, Model model,HttpServletRequest request,HttpSession session,HttpServletResponse response){
		HashMap<String, Object> hm = new HashMap<String, Object>();
		User user=(User) session.getAttribute(ErpConstants.USER_SESSION);
		response.setContentType("text/html;charset=UTF-8");
		int count =baseService.getCount("s_organ"," and jcode='"+bean.getJcode()+"' ");
		if(count==0){
			bean.setCreator(user.getXm());
			organService.insertOrgan(bean);
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
	@RequestMapping(value = "/editOrgan")
	public void editOrgan(@ModelAttribute Organ bean,
			HttpServletResponse response, Model model) throws Exception {

		bean = organService.editOrgan(bean.getId());
		ArrayList<Organ> al = new ArrayList<Organ>();
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
	@RequestMapping(value = "/updateOrgan",name="机构管理-修改")
	@ResponseBody
	public Object updateOrgan(@ModelAttribute Organ bean,HttpSession session,HttpServletResponse response) throws Exception {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		User user=(User) session.getAttribute(ErpConstants.USER_SESSION);
		response.setContentType("text/html;charset=UTF-8");
		int count =baseService.getCount("s_organ"," and jcode='"+bean.getJcode()+"' and id<> "+bean.getId());
		if(count==0){
			bean.setCreator(user.getXm());
			organService.updateOrgan(bean);
			hm.put("success", "true");
			hm.put("msg", "修改成功");
		}else{
			hm.put("error", "true");
			hm.put("msg", "对应的值已存在");
		}
		return hm;
	}

	/**
	 * 代码库管理 7.执行删除
	 * */
	@RequestMapping(value = "/deleteOrgan",name="机构管理-删除")
	public void deleteOrgan(String id, HttpServletResponse response,HttpSession session)
			throws Exception {
		organService.deleteOrgan(id);
		response.setContentType("text/html;charset=UTF-8");
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		response.getWriter().println(JSONObject.toJSONString(hm));
	}





	@RequestMapping(value = "/tbOrgan")
	@ResponseBody
	public Object tbOrgan(HttpSession session, String tblname,
			String clickColumn) throws Exception {

		//System.out.println("clickColumn==="+clickColumn);

		User user = (User) session.getAttribute(ErpConstants.USER_SESSION);
		List<Company> listCompany =HttpCompany.getCompany();
		for(int i=0;i<listCompany.size();i++){
			baseService.executeUpdate("update s_organ set companyName='"+(listCompany.get(i).getName()==null?"":listCompany.get(i).getName())+"',remark='"+(listCompany.get(i).getDescription()==null?"":listCompany.get(i).getDescription())+"' where companyId='"+(listCompany.get(i).getCompanyId()==null?"":listCompany.get(i).getCompanyId())+"'");
		}
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		return hm;
	}
	@RequestMapping(value = "/tbOrganself")
	@ResponseBody
	public Object tbOrganself(HttpSession session, String tblname,
			String clickColumn) throws Exception {

		//System.out.println("clickColumn==="+clickColumn);

		User user = (User) session.getAttribute(ErpConstants.USER_SESSION);
		List<Company> listCompany =HttpCompany.getCompany();
		for(int i=0;i<listCompany.size();i++){
			if(listCompany.get(i).getCompanyId().equals(user.getJgid())){
				baseService.executeUpdate("update s_organ set companyName='"+(listCompany.get(i).getName()==null?"":listCompany.get(i).getName())+"',remark='"+(listCompany.get(i).getDescription()==null?"":listCompany.get(i).getDescription())+"' where companyId='"+(listCompany.get(i).getCompanyId()==null?"":listCompany.get(i).getCompanyId())+"'");
			}
		}
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		return hm;
	}
}
