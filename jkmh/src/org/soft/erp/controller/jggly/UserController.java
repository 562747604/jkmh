package org.soft.erp.controller.jggly;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.eclipse.core.filesystem.provider.FileInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.soft.erp.controller.BaseController;
import org.soft.erp.domain.Sfield;
import org.soft.erp.domain.VerifyCode;
import org.soft.erp.domain.jggly.Role;
import org.soft.erp.domain.jggly.User;
import org.soft.erp.domain.sys.Menu;
import org.soft.erp.domain.sys.Organ;
import org.soft.erp.service.sys.OrganService;
import org.soft.erp.util.common.ErpConstants;
import org.soft.erp.util.common.ExcelUtils;
import org.soft.erp.util.common.Md5Encrypt;
import org.soft.erp.util.common.SysProp;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

/**   
 * @Description: ??????????????????
 * <br>????????? 
 * @author 
 * @version V1.0   
 */

@Controller
@RequestMapping("/user")
public class UserController extends BaseController{
	@Autowired
	@Qualifier("organService")
	public OrganService organService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	/**
	 * ??????????????????
	 * @param String loginname ?????????
	 * @param String password ??????
	 * @param String verifycode ?????????,??????????????????
	 * @return ???????????????
	 * */

	/*	public ModelAndView login(@RequestParam("loginname") String loginname,
			@RequestParam("password") String password,String verifycode,String companyId,
			HttpSession session,
			ModelAndView mv,HttpServletRequest request){

		String viewName="";
		//???????????????
		String v =(String)session.getAttribute("VERIFYCODE");
		if(!verifycode.equalsIgnoreCase(v))
		{
			//companyId???=null???????????????,????????????????????????
			if(companyId!=null&&companyId.trim().length()==3)
				mv.addObject("companyId", companyId);
			viewName = "/user/loginForm";
			mv.setViewName(viewName);
			mv.addObject("message","?????????????????????!");
			return mv;
		}

		//??????????????????,????????????????????????????????????,???2???:????????????,???????????????
		User user = null;
		if(companyId!=null&&companyId.trim().length()==3){
			user = userService.login(loginname, Md5Encrypt.md5(password),companyId);
		}else{
			user = userService.login(loginname, Md5Encrypt.md5(password),"");
		}
		if(user == null){
			if(companyId!=null&&companyId.trim().length()==3)
				mv.addObject("companyId", companyId);
			viewName = "/user/loginForm";
			mv.addObject("message","????????????????????????!");
		}else{
			// ??????????????????HttpSession??????
			session.setAttribute(ErpConstants.USER_SESSION, user);
			Ulog ulog = new Ulog();
			ulog.setUname(user.getXm());
			ulog.setOtime(new java.sql.Date(System.currentTimeMillis()));

			ulog.setJgid(user.getJgid());
			ulog.setUid(user.getId());
			ulog.setMkname("????????????");
			ulog.setNr(request.getRemoteAddr());
			logService.insertUlog(ulog);

			Organ organ=null;
			if(user.getJgid()==null||user.getJgid().equals("")){
				organ=new Organ();
				organ.setCompanyName("????????????");
				organ.setCompanySName("??????");
				organ.setJcode("default");
				organ.setLogo("images/logo/default.png");
				viewName = "/user/main";
			}else{
				organ=organService.getOrgan(user.getJgid());
				if(user.getRoles().equals("nurse")){
					viewName = "/nurse/main";
				}else{
					viewName = "/user/main";
				}
			}
			session.setAttribute("organ", organ);
			//????????????????????????
			List<Menu> menulist = userService.selectMenupowers(loginname,user.getJgid());
			// ??????????????????main??????
			mv.addObject("menulist",menulist);
			//mv.setViewName("redirect:/user/main");//???menu?????????ajax			
		}
		mv.setViewName(viewName);
		return mv;
	}*/
	@RequestMapping(value="/login")
	@ResponseBody
	public Object login(String loginname,
			String password,String verifycode,String companyId,
			HttpSession session,
			HttpServletRequest request){
		logger.info("????????????????????????loginname:{}, password:{}, verifycode:{}, companyId:{}", loginname, password, verifycode, companyId);
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		String viewName="";
		//???????????????
		String v =(String)session.getAttribute("VERIFYCODE");
		if(!verifycode.equalsIgnoreCase(v))
		{
			//companyId???=null???????????????,????????????????????????
			//if(companyId!=null&&companyId.trim().length()==3){
				hm.put("success", "true");
				hm.put("msg", "?????????????????????!");
				return hm;
			//}
		}
		if(companyId!=null&&!companyId.equals("")){
			String 	companyId1=baseService.getSingle("select jcode from s_organ where jgbm='"+companyId+"'");
			if(companyId1==null||companyId1.equals(""))
			{
				hm.put("success", "true");
				hm.put("msg", "???????????????!");
				return hm;
			}else{
				companyId=baseService.getSingle("select jcode from s_organ where jgbm='"+companyId+"'");
			}
		}
		//??????????????????,????????????????????????????????????,???2???:????????????,???????????????
		User user = null;
		//if(companyId!=null&&companyId.trim().length()==3){
		if(companyId!=null){
			user = userService.login(loginname, Md5Encrypt.md5(password),companyId);
		}else{
			user = userService.login(loginname, Md5Encrypt.md5(password),"");
		}
		if(user == null){
			if(companyId!=null&&companyId.trim().length()==3){			
				hm.put("success", "true");
				hm.put("msg", "????????????????????????!");
				return hm;
			}
		}else{
			// ??????????????????HttpSession??????
			if(user.getTxPath()==null||user.getTxPath().equals("")){
				user.setTxPath("/images/tx/none.jpg");
			}else{
			String pathString=request.getSession().getServletContext().getRealPath("/").substring(0,request.getSession().getServletContext().getRealPath("/").length()-1)+user.getTxPath().replace("/", "\\");
			File  fileInfo=new File (pathString);
				if(!fileInfo.exists()){
					user.setTxPath("/images/tx/none.jpg");
				}
			}

			SysProp sys=new SysProp();
			String url =sys.getProperty("url");
			session.setAttribute("url", url);
			session.setAttribute(ErpConstants.USER_SESSION, user);

			Organ organ=null;
			if(user.getJgid()==null||user.getJgid().equals("")){
				organ=new Organ();
				organ.setCompanyName("??????????????????");
				organ.setCompanySName("??????");
				organ.setJcode("default");
				organ.setLogo("images/logo/default.png");
				viewName = "/user/main1";
			}else{
				organ=organService.getOrgan(user.getJgid());
				if(user.getRoles().equals("nurse")){
					viewName = "/nurse/main";
				}else{
					viewName = "/user/main1";
				}
			}
			session.setAttribute("organ", organ);
			//????????????????????????
			//List<Menu> menulist = userService.selectMenupowers(loginname,user.getJgid());
			// ??????????????????main??????
			//mv.addObject("menulist",menulist);
			//mv.setViewName("redirect:/user/main");//???menu?????????ajax			
		}
		//mv.setViewName(viewName);
		hm.put("success", "true");
		hm.put("msg", "");
		hm.put("url", viewName);
		return hm;
	}
	@RequestMapping(value="/main1")
	public ModelAndView main1(ModelAndView mv,HttpSession session){
		User user = (User) session.getAttribute(ErpConstants.USER_SESSION);
		List<Menu> menulist = userService.selectMenupowers(user.getLoginname(),user.getJgid());
		// ??????????????????main??????
		mv.addObject("menulist",menulist);
		mv.setViewName("/user/main");
		return mv;
	}

