package org.soft.erp.controller.yxry;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.soft.erp.controller.BaseController;
import org.soft.erp.domain.jggly.User;
import org.soft.erp.domain.sys.Organ;
import org.soft.erp.util.common.ErpConstants;
import org.soft.erp.util.http.user.getDxInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**   
 * @Description: 处理用户请求
 * <br>网站： 
 * @author 
 * @version V1.0   
 */

@Controller
public class YxryController extends BaseController{
	
	/**
	 * 处理查询请求
	 * @param tableName 表名
	 * @param Model model
	 * */
	@RequestMapping(value="/yxry/main")
	 public String main(HttpServletResponse response,
			 Model model,HttpSession session) throws Exception{
		User user = (User) session.getAttribute(ErpConstants.USER_SESSION);
		Organ organ=(Organ)session.getAttribute("organ");
		SimpleDateFormat myFmt1=new SimpleDateFormat("yyyy");
	    SimpleDateFormat myFmt2=new SimpleDateFormat("MM");
	    SimpleDateFormat myFmt3=new SimpleDateFormat("yyyy,M,d");
	    SimpleDateFormat myFmt4=new SimpleDateFormat("yyyy-MM-dd");
	    Date date = new Date();
		Date sdate=baseService.getStartMonthDate(Integer.parseInt(myFmt1.format(date)),Integer.parseInt(myFmt2.format(date)));
		Date edate=baseService.getEndMonthDate(Integer.parseInt(myFmt1.format(date)), Integer.parseInt(myFmt2.format(date)));
		int sum=baseService.getCount("d_yjfs", "and jgid='"+user.getJgid()+"' and juid in (select uid from s_tuser where jgid='"+user.getJgid()+"') and tslx='营销' and ftime BETWEEN '"+myFmt4.format(sdate)+"' and '"+myFmt4.format(edate)+"'  group by juid");
		model.addAttribute("yxry", sum);
		sum=baseService.getCount("d_yjfs", " and jgid='"+user.getJgid()+"' and juid in (select uid from s_tuser where jgid='"+user.getJgid()+"') and tsfs='短信' and tslx='营销' and ftime BETWEEN '"+myFmt4.format(sdate)+"' and '"+myFmt4.format(edate)+"'");
		model.addAttribute("yxdx", sum);
		sum=baseService.getCount("d_yjfs", " and jgid='"+user.getJgid()+"' and juid in (select uid from s_tuser where jgid='"+user.getJgid()+"') and tsfs='邮件' and tslx='营销' and ftime BETWEEN '"+myFmt4.format(sdate)+"' and '"+myFmt4.format(edate)+"'");
		model.addAttribute("sumyj", sum);
		model.addAttribute("sumDx", getDxInfo.dxsy(organ.getCompanyId()));
		sum=baseService.getCount("d_yjfs", " and jgid='"+user.getJgid()+"' and juid in (select uid from s_tuser where jgid='"+user.getJgid()+"') and tsfs='APP' and tslx='营销' and ftime BETWEEN '"+myFmt4.format(sdate)+"' and '"+myFmt4.format(edate)+"'");
		model.addAttribute("hasDx",sum);
		int t=baseService.getDiffDays(sdate, edate);
		String mString="[";
		for(int i=0;i<t+1;i++){
			int s=baseService.getCount("d_yjfs", " and jgid='"+user.getJgid()+"' and juid in (select uid from s_tuser where jgid='"+user.getJgid()+"') and tsfs='短信' and tslx='营销' and ftime like '%"+myFmt4.format(baseService.getNextDay(sdate, i))+"%'");
			if(mString.equals("[")){
				mString+="[ gd("+myFmt3.format(baseService.getNextDay(sdate, i))+"), "+s+" ]";
			}else{
				mString+=",[ gd("+myFmt3.format(baseService.getNextDay(sdate, i))+"), "+s+" ]";
			}
		}
		mString+="]";
		model.addAttribute("qst", mString);
		return "/yxry/main";
	}

	/**
	 * 处理查询请求
	 * @param tableName 表名
	 * @param Model model
	 * */
	@RequestMapping(value="/yxry/dxgl")
	 public String dxgl(@ModelAttribute User user,HttpServletResponse response,
			 Model model) throws Exception{
		return "/yxry/dxgl";
	}

	
	/**
	 * 处理查询请求
	 * @param tableName 表名
	 * @param Model model
	 * */
	@RequestMapping(value="/yxry/tongji")
	 public String tongji(@ModelAttribute User user,HttpServletResponse response,
			 Model model) throws Exception{
		return "/yxry/tongji";
	}

	
	
}
