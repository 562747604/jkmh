package org.soft.erp.session;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 登录配置
 * 
 */
public class SessionInterceptor extends HandlerInterceptorAdapter {
		private final static Logger log = LoggerFactory.getLogger(SessionInterceptor.class);

		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			String requestURI = request.getRequestURI();
			log.info("请求{},deviceType:{}", requestURI, request.getHeader("Sources"));
            Enumeration<String> names = request.getParameterNames();
            StringBuffer sb = new StringBuffer();
            while(names.hasMoreElements()){
                String key = names.nextElement();
                String value =  request.getParameter(key);
                sb.append(key);
                sb.append(":");
                sb.append("[");
                sb.append(value);
                sb.append("]");
                sb.append("*-*");
            }
            log.info("请求参数："+sb.toString());
			response.setHeader("Content-type", "application/json;charset=utf-8"); // json
//			// 校验NeedLogin注解
//			HandlerMethod handlerMethod = (HandlerMethod) handler;
//			NotLogin methodAnnotation = handlerMethod.getMethodAnnotation(NotLogin.class);
//			if (methodAnnotation != null) {
//				return true;
//			}
//			// 解析param参数中的项
//			String sessionId = request.getHeader("Session-Id");
//			if (StringUtils.isStrTrimNull(sessionId)) {
//				log.info("请求：{}缺少sessionId", requestURI);
//				response.getOutputStream().write(ErrorState.MissParameter.toString().getBytes());
//				return false;
//			}
//			log.info("当前会话session-id:{}", sessionId);
//
//			String sessionKey = CacheKey.MEMBER_SESSION.getFinalKey(sessionId);
//			String sessionStr = redisCacheTemplate.get(sessionKey);
//			if (sessionStr == null) {
//				response.getOutputStream().write(ErrorState.TokenNotExist.toString().getBytes());
//				log.info("当前会话无效session-id:{}", sessionId);
//				return false;
//			}
//			sessionService.timeout(sessionId);
			return true;
		}
	}
