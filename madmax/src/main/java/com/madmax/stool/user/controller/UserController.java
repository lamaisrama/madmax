package com.madmax.stool.user.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.madmax.stool.user.model.service.UserService;
import com.madmax.stool.user.model.vo.User;

@Controller
@SessionAttributes({"loginUser"})
public class UserController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private Logger logger;
	
	
	@RequestMapping("/user/joinUser.do")
	public String joinUser() {
		
		return "user/login/joinUser";
	}
	
	@RequestMapping("/user/userEnrollEnd.do")
	public String insertUser(@RequestParam Map param, Model m) {
		
//		logger.debug("유저:"+param);
		
		int result = service.insertUser(param);
		//int result = service.insertUser(u);
		String page = "";
		
		if(result==0) {
			page = "common/msg";
			m.addAttribute("msg", "회원가입실패! 다시 시도해주세요!");
			m.addAttribute("loc", "/user/joinUser.do");
		}else {
			page = "redirect:/";
		}
		/*
		 * if(result==0) { page = "common/msg"; model.addAttribute("msg",
		 * "회원가입실패! 다시 시도해주세요!"); model.addAttribute("loc", "/user/insertUser.do");
		 * }else { page = "redirect:/"; }
		 */
		
		return page;
	}
	
	@RequestMapping("/user/userLogin.do")
	public String login(String userId, String password, Model m, HttpSession session) {
		
		User login = service.selectUser(userId);
		
		if(login!=null&&login.getPassword().equals(password)) {
			m.addAttribute("msg", "로그인성공!");
			m.addAttribute("loginUser", login);
			
//			logger.debug("user:"+login.getUserName());
			
		}else {
			m.addAttribute("msg", "로그인실패!");
		}
		m.addAttribute("loc", "/");
		return "common/msg";
	}
	
	@RequestMapping("/user/logout.do")
	public String logout(SessionStatus status, HttpSession session) {
		if(!status.isComplete()) {
			status.setComplete();
		}
		return "redirect:/";
	}
	
	
//	@RequestMapping("/user/checkId")
//	@ResponseBody
//	public int checkId(@RequestParam("userId") String userId) {
//		return ;
//		User u = service.selectUser(userId);
//		boolean flag = u!=null?false:true;
//		if(flag==false) {
//			res.getWriter().write("<span class='ml-2'>"+"<b>"+userId+"</b>"+"은/는 <span style='color:red;'>이미 사용중</span>인 아이디입니다.</span>");
//		}else{
//			res.getWriter().write("<span class='ml-2'>"+"<b>"+userId+"</b>"+"은/는 <span style='color:green;'>사용가능</span>한 아이디입니다.</span>");
//		}
//	}
	@RequestMapping("/user/checkId")
	public void checkId(String userId, HttpServletResponse res) {
		
		User u = service.selectUser(userId);
		boolean flag = u!=null?false:true;
		try {
			res.setContentType("text/html;charset=utf-8");
//			res.getWriter().print(flag?"가능":"불가능!");
			res.getWriter().write(flag?"<span style='color:green;'>가능!</span>":"<span style='color:red;'>불가능!</span>");
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
