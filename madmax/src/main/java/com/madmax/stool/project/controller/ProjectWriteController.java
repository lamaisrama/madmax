package com.madmax.stool.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectWriteController {

	@RequestMapping("/project/selectedPproject.do")
	public String selectedProject() {
		return "selectedProject/selectedProject";
	}
	
}
