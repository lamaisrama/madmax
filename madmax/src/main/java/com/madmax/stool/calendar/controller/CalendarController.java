package com.madmax.stool.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@RequestMapping("/calendar/projectCalendar.do")
	public ModelAndView projectCalendar(int pjNo,HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		Map<String,Object> map=new HashMap();
		String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		map.put("id", id);
		map.put("pjNo",pjNo);
		List<Calendar> list=service.selectProjectSchedule(map);
		logger.debug("보자"+list);
		String pjTitle=service.selectProjectTitle(pjNo);
		
		mv.addObject("projectTitle",pjTitle);
		mv.addObject("schedule",list);
		mv.setViewName("calendar/projectCalendar");
		return mv;
	}
	
	
	
	
	
}
