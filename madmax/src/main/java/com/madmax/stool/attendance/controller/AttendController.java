package com.madmax.stool.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttendController {
	
//	@Autowired
//	AttendService service;
	
	@RequestMapping("/attd/attendList.do")
	public String attendList() {
		
		return "attendance/attendanceList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
