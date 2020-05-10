package com.madmax.stool.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		HttpSession session=request.getSession();
//		Member m = (Member)session.getAttribute("loginMember");
//		if(m==null) {//로그인 되지 않음
//			request.setAttribute("msg", "로그인 후 이용하세요");
//			request.setAttribute("loc", "/");
//			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
//			return false;
//		}else {
//			return super.preHandle(request, response, handler);			
//		}
//	}
	
}
