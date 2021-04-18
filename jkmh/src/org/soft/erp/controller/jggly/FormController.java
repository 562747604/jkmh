package org.soft.erp.controller.jggly;

import javax.servlet.http.HttpSession;

import org.soft.erp.controller.BaseController;
import org.soft.erp.util.common.ErpConstants;
import org.soft.erp.util.common.SysProp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**   
 * @Description: 
 * <br>网站： 
 * @author    
 * @date 2015年8月13日 下午8:30:37 
 * @version V1.0   
 */

/**
 * 动态页面跳转控制器
 * */
@Controller
public class FormController extends  BaseController {

	/**
	 * 登录根据机构代码跳转
	 * @param companyId 机构Id
	 * @param mv 模型
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/{companyId}")
	public ModelAndView companyLogin(@PathVariable String companyId,
			ModelAndView mv, HttpSession session) {

		//需要确定companyId的规则，根据规则再做判断
		//if (companyId.indexOf("sy") != -1) {
			mv.addObject("companyId", companyId);
//			if(companyId!=null&&!companyId.equals("")){
//				companyId=baseService.getSingle("select jcode from s_organ where jgbm='"+companyId+"'");
//				session.setAttribute("companyId", companyId);
//			}
			
			mv.setViewName("/user/loginForm");
		//}
		// 动态跳转页面
		return mv;
	}
	

	/**
	 * 跳转到登陆页
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/user/loginForm")
	public ModelAndView loginForm(ModelAndView mv){
		mv.setViewName("/user/loginForm");
		return mv;
	}	


	/**
	 * 处理退出请求
	 * @param HttpSession session 
	 * @param String companyId 机构编码
	 * @return 跳转的视图
	 * */
	@RequestMapping(value="/user/logout")
	public ModelAndView logout(HttpSession session,ModelAndView mv,String companyId){
		session.removeAttribute(ErpConstants.USER_SESSION);
		session.removeAttribute("companyId");
		session.invalidate();
		companyId=baseService.getSingle("select jgbm from s_organ where jcode='"+companyId+"'");
		//System.out.println("companyId==="+companyId);
		if(companyId==null||companyId.equals("null")){
			mv.setViewName("redirect:/");
		}else{
			mv.setViewName("redirect:/"+companyId);
		}
		return mv;
	}
	
	
}
