package com.madmax.stool.approval.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.madmax.stool.approval.model.service.ApprovalService2;
import com.madmax.stool.approval.model.vo.Approval;
import com.madmax.stool.user.model.vo.User;

@Controller
public class ApprovalController2 {

	@Autowired
	ApprovalService2 service;

	@RequestMapping("/appr/dayOff.do")
	public String apprDayOff() {

		return "approval/apprDocForm/apprDraftDayOff";
	}

	@RequestMapping("/appr/businesTripSettlement.do")
	public String apprbusinesTripSettlement() {

		return "approval/apprDocForm/apprBusinessTripSettlement";
	}

	@RequestMapping("/appr/businesTrip.do")
	public String apprbusinesTrip() {

		return "approval/apprDocForm/apprBusinessTrip";
	}

	
	  @RequestMapping("/appr/apprProgBox.do") 
	  public String approvalProgBox(HttpServletRequest req,Model m) {
	  
		  String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();
		  //System.out.println("userId확인 "+userId);
		  List<Approval> list=service.selectApprProgList(userId);
		  
		  m.addAttribute("list",list);
		  
		  return "approval/apprProgBox";
	  
	  }
	  
	  @RequestMapping("/appr/apprDoneBox.do")
	  public String apprDoneBox(HttpServletRequest req,Model m) {
		  	
		  String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();

		  List<Approval> list=service.selectApprDoneList(userId);
		  
		  m.addAttribute("list",list);
		  
		  return "approval/apprDoneBox";
	  }
	 
}
