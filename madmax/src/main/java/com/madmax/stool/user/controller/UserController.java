package com.madmax.stool.user.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		logger.debug("유저:"+param);
		
		int result = service.insertUser(param);
		String page = "";
		
		if(result==0) {
			page = "common/msg";
			m.addAttribute("msg", "회원가입실패! 다시 시도해주세요!");
			m.addAttribute("loc", "/user/joinUser.do");
		}else {
			page = "redirect:/";
		}
		
		return page;
	}
	
	@RequestMapping("/user/userLogin.do")
	public String login(String userId, String password, Model m, HttpSession session) {
		
		User login = service.selectUser(userId);
		
		if(login!=null&&login.getPassword().equals(password)) {
			m.addAttribute("msg", "로그인성공!");
			m.addAttribute("loginMember", login);
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
	
	
	
}
