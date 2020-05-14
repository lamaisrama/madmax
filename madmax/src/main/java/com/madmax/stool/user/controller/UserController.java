package com.madmax.stool.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.madmax.stool.user.model.vo.User;
import com.madmax.stool.user.model.service.UserService;

@Controller
@SessionAttributes({"loginUser"})
public class UserController {
	
	@Autowired
	private UserService service;
	

	@RequestMapping("/user/joinUser.do")
	public String joinUser() {
		
		return "user/login/joinUser";
	}
	
	@RequestMapping("/user/userEnrollEnd.do")
	public String insertUser(User u, Model model) {
		
		int result = service.insertUser(u);
		String page = "";
		
		if(result==0) {
			page = "common/msg";
			model.addAttribute("msg", "회원가입실패! 다시 시도해주세요!");
			model.addAttribute("loc", "/user/insertUser.do");
		}else {
			page = "redirect:/";
		}
		
		return page;
	}
	
	
	
}
