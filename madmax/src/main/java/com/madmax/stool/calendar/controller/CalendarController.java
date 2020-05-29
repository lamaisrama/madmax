package com.madmax.stool.calendar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.calendar.model.service.CalendarService;
import com.madmax.stool.calendar.model.vo.Calendar;

@Controller
public class CalendarController {

	@Autowired
	private CalendarService service;
	
	@Autowired
	private Logger logger;
	
	@RequestMapping("/calendar/calendar.do")
	public ModelAndView calendar(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		
		String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		List<Calendar> list=service.selectSchedule(id);
		logger.debug("보자"+list);
		
		mv.addObject("schedule",list);
		mv.setViewName("calendar/calendar");
		return mv;
	}
	
	
	
	
	
}
