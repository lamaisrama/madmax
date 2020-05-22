package com.madmax.stool.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.admin.model.service.AdminService;
import com.madmax.stool.admin.model.vo.AdminAttendManagement;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	
	//관리자 페이지로 이동
	@RequestMapping("/admin/adminIndex.do")
	public String adminIndexPage() {
		
		return "/admin/adminIndex";
	}
	
	
	@RequestMapping("/admin/adminAttendManagement.do")
	public String adminAttendManagement(Model m) {
		
		List<AdminAttendManagement> list=service.selectAttendList();
		
		m.addAttribute("list",list);
		
		return "/admin/attendManagement";
	}
	
	
	@RequestMapping("/admin/adminModifyRequest.do")
	public ModelAndView adminModifyRequest(ModelAndView mv,AdminAttendManagement am) {
		
		// modifyRequest 테이블 update문 requestNo를 사용
		int result=service.updateModifyRequest(am);
		
		
		// employeeManagement
		int result2=service.updateEmployeeManagement(am);
		//System.out.println("처리 됐는 지 체크"+result+result2);
		//System.out.println(am);
		
		mv.setViewName("redirect:/admin/adminAttendManagement.do");
		
		return mv;
	}
	
}
