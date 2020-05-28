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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.attendance.model.service.AttendService;
import com.madmax.stool.attendance.model.vo.AttdSearch;
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
		//System.out.println(u);
		
		//today.
		w.setToday(today);
		w.setUserId(u.getUserId());
		//System.out.println(timeState);
		
		if(timeState.equals("출근")) {
			
			result=service.insertState(w);
			
		}else if(timeState.equals("퇴근")){
			
			if(service.selectCometime(w)!=null) {
				
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
				if(come.get(Calendar.HOUR)<9||goHome.get(Calendar.HOUR)>18) {
					
					result=service.insertEmpManage(wt.getManagementNo());
				}else if(come.get(Calendar.HOUR)>9){
					// 지각
					result=service.insertLate(wt.getManagementNo());
				}else {
					//결근
					result=service.insertAbsence(wt.getManagementNo());
				}
			
			}
			//System.out.println(result);
			
		}
		
		//mv.setViewName("index");
		mv.setViewName("redirect:/attd/attendList.do");
		
		return mv;
	}
	
	@RequestMapping("/attd/checkCometime.do")
	@ResponseBody
	public boolean checkCometime(HttpServletRequest req) {
		
		User u = (User)req.getSession().getAttribute("loginUser");
		
		Worktime w=new Worktime();
		Calendar cal=new GregorianCalendar();
		
		Date today=new Date(cal.getTimeInMillis());
		
		w.setToday(today);
		w.setUserId(u.getUserId());
		
		//System.out.println(s);
		
		// 출근 시간이 있으면 true,없으면 false;
		if(service.selectCometime(w)!=null) return true;
		else return false;
		
	}
	
	@RequestMapping("/attd/checkGotime.do")
	@ResponseBody
	public boolean checkGotime(HttpServletRequest req) {
		
		User u = (User)req.getSession().getAttribute("loginUser");
		
		Worktime w=new Worktime();
		Calendar cal=new GregorianCalendar();
		
		Date today=new Date(cal.getTimeInMillis());
		
		w.setToday(today);
		w.setUserId(u.getUserId());
		Worktime s=service.selectGotime(w);
		
		//System.out.println(s);
		
		// 퇴근시간이 안찍혀 있으면 true,
		return s!=null?true:false;
		
	}
	
	@RequestMapping("/attd/updateGoTime.do")
	public String updateGoTime(HttpServletRequest req,Worktime w) {
		
		Calendar cal=new GregorianCalendar();
		Date today=new Date(cal.getTimeInMillis());
		String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();

		w.setToday(today);
		w.setUserId(userId);
		int result=service.updateState(w);
		
		return "redirect:/attd/attendList.do"; 
	}
	
	@RequestMapping("/attd/noComeTime.do")
	@ResponseBody
	public String noComeTime(HttpServletRequest req,Worktime w,String timeState) {
		
		Calendar cal=new GregorianCalendar();
		Date today=new Date(cal.getTimeInMillis());
		String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();

		w.setToday(today);
		w.setUserId(userId);
		w.setTimeState(timeState);
		
		
		int result=service.insertNoCometime(w);
		
		//System.out.println("된거야 만거야1"+result);
		
		Worktime wt = service.selectWorktime(w);
		
		result=service.insertLate(wt.getManagementNo());
		
		//System.out.println("된거야 만거야2"+result);
		
		return "redirect:/attd/attendList.do";
		
	}
	
	@RequestMapping("/attd/searchAttendance.do")
	public String searchAttendance(HttpServletRequest req,Model m,String startDate,String endDate) {
		
		String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();

		AttdSearch search=new AttdSearch();
		search.setUserId(userId);
		search.setStartDate(startDate);
		search.setEndDate(endDate);
		
		List<Worktime> list=service.selectSearchAttd(search);
		m.addAttribute("list",list);
		
		return "attendance/attendanceList";
	}
	
}