	/**
	 * ????????????????????????????????????
	 * @param String loginname ?????????
	 * @param String password ??????
	 * @return ???????????????
	 * */
	@RequestMapping(value="/loginm")
	public ModelAndView loginm(@RequestParam("userName") String loginname,
			@RequestParam("password") String password,
			HttpSession session,
			ModelAndView mv,HttpServletRequest request){
		User user =null;
		String jcode="";
		try
		{
			jcode=(String) session.getAttribute("companyId");
		}
		catch(Exception e){

		}
		user = userService.login(loginname,Md5Encrypt.md5(password),jcode);
		if(user != null){
			// ??????????????????HttpSession??????
			if(user.getTxPath()==null||user.getTxPath().equals("")){
				user.setTxPath("/images/tx/none.jpg");
			}else{
				FileInfo fileInfo=new FileInfo(user.getTxPath());
				if(!fileInfo.exists()){
					user.setTxPath("/images/tx/none.jpg");
				}
			}
			session.setAttribute(ErpConstants.USER_SESSION, user);
			Organ organ=null;
			if(user.getJgid()==null||user.getJgid().equals("")){
				organ=new Organ();
				organ.setCompanyName("????????????");
				organ.setCompanySName("??????");
				organ.setJcode("default");
				organ.setLogo("images/logo/default.png");
			}else{
				organ=organService.getOrgan(user.getJgid());
			}
			session.setAttribute("organ", organ);
			//????????????????????????
			List<Menu> menulist = userService.selectMenupowers(loginname,user.getJgid());
			// ??????????????????main??????
			mv.addObject("menulist",menulist);
			mv.setViewName("/user/main");
		}else{
			// ??????????????????????????????
			mv.addObject("message", "????????????????????????!");
			// ????????????????????????????????????
			if(user.getJgid()==null){
				mv.setViewName("/");
			}else{
				mv.setViewName("/"+user.getJgid());
			}
		}
		return mv;
	}
	@RequestMapping(value="/loginm1")
	public ModelAndView loginm1(@RequestParam("userName") String loginname,
			@RequestParam("password") String password,
			HttpSession session,
			ModelAndView mv,HttpServletRequest reques,String companyId){
		User user =null;
		String jcode="";
		if(companyId!=null&&companyId!=""){
			jcode=baseService.getSingle("select jcode from s_organ where jgbm='"+companyId+"'");
		}
		user = userService.login(loginname,Md5Encrypt.md5(password),jcode);
		if(user != null){
			// ??????????????????HttpSession??????
			if(user.getTxPath()==null||user.getTxPath().equals("")){
				user.setTxPath("/images/tx/none.jpg");
			}else{
				FileInfo fileInfo=new FileInfo(user.getTxPath());
				if(!fileInfo.exists()){
					user.setTxPath("/images/tx/none.jpg");
				}
			}
			session.setAttribute(ErpConstants.USER_SESSION, user);
			Organ organ=null;
			if(user.getJgid()==null||user.getJgid().equals("")){
				organ=new Organ();
				organ.setCompanyName("????????????");
				organ.setCompanySName("??????");
				organ.setJcode("default");
				organ.setLogo("images/logo/default.png");
			}else{
				organ=organService.getOrgan(user.getJgid());
			}
			session.setAttribute("organ", organ);
			//????????????????????????
			List<Menu> menulist = userService.selectMenupowers(loginname,user.getJgid());
			// ??????????????????main??????
			mv.addObject("menulist",menulist);
			mv.setViewName("/user/main");
		}else{
			// ??????????????????????????????
			mv.addObject("message", "????????????????????????!");
			// ????????????????????????????????????
			if(user.getJgid()==null){
				mv.setViewName("/");
			}else{
				mv.setViewName("/"+user.getJgid());
			}
		}
		return mv;
	}

