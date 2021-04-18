package org.soft.erp.interceptor;

import java.lang.annotation.Annotation;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.soft.erp.domain.jggly.RolePower;
import org.soft.erp.domain.jggly.User;
import org.soft.erp.service.jggly.RoleService;
import org.soft.erp.util.common.ErpConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 判断用户权限的Spring MVC的拦截器
 */
public class AuthorizedInterceptor implements HandlerInterceptor {

	@Autowired
	public RoleService roleService;

//	@Autowired
//	@Qualifier("logService")
//	public LogService logService;

	/** 定义不需要拦截的请求 */
	 private static final String[] IGNORE_URI = {"/user/loginForm","/user/login","/error/404.html"};
//	private static final String[] IGNORE_URI = { "/user/login" };

	/**
	 * 该方法需要preHandle方法的返回值为true时才会执行。 该方法将在整个请求完成之后执行，主要作用是用于清理资源。
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception exception)
			throws Exception {

	}

	/**
	 * 这个方法在preHandle方法返回值为true的时候才会执行。 执行时间是在处理器进行处理之
	 * 后，也就是在Controller的方法调用之后执行。
	 */
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler, ModelAndView mv)
			throws Exception {

		/**
		 * 日志管理
		 * 
		 * */
		String mkname = getMknameByHandler(handler);
		if (mkname != null && mkname.length() != 0) {
			User user = (User) request.getSession().getAttribute(
					ErpConstants.USER_SESSION);
//			if (user != null) {
//				Ulog ulog = new Ulog();
//				ulog.setUname(user.getXm());
//				SimpleDateFormat myFmt4=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//				Date date = new Date();
//				ulog.setOtime(myFmt4.format(date));
//				
//				ulog.setJgid(user.getJgid());
//				ulog.setUid(user.getId());
//				if(mkname.equals("系统登录")){
//				ulog.setMkname(mkname);
//				ulog.setNr(request.getRemoteAddr());
//				}else{
//					ulog.setMkname(mkname.split("-")[0]);
//					ulog.setNr(mkname.split("-")[1]);
//				}
//				logService.insertUlog(ulog);
//			}
		}
		// System.out.println("mkname=="+mkname);
	}

	/**
	 * preHandle方法是进行处理器拦截用的，该方法将在Controller处理之前进行调用，
	 * 当preHandle的返回值为false的时候整个请求就结束了。
	 * 如果preHandle的返回值为true，则会继续执行postHandle和afterCompletion。
	 * 1.当登录的时候不需要拦截，直接返回true
	 */

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		/** 默认用户没有登录 */
		boolean flag = false;
		/** 获得请求的ServletPath */
		String servletPath = request.getServletPath();

		// System.out.println("servletPath=="+servletPath);

		/** 判断请求是否需要拦截 */
		for (String s : IGNORE_URI) {
			if (servletPath.contains(s)) {
				flag = true;
				break;
			}
		}
		
		/** 
		 * 拦截请求
		 **/
		if (!flag) {

			User user = (User) request.getSession().getAttribute(ErpConstants.USER_SESSION);
			// System.out.println("user===="+user);

			/** 
			 * 1.如果用户没有登录，跳转到登录页面
			 * */
			if (user == null) {
				request.setAttribute("message", "请先登录再访问网站!");
				request.getRequestDispatcher("/404.html").forward(request,
						response);
				return flag;
			}
			/*
			 * 2.用户已经登录,进行权限检查
			 */
			else {
				/*
				 * 判断是否拥有权限,user->role->power
				 */
//				boolean hasPower = getRoleByHandler(handler,user);
//				if (!hasPower) {
////						System.out.println("您没有权限进行操作！");
////						request.getRequestDispatcher("/error/404.html").forward(request,
////								response);
////						flag=false;
//				}
//				else{
//					flag=true;
//				}
				flag = true;
			}
		}
		return flag;
	}

	/*
	 * 获取操作的中文名称name 比如注解 @RequestMapping(value =
	 * "/insertJielunci",name="结论词管理-增加") 1.先取得annotation, 2.然后再取得name名称
	 */
	public String getMknameByHandler(Object handler) {

		HandlerMethod handlerMethod = (HandlerMethod) handler;
		Annotation[] annotation = handlerMethod.getMethod().getAnnotations();

		String mkname = null;
		for (Annotation atn : annotation) {
			String antype = atn.annotationType().toString();
//			 System.out.println(antype+" "+antype.indexOf("RequestMapping"));
			if (antype.indexOf("RequestMapping") != -1) {
				mkname = getMkname(atn.toString());
			//	System.out.println("mkname==" + mkname);
			}
		}

		return mkname;
	}

	/*
	 * 获取@RequestMapping中的name名称
	 */
	public String getMkname(String annotation) {
		String mkname = "";
		StringTokenizer st = new StringTokenizer(annotation, ", ");
		while (st.hasMoreTokens()) {
			String str1 = st.nextToken();
			StringTokenizer st2 = new StringTokenizer(str1, "=");
			while (st2.hasMoreTokens()) {
				String str2 = st2.nextToken();
				if (str2.equals("name")) {
					if (st2.hasMoreTokens()) {
						mkname = st2.nextToken();
						// System.out.println("mkname===" + mkname);
					}
				}
			}
		}
		return mkname;
	}

	
	
	
	
	
	
	
	
	/////////////////////////
	
	
	

	/*
	 * 获取操作的中文名称name 比如注解 @RequestMapping(value =
	 * "/insertJielunci",name="结论词管理-增加") 1.先取得annotation, 2.然后再取得name名称
	 */
	public boolean getRoleByHandler(Object handler,User user) {


		HandlerMethod handlerMethod = (HandlerMethod) handler;
		String actionName = handlerMethod.getMethod().getName();

		String roles = user.getRoles();
		StringTokenizer st = new StringTokenizer(roles, ",");
		
		while (st.hasMoreTokens()) {
			String str1 = st.nextToken();
			List<RolePower> listPowers = roleService.selectRolePowers(str1);
			for (RolePower rp : listPowers) {
				if (rp.getPowerid().equals(actionName)) {
					//System.out.println("您有权限操作！");
					return true;
				}
			}
		}
		return false;
	}

	
	
}
