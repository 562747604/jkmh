package org.soft.erp.controller.yyry;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.sql.Result;
import javax.sql.RowSet;

import org.soft.erp.controller.BaseController;
import org.soft.erp.domain.jggly.User;
import org.soft.erp.util.common.ErpConstants;
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
public class YyryController extends BaseController{
	
	/**
	 * 处理查询请求
	 * @param tableName 表名
	 * @param Model model
	 * */
	@RequestMapping(value="/yyry/main")
	public String main(HttpSession session,HttpServletResponse response,
			Model model) throws Exception{
		User user = (User)session.getAttribute(ErpConstants.USER_SESSION);
		int shsum=baseService.getCount("d_grtjbg", " and jgid='"+user.getJgid()+"'  and tid in (select id from s_tuser where jgid='"+user.getJgid()+"') and pid is not null");
		int dysum=baseService.getCount("d_grtjbg", " and jgid='"+user.getJgid()+"' and tid in (select id from s_tuser where jgid='"+user.getJgid()+"') and pid='"+user.getId()+"'");
		int shsum1=baseService.getCount("d_grtjbg", " and jgid='"+user.getJgid()+"' and tid in (select id from s_tuser where jgid='"+user.getJgid()+"') and lid is not null");
		int lqsum=baseService.getCount("d_grtjbg", " and jgid='"+user.getJgid()+"' and tid in (select id from s_tuser where jgid='"+user.getJgid()+"') and lid='"+user.getId()+"' ");
		int shsum2=baseService.getCount("d_grtjbg", " and jgid='"+user.getJgid()+"' and tid in (select id from s_tuser where jgid='"+user.getJgid()+"') and fid is not null");
		int fssum=baseService.getCount("d_grtjbg", " and jgid='"+user.getJgid()+"' and tid in (select id from s_tuser where jgid='"+user.getJgid()+"') and fid='"+user.getId()+"' ");
	    SimpleDateFormat myFmt1=new SimpleDateFormat("yyyy");
	    SimpleDateFormat myFmt2=new SimpleDateFormat("MM");
	    SimpleDateFormat myFmt3=new SimpleDateFormat("yyyy,M,d");
	    SimpleDateFormat myFmt4=new SimpleDateFormat("yyyy-MM-dd");
	    Date date = new Date();
		Date sdate=baseService.getStartMonthDate(Integer.parseInt(myFmt1.format(date)),Integer.parseInt(myFmt2.format(date)));
		Date edate=baseService.getEndMonthDate(Integer.parseInt(myFmt1.format(date)), Integer.parseInt(myFmt2.format(date)));
		int t=baseService.getDiffDays(sdate, edate);
		String mString="[";
		for(int i=0;i<t+1;i++){
			int s=baseService.getCount("d_grtjbg", " and jgid='"+user.getJgid()+"' and tid in (select id from s_tuser where jgid='"+user.getJgid()+"') and pid='"+user.getId()+"' and ptime like '%"+myFmt4.format(baseService.getNextDay(sdate, i))+"%'");
			if(mString.equals("[")){
				mString+="[ gd("+myFmt3.format(baseService.getNextDay(sdate, i))+"), "+s+" ]";
			}else{
				mString+=",[ gd("+myFmt3.format(baseService.getNextDay(sdate, i))+"), "+s+" ]";
			}
		}
		mString+="]";
		model.addAttribute("dysum", dysum);
		model.addAttribute("shsum", shsum);
		model.addAttribute("lqsum", lqsum);
		model.addAttribute("shsum1", shsum1);
		model.addAttribute("fssum", fssum);
		model.addAttribute("shsum2", shsum2);
		model.addAttribute("qst", mString);
		return "/yyry/main";
	}
	

	/**
	 * 处理查询请求
	 * @param tableName 表名
	 * @param Model model
	 * */
	@RequestMapping(value="/yyry/ttbggl")
	 public String pgywMain1(@ModelAttribute User user,HttpServletResponse response,
			 Model model) throws Exception{
		return "/yyry/ttbggl";
	}



	/**
	 * 处理查询请求
	 * @param tableName 表名
	 * @param Model model
	 * */
	@RequestMapping(value="/yyry/print")
	 public String pgywMain2(@ModelAttribute User user,HttpServletResponse response,
			 Model model) throws Exception{
		return "/yyry/print";
	}

	/**
	 * 处理查询请求
	 * @param tableName 表名
	 * @param Model model
	 * */
	@RequestMapping(value="/yyry/tj")
	 public String tj(HttpSession session,HttpServletResponse response,
			 Model model,String  start,String end) throws Exception{
		User user = (User)session.getAttribute(ErpConstants.USER_SESSION);
		Result rSet=null;
		String whereString="";
		if(start!=null&&start!=""&&!start.equals("")){
			whereString=" and ptime>='"+start+" 00:00:00' ";
		}
		if(end!=null&&end!=""&&!end.equals("")){
			whereString+=" and ptime<='"+end+" 24:00:00' ";
		}
		rSet=baseService.query("select pid,pname,count(*) c from d_grtjbg where jgid='"+user.getJgid()+"' "+whereString+" group by pid,pname order by pname");
//		if(start==null){
//			 rSet=baseService.query("select pid,pname,count(*) c from d_grtjbg where jgid='"+user.getJgid()+"' group by pid,pname order by pname");
//		}else{
//			 rSet=baseService.query("select pid,pname,count(*) c from d_grtjbg where jgid='"+user.getJgid()+"' and ptime between '"+start+"' and '"+end+"' group by pid,pname order by pname");
//		}
	
		model.addAttribute("rs", rSet);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		return "/yyry/tj";
	}
	
	
	
}