	/**
	 * ??????????????????
	 * @param String loginname ?????????
	 * @param String password ??????
	 * @param String verifycode ?????????,??????????????????
	 * @return ???????????????
	 * */
	@RequestMapping(value="/findpassword")
	public ModelAndView findpassword(ModelAndView mv,String companyId){
		mv.addObject("companyId",companyId);
		mv.setViewName("/user/findpassword");
		return mv;
	}

	@RequestMapping(value="/yzyj")
	@ResponseBody
	public String yzyj(@RequestParam("loginname") String loginname,
			@RequestParam("email") String email, 
			Model mv,HttpSession session1,HttpServletRequest request,String companyId){
		User user =null;
		String rt=""; 
		String jcode="";
		if(companyId!=null&&companyId!=""){
			jcode=baseService.getSingle("select jcode from s_organ where jgbm='"+companyId+"'");
		}
		user = userService.Yjyzgc(loginname, email,jcode);

		if(user != null){
			System.out.println("jcode=="+ jcode);
			String yzcode=	userService.Yjyzscyz(loginname,jcode);

			try
			{
				String host="";
				String emailname="";
				String passwd="";

				SysProp s1=new SysProp();
				host= s1.getProperty("smtphost");
				emailname=s1.getProperty("email");
				passwd=s1.getProperty("passwd");

				Properties props = System.getProperties();
				props.setProperty("mail.smtp.host",host);
				props.put("mail.smtp.auth", "true");
				final String emailname1= emailname;
				final String passwd1=	passwd;	
				Session session = Session.getInstance( props, new Authenticator() {
					@Override
					protected PasswordAuthentication getPasswordAuthentication(){
						return new PasswordAuthentication( emailname1, passwd1);
					}
				});
				//   System.out.println("smtphost=="+host);
				//  System.out.println("emailname=="+email);
				//  System.out.println("password=="+passwd);
				MimeMessage  message1 = new MimeMessage(session);
				InternetAddress from = new InternetAddress(emailname);
				message1.setFrom(from);
				message1.setRecipient(RecipientType.TO, new InternetAddress(email));
				message1.setSubject("???????????????");
				message1.setContent(user.getXm()+" ????????????</br>??????????????????????????????????????????????????????"+yzcode,"text/html;charset=utf-8");
				Transport.send(message1);
				rt="ok";
				mv.addAttribute("message", "ok");
				session = Session.getInstance( props, new Authenticator() {
					@Override
					protected PasswordAuthentication getPasswordAuthentication(){
						return new PasswordAuthentication( emailname1, passwd1);
					}
				});
				//   System.out.println("smtphost=="+host);
				//  System.out.println("emailname=="+email);
				//  System.out.println("password=="+passwd);
				message1 = new MimeMessage(session);
				from = new InternetAddress(emailname);
				message1.setFrom(from);
				message1.setRecipient(RecipientType.TO, new InternetAddress(email));
				message1.setSubject("???????????????");
				message1.setContent(user.getXm()+" ????????????</br>??????????????????????????????????????????????????????"+yzcode,"text/html;charset=utf-8");
				Transport.send(message1);
				rt="ok";
				mv.addAttribute("message", "ok");
			}
			catch (AddressException e) {
				// TODO Auto-generated catch block
				rt="err1";
				mv.addAttribute("message", "err1");
				e.printStackTrace();
			} catch (MessagingException e) {
				rt="err2";
				mv.addAttribute("message", "err2");
				e.printStackTrace();
			}

		}
		else
		{
			rt="err";
			mv.addAttribute("message", "err");

		}
		return  rt;
	}
	/*
	 * ?????????????????????
	 */
	@RequestMapping(value="/yzyjm")
	@ResponseBody
	public String yzyjm(@RequestParam("loginname") String loginname,
			Model mv,HttpSession session,HttpServletRequest request,String companyId){
		String jcode="";
		if(companyId!=null&&companyId!=""){
			jcode=baseService.getSingle("select jcode from s_organ where jgbm='"+companyId+"'");
		}
		String yzcode = userService.Yjyzm(loginname,jcode);
		mv.addAttribute("message",  yzcode);
		return   yzcode;
	}
	/*
	 * ??????????????????????????????
	 */
	@RequestMapping(value="/yzyjpasswd")
	@ResponseBody
	public String yzyjpasswd(@RequestParam("loginname") String loginname,@RequestParam("email") String email,@RequestParam("yzcode") String yzcode,@RequestParam("passwd") String passwd,
			Model mv,HttpSession session,HttpServletRequest request,String companyId){
		User user =null;
		String jcode="";
		if(companyId!=null&&companyId!=""){
			jcode=baseService.getSingle("select jcode from s_organ where jgbm='"+companyId+"'");
		}
		user = userService.Yjyzgc(loginname, email,jcode);
		if (user != null)
		{
			String yz=userService.Yjyzm(loginname,jcode);
			if ( yzcode.equals(yz))
			{
				user.setPassword(Md5Encrypt.md5(passwd));
				userService.updateUser(user);
				userService.deleteYjyz(loginname, jcode);
				mv.addAttribute("message", "ok");
				return   "ok";
			}
			else
			{

				mv.addAttribute("message", "err1");
				return   "err1";
			}

		}
		else
		{
			mv.addAttribute("message", "err2");
			return   "err2";
		}
	}
	/*
	 * ???????????????
	 */
	@RequestMapping(value="/verifyCode",method=RequestMethod.GET)
	public void verifyCode(HttpSession session,HttpServletResponse response)throws Exception{
		VerifyCode vc = new VerifyCode();  
		response.setHeader("Cache-Control", "no-cache");  
		response.setContentType("image/jpeg");  
		BufferedImage bim = vc.getImage();  
		ImageIO.write(bim, "JPEG", response.getOutputStream());  
		String verifycode = vc.getText();  
		session.setAttribute("VERIFYCODE", verifycode);  
	}




