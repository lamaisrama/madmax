package com.madmax.stool.project.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProjectWriteController {

	@RequestMapping("/selectedProject/selectedProject.do")
	public String selectedProject() {
		return "selectedProject/selectedProject";
	}
	
	@RequestMapping("/selectedProject/insertSelectedProject.do")
	public ModelAndView insertSelectedProject(Map<String, String> map, ModelAndView mv) {
		
        // 방법 01 : entrySet()
        for (Map.Entry<String, String> entry : map.entrySet()) {
            System.out.println("[key]:" + entry.getKey() + ", [value]:" + entry.getValue());
        }
		
		return mv;
	}
	
}
