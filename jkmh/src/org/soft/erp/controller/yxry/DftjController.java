package org.soft.erp.controller.yxry;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.soft.erp.controller.BaseController;
import org.soft.erp.domain.jggly.Dxfsjl;
import org.soft.erp.domain.jggly.User;
import org.soft.erp.service.yxry.DftjService;
import org.soft.erp.util.common.ErpConstants;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 * @Description: 超级管理员 <br>
 *               ：
 * @author 
 * @version V1.0
 */

@Controller
@RequestMapping(value="/yxry")
public class DftjController extends BaseController{

	@Autowired
	@Qualifier("dftjService")
	private DftjService dftjService;

	/*
	 * ***********************************机构管理***********************************
	 * *******
	 */

	/*
	 * 机构管理 1.初始化
	 */
	@RequestMapping(value = "/dftj")
	public String dxfsjl(String tableName, String name,Model model,HttpSession session,String mid,HttpServletRequest request,HttpServletResponse response) throws Exception {
		//取得检索字段JSON
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
		model.addAttribute("qxBtn",baseService.boolDis(user.getRoles(), "04-06-001"));
		model.addAttribute("searchs", searchColumnJson);
		model.addAttribute("currentSearchColumnJson", currentSearchColumnJson);

		model.addAttribute("fields", currentToggleColumnJson);
		return "/yxry/dftj";
	}

	/*
	 * 机构管理 2.分页查询
	 */
	@RequestMapping(value = "/selectDftj")
	@ResponseBody
	public Object selectDftj(@ModelAttribute PageModel pageModel,
			HttpServletResponse response, Model model,HttpSession session) throws Exception {
		User user = (User) session.getAttribute(ErpConstants.USER_SESSION);
		pageModel.setWhereStr(" jgid='"+user.getJgid()+"' and zt='待发送'");
		pageModel.setFieldString(baseService.getField(pageModel.getFieldString()));
		List<Dxfsjl> beans = dftjService.selectDftj(pageModel);
		for(int i=0;i<beans.size();i++){
			String temp="";
			if(beans.get(i).getFtime()!=null&&beans.get(i).getFtime()!=""){
				temp=beans.get(i).getFtime().substring(0,beans.get(i).getFtime().length()-2);
				beans.get(i).setFtime(temp);
			}
			if(beans.get(i).getStime()!=null&&beans.get(i).getStime()!=""){
				temp=beans.get(i).getStime().substring(0,beans.get(i).getStime().length()-2);
				beans.get(i).setStime(temp);
			}
		}
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("total", pageModel.getRecordCount());
		hm.put("rows", beans);	
		return hm;
	}
	
	@RequestMapping(value = "/deletDftj",name="待发统计-取消发送")
	public void deletDftj(String id, HttpServletResponse response,HttpSession session)
			throws Exception {
		baseService.executeUpdate("delete from d_yjfs where id in ("+id+")");
		response.setContentType("text/html;charset=UTF-8");
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		hm.put("msg", "取消成功");
		response.getWriter().println(JSONObject.toJSONString(hm));
	}
}