	/////////////////////////////////////////////////////////////////////////////////////////////
	/*
	 * ???????????? 1.?????????
	 */
	@RequestMapping(value = "/user")
	public String user(String tableName,String name,Model model,HttpSession session,String mid,HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException {
		User user = (User) session.getAttribute(ErpConstants.USER_SESSION);
		if(user==null){
			//return "/user/loginForm";
			PrintWriter out = response.getWriter();  
			out.println("<html>");      
			out.println("<script>");      
			out.println("window.open ('"+request.getContextPath()+"/user/loginForm?message=??????????????????,???????????????','_top')");      
			out.println("</script>");      
			out.println("</html>");    
			return "";  
		}
		String uid = user.getLoginname();

		//?????????????????????toggleColumnJson
		//String currentToggleColumnJson = columnService.getCurrentToggleColumnJson(uid,tableName,name);

		//??????searchColumnJson
		//String searchColumnJson = columnService.getSearchColumnJson(uid,tableName,name,"",user.getJgid());

		//????????????currentSearchColumnJson
		//String currentSearchColumnJson = columnService.getCurrentSearchColumnJson(uid,tableName,name,"",user.getJgid());

		String currentToggleColumnJson = columnService.getCurrentToggleColumnJson1(uid,tableName,name,mid,user.getJgid());

		//??????searchColumnJson
		String searchColumnJson = columnService.getSearchColumnJson1(uid,tableName,name,"",user.getJgid(),mid);

		//????????????currentSearchColumnJson
		String currentSearchColumnJson = columnService.getCurrentSearchColumnJson1(uid,tableName,name,"",user.getJgid(),mid);
		model.addAttribute("addBtn",baseService.boolDis(user.getRoles(), "05-02-001"));
		model.addAttribute("editBtn",baseService.boolDis(user.getRoles(), "05-02-002"));
		model.addAttribute("delBtn",baseService.boolDis(user.getRoles(), "05-02-003"));
		model.addAttribute("drBtn",baseService.boolDis(user.getRoles(), "05-02-004"));
		model.addAttribute("dcBtn",baseService.boolDis(user.getRoles(), "05-02-005"));
		model.addAttribute("roleBtn",baseService.boolDis(user.getRoles(), "05-02-006"));
		model.addAttribute("fields", currentToggleColumnJson);
		model.addAttribute("searchs", searchColumnJson);
		model.addAttribute("currentSearchColumnJson", currentSearchColumnJson);

		return "/user/user";
	}


	/*
	 * ???????????? 2.????????????
	 */
	@RequestMapping(value = "/selectUser")
	@ResponseBody
	public Object selectUser(@ModelAttribute PageModel pageModel,HttpSession session ) throws SQLException{
		User user = (User) session.getAttribute(ErpConstants.USER_SESSION);
		pageModel.setWhereStr(" jgid='"+user.getJgid()+"' and (roles<>'admin' and roles<>'maxrole') or roles is null ");
		pageModel.setFieldString(baseService.getField(pageModel.getFieldString()));
		List<User> beans = userService.selectUser(pageModel);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("total", pageModel.getRecordCount());
		hm.put("rows", beans);
		return hm;
	}

	/*
	 * ??????????????? 3.????????????(??????)
	 */
	@RequestMapping(value = "/addUser")
	public void addUser(@ModelAttribute User bean){
	}

	/*
	 * ??????????????? 4.????????????
	 */
	@RequestMapping(value = "/insertUser",name="????????????-??????")
	@ResponseBody
	public Object insertUser(@ModelAttribute User bean,Model mv,HttpSession session,HttpServletResponse response) throws Exception {
		User user=(User) session.getAttribute(ErpConstants.USER_SESSION);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		response.setContentType("text/html;charset=UTF-8");
		int count =baseService.getCount("s_rbac_user"," and jgid='"+user.getJgid()+"'  and loginname='"+bean.getLoginname()+"'");
		if(count==0){
			bean.setCreator(user.getXm());
			if(bean.getPassword()!=null&&!bean.getPassword().equals("")){
				bean.setPassword(Md5Encrypt.md5(bean.getPassword()));
			}
			bean.setJgid(user.getJgid());
			bean.setTxPath("/images/tx/none.jpg");
			bean.setOrganid(user.getOrganid());
			bean.setJgbm(user.getJgbm());
			userService.insertUser(bean);
			hm.put("success", "true");
			hm.put("msg", "????????????");
		}else{
			hm.put("error", "true");
			hm.put("msg", "?????????????????????");
		}
		return hm;
		/*User user = (User) session.getAttribute(ErpConstants.USER_SESSION);
		User user1= userService.selectUserByLoginname(bean.getLoginname(),user.getJgid());
		if ( user1!= null)
		{
			  mv.addAttribute("message", "err1");
			    return   "err1";
		}
		else
		{
		bean.setCreator(user.getXm());
		bean.setPassword(Md5Encrypt.md5(bean.getPassword()));
		bean.setJgid(user.getJgid());
		userService.insertUser(bean);
	    mv.addAttribute("message", "ok");
		    return   "ok";
		}*/

	}

	/*
	 * ??????????????? 5.????????????
	 */
	@RequestMapping(value = "/editUser")
	@ResponseBody
	public Object editUser(@ModelAttribute User bean){

		bean = userService.editUser(bean.getId());
		ArrayList<User> al = new ArrayList<User>();
		al.add(bean);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		hm.put("rows", al);
		return hm;
	}

	/*
	 * ??????????????? 6.????????????
	 */
	@RequestMapping(value = "/updateUser",name="????????????-??????")
	@ResponseBody
	public Object updateUser(@ModelAttribute User bean,Model mv,HttpSession session,HttpServletResponse response) throws Exception{
		User user=(User) session.getAttribute(ErpConstants.USER_SESSION);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		response.setContentType("text/html;charset=UTF-8");
		int count =baseService.getCount("s_rbac_user"," and jgid='"+user.getJgid()+"'  and loginname='"+bean.getLoginname()+"' and id<>"+bean.getId());
		if(count==0){
			if(bean.getPassword()!=null&&!bean.getPassword().equals("")){
				bean.setPassword(Md5Encrypt.md5(bean.getPassword()));
			}
			bean.setOrganid(user.getOrganid());
			bean.setJgbm(user.getJgbm());
			userService.updateUser(bean);
			hm.put("success", "true");
			hm.put("msg", "????????????");
		}else{
			hm.put("error", "true");
			hm.put("msg", "?????????????????????");
		}
		return hm;
	}

	/**
	 * ??????????????? 7.????????????
	 * */
	@RequestMapping(value = "/deleteUser",name="????????????-??????")
	@ResponseBody
	public Object deleteUser(String id,HttpSession session){
		userService.deleteUser(id);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		return hm;
	}

	/**
	 * @return ???????????????
	 * */
	@RequestMapping(value="/index")
	public ModelAndView index(HttpSession session,ModelAndView mv){
		mv.setViewName("/user/index");
		return mv;
	}	

	// ///////////////////////////////////////////////////////////////////////////////////////////
	/*
	 * ??????Excel
	 * ???????????????http://localhost/jkmh/user/exportExcel
	 */
	/*
	 * ??????Excel ???????????????http://localhost/jkmh/user/exportExcel
	 */
	@RequestMapping(value = "/exportExcel")
	public String exportExcel(String tblName, Model model,
			HttpServletRequest request) throws Exception {
		return "/common/exportExcel";
	}

	/*
	 * keyword?????????????????????
	 */
	@RequestMapping(value = "/doExportExcel")
	@ResponseBody
	public Object doExportExcel(String tblName, String keyword, Model model,
			HttpServletResponse response,HttpSession session,HttpServletRequest request) throws Exception {
		// ??????????????????
		User user=(User) session.getAttribute(ErpConstants.USER_SESSION);
		keyword="  jgid='"+user.getJgid()+"' "+keyword;
		List selectList = userService.selectAllUsers(tblName, keyword);
		String pathString=request.getSession().getServletContext().getRealPath("")+"/temp/"+user.getJgid()+"_"+user.getLoginname()+".xlsx" ;
		sfieldService.exportExcel(pathString,tblName, selectList);

		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		hm.put("filename", "/temp/"+user.getJgid()+"_"+user.getLoginname()+".xlsx");
		return hm;
	}

	@RequestMapping(value = "/doImportExcel")
	@ResponseBody
	public Object doImportExcel(@RequestParam MultipartFile[] files, HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException{  
		//???????????????????????????????????????commons.io.FileUtils???,??????????????????/upload????????????,???????????????????????? 
		User user=(User) session.getAttribute(ErpConstants.USER_SESSION);
		int rs=	0;
		System.out.println(rs);
		String realPath = request.getSession().getServletContext().getRealPath("/temp");  
		System.out.println(realPath);
		//?????????????????????(???????????????????????????)  
		String originalFilename = null;  
		//??????????????????????????????,????????????MultipartFile????????????????????????,????????????????????????@RequestParam??????  
		//???????????????????????????,?????????????????????MultipartFile[]?????????????????????,???????????????@RequestParam??????  
		//?????????????????????,????????????????????????<input type="file"/>???name????????????myfiles,??????????????????myfiles????????????????????????????????????  
		for(MultipartFile myfile : files){  
			if(myfile.isEmpty()){  
				System.out.println("0");
				return "???????????????????????????";  
			}else{  
				originalFilename = myfile.getOriginalFilename();  
				System.out.println(originalFilename);
				//System.out.println("????????????: " + originalFilename);  
				//System.out.println("????????????: " + myfile.getName());  
				//System.out.println("????????????: " + myfile.getSize());  
				//System.out.println("????????????: " + myfile.getContentType());  
				//System.out.println("========================================");  
				try {  
					//??????????????????IO??????????????????,??????FileUtils.copyInputStreamToFile()?????????????????????????????????IO?????????  
					//?????????????????????Spring?????????MultipartFile.transferTo(File dest)???????????????????????????  
					SimpleDateFormat myFmt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date now=new Date();
					UUID uuid = UUID.randomUUID();
					System.out.println(uuid);
					originalFilename = uuid+".xlsx";
					baseService.executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('"+user.getId()+"','"+user.getJgid()+"','"+user.getXm()+"','????????????','"+uuid+"????????????','"+myFmt2.format(now)+"')");
					FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, originalFilename));  
					baseService.executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('"+user.getId()+"','"+user.getJgid()+"','"+user.getXm()+"','????????????','"+uuid+"????????????','"+myFmt2.format(now)+"')");
					String xlsPath=realPath+"/"+originalFilename;
					List<Sfield> sfieldList=sfieldService.selectByTablename("s_rbac_user");		
					baseService.executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('"+user.getId()+"','"+user.getJgid()+"','"+user.getXm()+"','????????????','"+uuid+"??????????????????','"+myFmt2.format(now)+"')");
					List<String> cnnameList=sfieldService.selectCnnameList("s_rbac_user");
					baseService.executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('"+user.getId()+"','"+user.getJgid()+"','"+user.getXm()+"','????????????','"+uuid+"??????????????????','"+myFmt2.format(now)+"')");
					 rs=		ExcelUtils.importExcel(sfieldList,cnnameList,xlsPath);
					 if(rs>0){
					 baseService.executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('"+user.getId()+"','"+user.getJgid()+"','"+user.getXm()+"','????????????','"+uuid+"????????????','"+myFmt2.format(now)+"')");
					 }else{
						 baseService.executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('"+user.getId()+"','"+user.getJgid()+"','"+user.getXm()+"','????????????','"+uuid+"????????????','"+myFmt2.format(now)+"')");
					 }
				} catch (IOException e) {  
					System.out.println("??????[" + originalFilename + "]????????????,??????????????????");  
					e.printStackTrace();  
					return "1????????????????????????????????????";  
				}  
			}  
		}   
		//HashMap<String, Object> hm = new HashMap<String, Object>();
		//hm.put("result", "ok");
		return "{\"result\":" + "\""+rs+"\"}"; 
	}  

