package com.madmax.stool.approval.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.madmax.stool.approval.model.service.ApprovalService2;
import com.madmax.stool.approval.model.vo.ApprDoc;
import com.madmax.stool.approval.model.vo.Approval;
import com.madmax.stool.common.PagingFactory;
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
	  public String approvalProgBox(HttpServletRequest req, Model m,
					@RequestParam(required = false, defaultValue = "1") int cPage,
					@RequestParam(required = false, defaultValue = "10") int numPerPage) {

			String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();
			List<Approval> list=service.selectApprProgList(cPage, numPerPage, userId);
			int totalData = service.selectApprProgListCount(userId);		  
			m.addAttribute("list",list);
			m.addAttribute("totalData", totalData);
			m.addAttribute("pageBar", PagingFactory.getPage(totalData, cPage, numPerPage, "/stool/appr/apprProgBox.do"));
		  
		  return "approval/apprProgBox";
	  
	  }
	  
	  @RequestMapping("/appr/apprDoneBox.do")
	  public String apprDoneBox(HttpServletRequest req,Model m,
				@RequestParam(required = false, defaultValue = "1") int cPage,
				@RequestParam(required = false, defaultValue = "10") int numPerPage) {
		  	
		  String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();

		  List<Approval> list=service.selectApprDoneList(cPage, numPerPage, userId);
		  int totalData = service.selectApprDoneListCount(userId);	
		  m.addAttribute("list",list);
		  m.addAttribute("totalData", totalData);
		  m.addAttribute("pageBar", PagingFactory.getPage(totalData, cPage, numPerPage, "/stool/appr/apprDoneBox.do"));
		  return "approval/apprDoneBox";
	  }
	 
	  
	  @RequestMapping("/appr/apprOpinion")
	  public String apprOpinion(HttpServletRequest req,Model m,int apprNo) {
		
		  String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();
		  Approval approval=new Approval();
		  
		  approval.setUserId(userId);
		  approval.setApprNo(apprNo);
		  
		  List<ApprDoc> appr=service.selectApprOpinionList(approval);
		  
		  m.addAttribute("appr",appr);
		  
		  return "approval/openApprOpinion";
		  
	  }
	  
	  @RequestMapping("/appr/openApprDoneOpinion")
	  public String apprDoneOpinion(HttpServletRequest req,Model m,int apprNo) {
	  
		  String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();
		  Approval approval=new Approval();
		  
		  approval.setUserId(userId);
		  approval.setApprNo(apprNo);
		  
		  List<ApprDoc> appr=service.selectApprDoneOpinionList(approval);
		  
		  m.addAttribute("appr",appr);
		  
		  return "approval/openApprDoneOpinion";
	  }
	  
	  
	  
}
