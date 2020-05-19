package com.madmax.stool.attendance.controller;


import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.attendance.model.service.AttendService;
import com.madmax.stool.attendance.model.vo.Attendance;
import com.madmax.stool.attendance.model.vo.Worktime;
import com.madmax.stool.user.model.vo.User;

@Controller
public class AttendController {
	
	@Autowired
	AttendService service;
	
	@RequestMapping("/attd/attendList.do")
	public String attendList(HttpServletRequest req,Model m) {
		
		
		
		User u = (User)req.getSession().getAttribute("loginUser");
		
		//System.out.println(u);
		
		List<Worktime> list=service.selectWorktimeList(u.getUserId());
		
		//System.out.println(list);
		
		
		m.addAttribute("list",list);
		
		return "attendance/attendanceList";
		
	}
	
	
	// 관리자한테 수정요청하기
	@RequestMapping("/attd/modifyRequest.do")
	public ModelAndView insertRequest(HttpServletRequest req,ModelAndView mv,Attendance a,@RequestParam int managementNo) {
		//System.out.println(a);
		
		User u = (User)req.getSession().getAttribute("loginUser");
		a.setUserId(u.getUserId());
		//a.setManagementNo(managementNo);
		//System.out.println("관리자 수정"+a);
		
		int result=service.insertRequest(a);
		
		
		//int result=service.updateRequestState(a);
				
		mv.setViewName("redirect:/attd/attendList.do");
		
		return mv;
	}
	
	@RequestMapping("/attd/stateRequest.do")
	public ModelAndView insertState(HttpServletRequest req,ModelAndView mv,Worktime w,@RequestParam String timeState) {
		
		//String timeState=req.getParameter("timeState");
		//System.out.println(timeState);
		//System.out.println("왜ㅜnulll,,,,,,,,,,,,,");
		//System.out.println(w);
		
		
		Calendar cal=new GregorianCalendar();
		
		int result=0;
		Date today=new Date(cal.getTimeInMillis());
		//System.out.println(today);
		
		User u = (User)req.getSession().getAttribute("loginUser");
		System.out.println(u);
		
		//today.
		w.setToday(today);
		w.setUserId(u.getUserId());
		
		if(timeState.equals("출근")) {
			
			result=service.insertState(w);
			
		}else if(timeState.equals("퇴근")){
			
			result=service.updateState(w);	
			
			Worktime wt = service.selectWorktime(w);
			
			
			Date go=wt.getGoTime();
			// 출근 시간 가져오기
			GregorianCalendar come=new GregorianCalendar();
			come.setTime(wt.getComeTime());
			
			//퇴근 시간 가져오기
			GregorianCalendar goHome=new GregorianCalendar();
			goHome.setTime(wt.getGoTime());
			
			//Worktime wt=service.selectCometime(w);
			
			//Worktime go=service.selectGotime(w);
			
			//int hour=Integer.parseInt(wt.getComeTime().substring(0, wt.getComeTime().indexOf(":")));
			  
			//if(Integer.parseInt(wt.getComeTime())<9&&Integer.parseInt(go.getGoTime())>18) {
			//	  service.insert
			//  }
			if(come.get(Calendar.HOUR)<9&&goHome.get(Calendar.HOUR)>16) {
				
				result=service.insertEmpManage(wt.getManagementNo());
			}else if(come.get(Calendar.HOUR)>9){
				result=service.insertLate(wt.getManagementNo());
			}else {
				result=service.insertAbsence(wt.getManagementNo());
			}
			
			System.out.println(result);
			
		}
		
		//mv.setViewName("index");
		mv.setViewName("redirect:/attd/attendList.do");
		
		return mv;
	}
	
	
	
	
}