	/*	public Object doImportExcel(String tblName, Model model,
			HttpServletResponse response) throws Exception {

		String xlsPath= "D:/Tomcat7/webapps/jkmh/test1.xlsx";
		List<Sfield> sfieldList=sfieldService.selectByTablename(tblName);		
		List<String> cnnameList=sfieldService.selectCnnameList(tblName);
		ExcelUtils.importExcel(sfieldList,cnnameList,xlsPath);

		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		return hm;
	}*/


	/*
	 * ??????????????? 5.????????????
	 */
	@RequestMapping(value = "/editUserRole")
	@ResponseBody
	public void editUserRole(@ModelAttribute User bean,
			HttpServletResponse response, Model model,HttpSession session) throws Exception {
		User user=(User) session.getAttribute(ErpConstants.USER_SESSION);
		bean = userService.editUser(bean.getId());
		List<Role> role = userService.selectRole(user.getJgid());
		String userRoleString = bean.getRoles();
		if (userRoleString != null && userRoleString != "") {
			String[] userRole = userRoleString.split(",");
			for (int i = 0; i < role.size(); i++) {
				for (int h = 0; h < userRole.length; h++) {
					if (userRole[h].equals(role.get(i).getRole_id())) {
						role.get(i).setBz("true");
						break;
					} else {
						role.get(i).setBz("false");
					}
				}
			}
		}
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		hm.put("rows", role);

		String str = JSON.toJSONString(hm);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println(str);
	}

}
