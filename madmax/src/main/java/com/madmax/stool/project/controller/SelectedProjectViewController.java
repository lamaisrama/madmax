package com.madmax.stool.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SelectedProjectViewController {
	
	
	
	@RequestMapping("/selectedProject/selectedProject-postView.do")
	public ModelAndView selectSelectedProject(ModelAndView mv,int no) {
//		mv.addObject("",service.selectSelectedProject(no));
//		mv.addObject("",service.);
//		mv.setViewName("selectedProject/selectedProject-postView");
		return mv;
	}
	
	
}
