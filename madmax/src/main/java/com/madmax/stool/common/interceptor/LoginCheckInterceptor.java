package com.madmax.stool.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.madmax.stool.user.model.vo.User;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		User u = (User)session.getAttribute("loginUser");
		if(u==null) {//로그인 되지 않음
			request.setAttribute("msg", "로그인 후 이용하세요");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return false;
		}else {
			return super.preHandle(request, response, handler);			
		}
	}
	
}
