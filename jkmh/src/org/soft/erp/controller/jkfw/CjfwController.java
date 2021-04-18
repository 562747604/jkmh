package org.soft.erp.controller.jkfw;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.sql.Result;

import org.soft.erp.controller.BaseController;
import org.soft.erp.domain.jggly.Ryfp;
import org.soft.erp.domain.jggly.User;
import org.soft.erp.service.jkfw.CjfwService;
import org.soft.erp.util.common.ErpConstants;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**   
 * @Description: 处理用户请求
 * <br>网站： 
 * @author 
 * @version V1.0   
 */

@Controller
@RequestMapping(value="/jkfw")
public class CjfwController extends BaseController{

	@Autowired
	@Qualifier("cjfwService")
	private CjfwService cjfwService;
	/////////////////////////////////////////////////////////////////////////////////////////////
	

	/*
	 * 机构管理 2.分页查询
	 */
	@RequestMapping(value = "/selectCjfw")
	@ResponseBody
	public Object selectCjfw(@ModelAttribute PageModel pageModel,HttpSession session) throws Exception {
		User user = (User) session.getAttribute(ErpConstants.USER_SESSION);
		String js=baseService.boolDis(user.getRoles(), "02-02-002").trim();
		if (js.equals("") || js==null ||js.length()==0)
		{
			pageModel.setWhereStr(" jgid='"+user.getJgid()+"'  and  fwzt is not null");
			//System.out.println("where=jgid='"+user.getJgid()+"' and (zjid='"+user.getId()+"' or zjid is null )");
		}
		else
		{
			pageModel.setWhereStr(" jgid='"+user.getJgid()+"'  and   fwzt='待选择' ");
		}
		
		pageModel.setFieldString(baseService.getField(pageModel.getFieldString()));
		List<Ryfp> beans = cjfwService.selectCjfw(pageModel);
		for(int i=0;i<beans.size();i++){
			String temp="";
			if(beans.get(i).getKsrq()!=null&&beans.get(i).getKsrq()!=""){
				temp=beans.get(i).getKsrq().substring(0,beans.get(i).getKsrq().length()-2);
				beans.get(i).setKsrq(temp);
			}
			if(beans.get(i).getDqrq()!=null&&beans.get(i).getDqrq()!=""){
				temp=beans.get(i).getDqrq().substring(0,beans.get(i).getDqrq().length()-2);
				beans.get(i).setDqrq(temp);
			}
		}
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("total", pageModel.getRecordCount());
		hm.put("rows", beans);	
		return hm;
	}

	/*
	 * 代码库管理 6.执行修改
	 */
	@RequestMapping(value = "/updateCjfw",name="促进服务-修改")
	@ResponseBody
	public Object updateCjfw(@ModelAttribute Ryfp bean,HttpSession session) throws Exception {
		cjfwService.updateCjfw(bean);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		return hm;
	}
	
	/*
	 * 代码库管理 6.执行修改
	 */
	@RequestMapping(value = "/updateJkzj",name="促进服务-修改专员")
	@ResponseBody
	public Object updateJkzj(String ids,@ModelAttribute Ryfp bean,HttpSession session) throws Exception {
	
		User user=(User) session.getAttribute(ErpConstants.USER_SESSION);
		//System.out.println("Jobtitle='"+user.getJobtitle());
		String[] idStrings=ids.split(",");
		int status=0;
		int status1=0;
		for(int i=0;i<idStrings.length;i++){
			String zjidString=baseService.getSingle("select zyid from s_tuser where id="+idStrings[i]);
			if(zjidString==null||zjidString.equals("")){
				cjfwService.updateJkzj1(idStrings[i],user.getId()+"",user.getXm(),user.getJobtitle());
				status+=1;
			}else{
				status1+=1;
			}
		}		
        
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		hm.put("status", status);
		hm.put("status1", status1);
		return hm;
	}
	
	/*
	 * 代码库管理 6.执行修改
	 */
	@RequestMapping(value = "/delJkzj",name="促进服务-删除专员")
	@ResponseBody
	public Object delJkzj(String ids,@ModelAttribute Ryfp bean,HttpSession session) throws Exception {
		
		User user=(User) session.getAttribute(ErpConstants.USER_SESSION);
		cjfwService.updateJkzj1(ids,"","","");

		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		return hm;
	}
	
	/*
	 * 代码库管理 6.执行修改
	 */
	@RequestMapping(value = "/updateFwzt",name="促进服务-服务中")
	@ResponseBody
	public Object updateFwzt(String id,@ModelAttribute Ryfp bean,HttpSession session) throws Exception {
		
		cjfwService.updateFwzt(id);

		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		return hm;
	}
	
	/*
	 * 代码库管理 6.执行修改
	 */
	@RequestMapping(value = "/addFc",name="促进服务-加入复查")
	@ResponseBody
	public Object addFc(String id,@ModelAttribute Ryfp bean,HttpSession session) throws Exception {
		
		User user=(User) session.getAttribute(ErpConstants.USER_SESSION);
		Result rs=baseService.query("select * from s_tuser where id="+id);
		Result rs1=baseService.query("select * from s_fcuser where uid="+id +" and fczt='未完成' ");
		HashMap<String, Object> hm = new HashMap<String, Object>();
		if(rs1.getRowCount()==0){
			cjfwService.addFc(id,user.getId()+"",user.getXm(),rs);
			hm.put("success", "true");
			hm.put("msg", "加入成功");
		}else{
			//System.out.println("3");
			hm.put("success", "true");
			hm.put("msg", "此用户已加入复查");
		}	
		return hm;
	}
}
