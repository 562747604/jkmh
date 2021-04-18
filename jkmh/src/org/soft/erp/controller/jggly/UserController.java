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
 * @Description: 处理用户请求
 * <br>网站： 
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
	 * 处理登录请求
	 * @param String loginname 登录名
	 * @param String password 密码
	 * @param String verifycode 验证码,不区分大小写
	 * @return 跳转的视图
	 * */

	/*	public ModelAndView login(@RequestParam("loginname") String loginname,
			@RequestParam("password") String password,String verifycode,String companyId,
			HttpSession session,
			ModelAndView mv,HttpServletRequest request){

		String viewName="";
		//比较验证码
		String v =(String)session.getAttribute("VERIFYCODE");
		if(!verifycode.equalsIgnoreCase(v))
		{
			//companyId！=null为机构人员,否则为超级管理员
			if(companyId!=null&&companyId.trim().length()==3)
				mv.addObject("companyId", companyId);
			viewName = "/user/loginForm";
			mv.setViewName(viewName);
			mv.addObject("message","验证码输入错误!");
			return mv;
		}

		//验证码判断后,判断用户名和密码是否正确,分2种:机构人员,超级管理员
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
			mv.addObject("message","登录名或密码错误!");
		}else{
			// 将用户保存到HttpSession当中
			session.setAttribute(ErpConstants.USER_SESSION, user);
			Ulog ulog = new Ulog();
			ulog.setUname(user.getXm());
			ulog.setOtime(new java.sql.Date(System.currentTimeMillis()));

			ulog.setJgid(user.getJgid());
			ulog.setUid(user.getId());
			ulog.setMkname("系统登录");
			ulog.setNr(request.getRemoteAddr());
			logService.insertUlog(ulog);

			Organ organ=null;
			if(user.getJgid()==null||user.getJgid().equals("")){
				organ=new Organ();
				organ.setCompanyName("丁丁健康");
				organ.setCompanySName("丁丁");
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
			//取得菜单权限列表
			List<Menu> menulist = userService.selectMenupowers(loginname,user.getJgid());
			// 客户端跳转到main页面
			mv.addObject("menulist",menulist);
			//mv.setViewName("redirect:/user/main");//将menu升级为ajax			
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
		logger.info("机构管理员登录，loginname:{}, password:{}, verifycode:{}, companyId:{}", loginname, password, verifycode, companyId);
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		String viewName="";
		//比较验证码
		String v =(String)session.getAttribute("VERIFYCODE");
		if(!verifycode.equalsIgnoreCase(v))
		{
			//companyId！=null为机构人员,否则为超级管理员
			//if(companyId!=null&&companyId.trim().length()==3){
				hm.put("success", "true");
				hm.put("msg", "验证码输入错误!");
				return hm;
			//}
		}
		if(companyId!=null&&!companyId.equals("")){
			String 	companyId1=baseService.getSingle("select jcode from s_organ where jgbm='"+companyId+"'");
			if(companyId1==null||companyId1.equals(""))
			{
				hm.put("success", "true");
				hm.put("msg", "机构不存在!");
				return hm;
			}else{
				companyId=baseService.getSingle("select jcode from s_organ where jgbm='"+companyId+"'");
			}
		}
		//验证码判断后,判断用户名和密码是否正确,分2种:机构人员,超级管理员
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
				hm.put("msg", "登录名或密码错误!");
				return hm;
			}
		}else{
			// 将用户保存到HttpSession当中
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
				organ.setCompanyName("健康管理门户");
				organ.setCompanySName("健康");
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
			//取得菜单权限列表
			//List<Menu> menulist = userService.selectMenupowers(loginname,user.getJgid());
			// 客户端跳转到main页面
			//mv.addObject("menulist",menulist);
			//mv.setViewName("redirect:/user/main");//将menu升级为ajax			
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
		// 客户端跳转到main页面
		mv.addObject("menulist",menulist);
		mv.setViewName("/user/main");
		return mv;
	}

	/**
	 * 处理邮件修改密码登录请求
	 * @param String loginname 登录名
	 * @param String password 密码
	 * @return 跳转的视图
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
			// 将用户保存到HttpSession当中
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
				organ.setCompanyName("丁丁健康");
				organ.setCompanySName("丁丁");
				organ.setJcode("default");
				organ.setLogo("images/logo/default.png");
			}else{
				organ=organService.getOrgan(user.getJgid());
			}
			session.setAttribute("organ", organ);
			//取得菜单权限列表
			List<Menu> menulist = userService.selectMenupowers(loginname,user.getJgid());
			// 客户端跳转到main页面
			mv.addObject("menulist",menulist);
			mv.setViewName("/user/main");
		}else{
			// 设置登录失败提示信息
			mv.addObject("message", "登录名或密码错误!");
			// 服务器内部跳转到登录页面
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
			// 将用户保存到HttpSession当中
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
				organ.setCompanyName("丁丁健康");
				organ.setCompanySName("丁丁");
				organ.setJcode("default");
				organ.setLogo("images/logo/default.png");
			}else{
				organ=organService.getOrgan(user.getJgid());
			}
			session.setAttribute("organ", organ);
			//取得菜单权限列表
			List<Menu> menulist = userService.selectMenupowers(loginname,user.getJgid());
			// 客户端跳转到main页面
			mv.addObject("menulist",menulist);
			mv.setViewName("/user/main");
		}else{
			// 设置登录失败提示信息
			mv.addObject("message", "登录名或密码错误!");
			// 服务器内部跳转到登录页面
			if(user.getJgid()==null){
				mv.setViewName("/");
			}else{
				mv.setViewName("/"+user.getJgid());
			}
		}
		return mv;
	}

	/**
	 * 处理密码找回
	 * @param String loginname 登录名
	 * @param String password 密码
	 * @param String verifycode 验证码,不区分大小写
	 * @return 跳转的视图
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
				message1.setSubject("邮件验证码");
				message1.setContent(user.getXm()+" ，您好！</br>请在邮件验证码输入框输入下方验证码："+yzcode,"text/html;charset=utf-8");
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
				message1.setSubject("邮件验证码");
				message1.setContent(user.getXm()+" ，您好！</br>请在邮件验证码输入框输入下方验证码："+yzcode,"text/html;charset=utf-8");
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
	 * 获取邮件验证码
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
	 * 通过邮件验证修改密码
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
	 * 获取验证码
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
	 * 机构管理 1.初始化
	 */
	@RequestMapping(value = "/user")
	public String user(String tableName,String name,Model model,HttpSession session,String mid,HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException {
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
	 * 机构管理 2.分页查询
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
	 * 代码库管理 3.增加页面(未用)
	 */
	@RequestMapping(value = "/addUser")
	public void addUser(@ModelAttribute User bean){
	}

	/*
	 * 代码库管理 4.执行增加
	 */
	@RequestMapping(value = "/insertUser",name="用户管理-增加")
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
			hm.put("msg", "新增成功");
		}else{
			hm.put("error", "true");
			hm.put("msg", "对应的值已存在");
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
	 * 代码库管理 5.修改页面
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
	 * 代码库管理 6.执行修改
	 */
	@RequestMapping(value = "/updateUser",name="用户管理-修改")
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
	@RequestMapping(value = "/deleteUser",name="用户管理-删除")
	@ResponseBody
	public Object deleteUser(String id,HttpSession session){
		userService.deleteUser(id);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("success", "true");
		return hm;
	}

	/**
	 * @return 跳转的视图
	 * */
	@RequestMapping(value="/index")
	public ModelAndView index(HttpSession session,ModelAndView mv){
		mv.setViewName("/user/index");
		return mv;
	}	

	// ///////////////////////////////////////////////////////////////////////////////////////////
	/*
	 * 导出Excel
	 * 访问网址：http://localhost/jkmh/user/exportExcel
	 */
	/*
	 * 导出Excel 访问网址：http://localhost/jkmh/user/exportExcel
	 */
	@RequestMapping(value = "/exportExcel")
	public String exportExcel(String tblName, Model model,
			HttpServletRequest request) throws Exception {
		return "/common/exportExcel";
	}

	/*
	 * keyword搜索关键字封装
	 */
	@RequestMapping(value = "/doExportExcel")
	@ResponseBody
	public Object doExportExcel(String tblName, String keyword, Model model,
			HttpServletResponse response,HttpSession session,HttpServletRequest request) throws Exception {
		// 导出表单数据
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
		//这里实现文件上传操作用的是commons.io.FileUtils类,它会自动判断/upload是否存在,不存在会自动创建 
		User user=(User) session.getAttribute(ErpConstants.USER_SESSION);
		int rs=	0;
		System.out.println(rs);
		String realPath = request.getSession().getServletContext().getRealPath("/temp");  
		System.out.println(realPath);
		//上传文件的原名(即上传前的文件名字)  
		String originalFilename = null;  
		//如果只是上传一个文件,则只需要MultipartFile类型接收文件即可,而且无需显式指定@RequestParam注解  
		//如果想上传多个文件,那么这里就要用MultipartFile[]类型来接收文件,并且要指定@RequestParam注解  
		//上传多个文件时,前台表单中的所有<input type="file"/>的name都应该是myfiles,否则参数里的myfiles无法获取到所有上传的文件  
		for(MultipartFile myfile : files){  
			if(myfile.isEmpty()){  
				System.out.println("0");
				return "请选择文件后上传！";  
			}else{  
				originalFilename = myfile.getOriginalFilename();  
				System.out.println(originalFilename);
				//System.out.println("文件原名: " + originalFilename);  
				//System.out.println("文件名称: " + myfile.getName());  
				//System.out.println("文件长度: " + myfile.getSize());  
				//System.out.println("文件类型: " + myfile.getContentType());  
				//System.out.println("========================================");  
				try {  
					//这里不必处理IO流关闭的问题,因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉  
					//此处也可以使用Spring提供的MultipartFile.transferTo(File dest)方法实现文件的上传  
					SimpleDateFormat myFmt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date now=new Date();
					UUID uuid = UUID.randomUUID();
					System.out.println(uuid);
					originalFilename = uuid+".xlsx";
					baseService.executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('"+user.getId()+"','"+user.getJgid()+"','"+user.getXm()+"','用户管理','"+uuid+"生成名称','"+myFmt2.format(now)+"')");
					FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, originalFilename));  
					baseService.executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('"+user.getId()+"','"+user.getJgid()+"','"+user.getXm()+"','用户管理','"+uuid+"上传文件','"+myFmt2.format(now)+"')");
					String xlsPath=realPath+"/"+originalFilename;
					List<Sfield> sfieldList=sfieldService.selectByTablename("s_rbac_user");		
					baseService.executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('"+user.getId()+"','"+user.getJgid()+"','"+user.getXm()+"','用户管理','"+uuid+"获取英文字段','"+myFmt2.format(now)+"')");
					List<String> cnnameList=sfieldService.selectCnnameList("s_rbac_user");
					baseService.executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('"+user.getId()+"','"+user.getJgid()+"','"+user.getXm()+"','用户管理','"+uuid+"获取中文字段','"+myFmt2.format(now)+"')");
					 rs=		ExcelUtils.importExcel(sfieldList,cnnameList,xlsPath);
					 if(rs>0){
					 baseService.executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('"+user.getId()+"','"+user.getJgid()+"','"+user.getXm()+"','用户管理','"+uuid+"导入成功','"+myFmt2.format(now)+"')");
					 }else{
						 baseService.executeUpdate("insert into s_tlog (uid,jgid,uname,mkname,nr,otime) values ('"+user.getId()+"','"+user.getJgid()+"','"+user.getXm()+"','用户管理','"+uuid+"导入失败','"+myFmt2.format(now)+"')");
					 }
				} catch (IOException e) {  
					System.out.println("文件[" + originalFilename + "]上传失败,堆栈轨迹如下");  
					e.printStackTrace();  
					return "1文件上传失败，请重试！！";  
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
	 * 代码库管理 5.修改页面
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
