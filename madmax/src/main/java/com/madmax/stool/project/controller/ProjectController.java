package com.madmax.stool.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.project.model.service.ProjectService;
import com.madmax.stool.project.model.vo.Project;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	@Autowired
	private Logger logger;
	
	// 프로젝트 생성
	@RequestMapping("/project/insertProject.do")
	public String insertProject(Project p,Model m) {
		
	
		if(p.getProjectType().equals("on")) {
			p.setProjectType("Y");
		}else {
			p.setProjectType("N");
		}
	
		//세션에서 받아와 넣을것!
		p.setUserId("user1");	
		 int result=service.insertProject(p);
		  
		
		 if(result>0) {
		 m.addAttribute("msg","프로젝트 생성 성공"); 
		 m.addAttribute("loc","/"); 
		 }else {
		 m.addAttribute("msg","프로젝트 생성 실패"); 
		 m.addAttribute("loc","/"); 
		 }
		 

		return "common/msg";
	}
	

	
	
}
