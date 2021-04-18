package org.soft.erp.controller.sys;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.sql.Result;

import org.soft.erp.controller.BaseController;
import org.soft.erp.domain.jggly.User;
import org.soft.erp.domain.sys.Glygl;
import org.soft.erp.service.sys.GlyglService;
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
@RequestMapping(value="/sys")
public class GlyglController extends BaseController{

	@Autowired
	@Qualifier("glyglService")
	private GlyglService glyglService;
	/////////////////////////////////////////////////////////////////////////////////////////////
	/*
	 * 机构管理 1.初始化
	 */
	@RequestMapping(value = "/glygl")
	public String glygl(String tableName,String name, Model model,HttpSession session,String mid,HttpServletRequest request,HttpServletResponse response) throws Exception {
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
		return "/sys/glygl";
	}

	/*
	 * 机构管理 2.分页查询
	 */
	@RequestMapping(value = "/selectGlygl")
	@ResponseBody
	public Object selectGlygl(@ModelAttribute PageModel pageModel,HttpSession session) throws Exception {
		User user = (User) session.getAttribute(ErpConstants.USER_SESSION);
		pageModel.setWhereStr(" roles='admin' or roles like '%jggly%' ");
		pageModel.setFieldString(baseService.getField(pageModel.getFieldString()));
		List<Glygl> beans = glyglService.selectGlygl(pageModel);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("total", pageModel.getRecordCount());
		hm.put("rows", beans);	
		return hm;
	}

	/*
	 * 代码库管理 4.执行增加
	 */
	@RequestMapping(value = "/insertGlygl",name="管理员管理-增加")
	@ResponseBody
	public Object insertGlygl(@ModelAttribute Glygl bean, Model model,HttpServletResponse response,HttpSession session) throws Exception {
		User user=(User) session.getAttribute(ErpConstants.USER_SESSION);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		response.setContentType("text/html;charset=UTF-8");
		if(bean.getRoles().equals("admin")){
			int count =baseService.getCount("s_rbac_user"," and (jgid='' or jgid is null) and loginname='"+bean.getLoginname()+"'");
			if(count==0){
				bean.setRoles("admin");
				bean.setCreator(user.getXm());
				if(bean.getPassword()!=null&&!bean.getPassword().equals("")){
					bean.setPassword(Md5Encrypt.md5(bean.getPassword()));
				}
				bean.setTxPath("/images/tx/none.jpg");
				glyglService.insertGlygl(bean);
				hm.put("success", "true");
				hm.put("msg", "新增成功");
			}else{
				hm.put("error", "true");
				hm.put("msg", "对应的值已存在");
			}
		}else{
			int count =baseService.getCount("s_rbac_user"," and jgid<>'' and loginname='"+bean.getLoginname()+"'");
			if(count==0){
				bean.setCreator(user.getXm());
				if(bean.getPassword()!=null&&!bean.getPassword().equals("")){
					bean.setPassword(Md5Encrypt.md5(bean.getPassword()));
				}
				String organString=baseService.getSingle("select companyId from s_organ where jcode='"+bean.getJgid()+"'");
				String jgbm=baseService.getSingle("select jgbm from s_organ where jcode='"+bean.getJgid()+"'");
				bean.setOrganid(organString);
				bean.setJgbm(jgbm);
				bean.setTxPath("/images/tx/none.jpg");
				glyglService.insertGlygl(bean);
				hm.put("success", "true");
				hm.put("msg", "新增成功");
			}else{
				hm.put("error", "true");
				hm.put("msg", "对应的值已存在");
			}
		}

		return hm;
	}

	/*
	 * 代码库管理 5.修改页面
	 */
	@RequestMapping(value = "/editGlygl")
	public void editGlygl(@ModelAttribute Glygl  bean,
			HttpServletResponse response, Model model) throws Exception {

		bean = glyglService.editGlygl(bean.getId());
		ArrayList<Glygl> al = new ArrayList<Glygl>();
		al.add(bean);

		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		hm.put("rows", al);

		String str = JSON.toJSONString(hm); 
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println(str);
	}

	@RequestMapping(value = "/showGlygl")
	public void showGlygl(@ModelAttribute Glygl  bean,
			HttpServletResponse response, Model model) throws Exception {

		bean = glyglService.editGlygl(bean.getId());
		bean.setJgid(baseService.getSingle("select companyName from s_organ where jcode ='"+bean.getJgid()+"'"));
		bean.setRoles(baseService.getSingle("select role_name from s_rbac_role where role_id in ('"+bean.getRoles().replace(",", "','")+"')"));
		ArrayList<Glygl> al = new ArrayList<Glygl>();
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
	@RequestMapping(value = "/updateGlygl",name="管理员管理-修改")
	@ResponseBody
	public Object updateGlygl(@ModelAttribute Glygl bean,HttpServletResponse response,HttpSession session) throws Exception {
		User user=(User) session.getAttribute(ErpConstants.USER_SESSION);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		response.setContentType("text/html;charset=UTF-8");
		int count =baseService.getCount("s_rbac_user"," and (jgid='' or jgid is null) and loginname='"+bean.getLoginname()+"' and id<>"+bean.getId());
		if(count==0){
			if(bean.getPassword()!=null&&!bean.getPassword().equals("")){
				bean.setPassword(Md5Encrypt.md5(bean.getPassword()));
			}
			String organString=baseService.getSingle("select companyId from s_organ where jcode='"+bean.getJgid()+"'");
			String jgbm=baseService.getSingle("select jgbm from s_organ where jcode='"+bean.getJgid()+"'");
			bean.setOrganid(organString);
			bean.setJgbm(jgbm);
			glyglService.updateGlygl(bean);
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
	@RequestMapping(value = "/deleteGlygl",name="管理员管理-删除")
	public void deleteGlygl(String id, HttpServletResponse response,HttpSession session)
			throws Exception {
		glyglService.deleteGlygl(id);
		response.setContentType("text/html;charset=UTF-8");
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		response.getWriter().println(JSONObject.toJSONString(hm));
	}
}
