package com.madmax.stool.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.madmax.stool.user.model.service.UserService;

@Controller
public class UserController {
	
//	@Autowired
//	private UserService service;

	@RequestMapping("/user/joinUser.do")
	public String joinUser() {
		
		return "user/login/joinUser";
	}
	
}
