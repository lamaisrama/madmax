package com.madmax.stool.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import static com.madmax.stool.common.PagingFactory.getPage;
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
		
	
		if(p.getProjectType()==null) {
			p.setProjectType("N");
		}else {
			p.setProjectType("Y");
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
	

	@RequestMapping("/project/projectList.do")
	public ModelAndView selectprojectList(HttpServletRequest req,
			@RequestParam(required = false, defaultValue="1") int cPage, 
			@RequestParam(required=false,defaultValue="7") int numPerpage) {
		
		ModelAndView mv=new ModelAndView();
		
		String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		 
		List<Project> list=service.selectProjectList(id,cPage,numPerpage);
		
		int totalData=service.selectProjectCount(id);
		//List<String> pmNames=new ArrayList();
		for(Project p:list) {
			int pNo=p.getProjectNo();
			String names=service.selectProjectMembers(pNo);
			p.setMembers(names);
			
		}
		mv.addObject("list",list);
		mv.addObject("pageBar",getPage(totalData, cPage, numPerpage, "/stool/project/projectList.do"));
		//mv.addObject("member",pmNames);
		mv.setViewName("project/allProjectList");
		
		
		return mv;
	}
}
