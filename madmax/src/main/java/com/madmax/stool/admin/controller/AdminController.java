package com.madmax.stool.admin.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.madmax.stool.admin.model.service.AdminService;
import com.madmax.stool.admin.model.vo.AdminAttendManagement;
import com.madmax.stool.admin.model.vo.AdminUserManage;
import com.madmax.stool.admin.model.vo.DeptReport;
import com.madmax.stool.common.PagingFactory;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	private String rootName="/20PM_stool_final";
	//private String rootName="/stool";
	
	
	//관리자 페이지로 이동
	@RequestMapping("/admin/adminIndex.do")
	public ModelAndView adminIndexPage(ModelAndView mv) {
		
		List<DeptReport> report=service.selectUserReport();
		
		Gson gson=new Gson();
		JsonArray jArray=new JsonArray();
	      
	    Iterator<DeptReport> it=report.iterator();
	    
	    
	    while(it.hasNext()) {
	    	
	    	DeptReport dr=it.next();
	    	JsonObject object=new JsonObject();
	    	String deptName=dr.getDeptName();
	    	int cnt=dr.getCnt();
	    			
	    	object.addProperty("deptName", deptName);
	    	object.addProperty("count", cnt);
	    	jArray.add(object);
	    	
	    }
	    
	    String json=gson.toJson(jArray);
	    mv.addObject("json",json);
		
		mv.setViewName("/admin/adminIndex");
		
		
		return mv;
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
	
	// 가입 승인 대기 리스트
	@RequestMapping("/admin/signupApproval.do")
	public String signupApproval(Model m) {
		
		List<AdminUserManage> list=service.selectSignupApproval();
		
		m.addAttribute("list",list);
		
		return "/admin/adminSignupApproval";
		
		
	}
	
	@RequestMapping("/admin/updateUserState.do")
	public String updateUserState(Model m,HttpServletRequest req,String userId) {
		//String userId=aum.getUserId();
		
		System.out.println(userId);
		int result=service.updateUserState(userId);
		
		return "redirect:/admin/signupApproval.do";
	}
	
	
	// 멤버 관리 
	@RequestMapping("/admin/userManagement.do")
	public ModelAndView userManagement(ModelAndView mv,@RequestParam(required=false,defaultValue="1") int cPage,
			@RequestParam(required=false,defaultValue="10")int numPerPage) {
		
		List<AdminUserManage> list=service.selectAllUser(cPage,numPerPage);
		
		int totalData=service.selectUserCount();
		
		

		mv.addObject("list",list);
		mv.addObject("total",totalData);
		mv.addObject("pageBar",PagingFactory.getPage(totalData, cPage, numPerPage, rootName+"/admin/userManagement.do"));
		
		mv.setViewName("admin/userManagement");
		
		
		return mv;
	}
	
	
	
	  // 직급 부여 
	@RequestMapping("/admin/modifyJobLevel.do")
	public ModelAndView jobManagement(ModelAndView mv,AdminUserManage aum) {
		System.out.println("확인"+aum);
		
		int result=service.updateJobCode(aum);
		
		mv.setViewName("redirect:/admin/userManagement.do");
		
		return mv;
	  
	}
	  
	 
	
	
}
