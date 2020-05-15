package com.madmax.stool.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.attendance.model.service.AttendService;
import com.madmax.stool.attendance.model.vo.Attendance;

@Controller
public class AttendController {
	
	@Autowired
	AttendService service;
	
	@RequestMapping("/attd/attendList.do")
	public String attendList() {
		
		
		
		
		return "attendance/attendanceList";
	}
	
	@RequestMapping("/attd/modifyRequest.do")
	public ModelAndView insertRequest(ModelAndView mv,Attendance a) {
		System.out.println(a);
		int result=service.insertRequest(a);
		
		mv.setViewName("attendance/attendanceList");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
}
