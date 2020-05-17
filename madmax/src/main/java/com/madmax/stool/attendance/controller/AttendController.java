package com.madmax.stool.attendance.controller;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.attendance.model.service.AttendService;
import com.madmax.stool.attendance.model.vo.Attendance;
import com.madmax.stool.attendance.model.vo.WorkTime2;
import com.madmax.stool.attendance.model.vo.Worktime;

@Controller
public class AttendController {
	
	@Autowired
	AttendService service;
	
	@RequestMapping("/attd/attendList.do")
	public String attendList(Model m) {
		
		String userId="user01";
		List<Worktime> list=service.selectWorktimeList(userId);
		m.addAttribute("list",list);
		
		return "attendance/attendanceList";
	}
	
	@RequestMapping("/attd/modifyRequest.do")
	public ModelAndView insertRequest(ModelAndView mv,Attendance a) {
		//System.out.println(a);
		int result=service.insertRequest(a);
		
		mv.setViewName("attendance/attendanceList");
		
		return mv;
	}
	
	@RequestMapping("/attd/stateRequest.do")
	public ModelAndView insertState(ModelAndView mv,Worktime w,@RequestParam String timeState) {
		
		//String timeState=req.getParameter("timeState");
		//System.out.println(timeState);
		//System.out.println("왜ㅜnulll,,,,,,,,,,,,,");
		//System.out.println(w);
		
		
		Calendar cal=new GregorianCalendar();
		
		int result=0;
		Date today=new Date(cal.getTimeInMillis());
		//System.out.println(today);
		
		w.setToday(today);
		w.setUserId("user01");
		
		if(timeState.equals("출근")) {
			
			result=service.insertState(w);
			
		}else if(timeState.equals("퇴근")){
			
			result=service.updateState(w);
			
			// 출근 시간 가져오기
			Worktime wt=service.selectCometime();
			
			/*
			 * if(wt.getComeTime()>9) {
			 * 
			 * }
			 */
			
			
			result=service.insertEmpManage();
			System.out.println(result);
			
		}
		
		//mv.setViewName("index");
		mv.setViewName("redirect:/attd/attendList.do");
		
		return mv;
	}
	
	
	
	
}
