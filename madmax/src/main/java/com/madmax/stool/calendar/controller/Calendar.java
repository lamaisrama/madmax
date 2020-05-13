package com.madmax.stool.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Calendar {

	@RequestMapping("/calendar/calendar.do")
	public String calendar() {
		
		return "calendar/calendar";
	}
	
	
	
	
	
}
