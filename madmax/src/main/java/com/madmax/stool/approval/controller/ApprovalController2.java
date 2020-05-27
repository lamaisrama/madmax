package com.madmax.stool.approval.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.madmax.stool.approval.model.service.ApprovalService2;
import com.madmax.stool.approval.model.vo.ApprDoc;
import com.madmax.stool.approval.model.vo.ApprSearch;
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
	  
	  @RequestMapping("/appr/searchApprReqBox.do")
	  public String searchApprReqBox(HttpServletRequest req,Model m,String draftName,String startDate,String endDate,String url) {
		  
		  String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();
		  
		  ApprSearch search=new ApprSearch();
		  
		  search.setDraftName(draftName);
		  search.setStartDate(startDate);
		  search.setEndDate(endDate);
		  search.setUserId(userId);
		  
		  //System.out.println("search 확인 :"+search);
		  
		  List<Approval> list=service.selectSearchApprReqBox(search);
		  
		  m.addAttribute("list",list);
		  
		  return url;
	  }
	  
	  @RequestMapping("/appr/searchApprTempBox.do")
	  public String searchApprTempBox(HttpServletRequest req,Model m,String draftName,String startDate,String endDate,String url) {
		  
		  String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();
		  
		  ApprSearch search=new ApprSearch();
		  
		  search.setDraftName(draftName);
		  search.setStartDate(startDate);
		  search.setEndDate(endDate);
		  search.setUserId(userId);
		  
		  //System.out.println("search 확인 :"+search);
		  
		  List<Approval> list=service.selectSearchApprTempBox(search);
		  
		  m.addAttribute("list",list);
		  
		  return url;
	  }
	  @RequestMapping("/appr/searchApprWaitBox.do")
	  public String searchApprWaitBox(HttpServletRequest req,Model m,String draftName,String startDate,String endDate,String url) {
		  
		  String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();
		  
		  ApprSearch search=new ApprSearch();
		  
		  search.setDraftName(draftName);
		  search.setStartDate(startDate);
		  search.setEndDate(endDate);
		  search.setUserId(userId);
		  
		  //System.out.println("search 확인 :"+search);
		  
		  List<Approval> list=service.selectSearchApprWaitBox(search);
		  
		  m.addAttribute("list",list);
		  
		  return url;
	  }
	  @RequestMapping("/appr/searchApprProgBox.do")
	  public String searchApprProgBox(HttpServletRequest req,Model m,String draftName,String startDate,String endDate,String url) {
		  
		  String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();
		  
		  ApprSearch search=new ApprSearch();
		  
		  search.setDraftName(draftName);
		  search.setStartDate(startDate);
		  search.setEndDate(endDate);
		  search.setUserId(userId);
		  
		  //System.out.println("search 확인 :"+search);
		  
		  List<Approval> list=service.selectSearchApprProgBox(search);
		  
		  m.addAttribute("list",list);
		  
		  return url;
	  }
	  
	  
	 // 결재완료 기능 
	  @RequestMapping("/appr/searchApprDoneBox.do")
	  public String searchApprDoneBox(HttpServletRequest req,Model m,String draftName,String startDate,String endDate,String url,int apprStatus) {
		  
		  String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();
		  
		  ApprSearch search=new ApprSearch();
		  
		  search.setDraftName(draftName);
		  search.setStartDate(startDate);
		  search.setEndDate(endDate);
		  search.setUserId(userId);
		  search.setApprStatus(apprStatus);
		  
		  //System.out.println("search 확인 :"+search);
		  System.out.println("결재 완료 ?"+search);
		  List<Approval> list=service.selectSearchApprDoneBox(search);
		  
		  m.addAttribute("list",list);
		  
		  return url;
	  }
	  
	  
	  
	  @RequestMapping("/appr/searchMyDocBox.do")
	  public String searchMyDocBox(HttpServletRequest req,Model m,String draftName,String startDate,String endDate,String url) {
		  
		  String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();
		  
		  ApprSearch search=new ApprSearch();
		  
		  search.setDraftName(draftName);
		  search.setStartDate(startDate);
		  search.setEndDate(endDate);
		  search.setUserId(userId);
		  
		  //System.out.println("search 확인 :"+search);
		  
		  List<Approval> list=service.selectSearchMyDocBox(search);
		  
		  m.addAttribute("list",list);
		  
		  return url;
	  }
	  
	  @RequestMapping("/appr/searchDeptDocBox.do")
	  public String searchDeptDocBox(HttpServletRequest req,Model m,String draftName,String startDate,String endDate,String url) {
		  
		  String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();
		  String userDept=((User)req.getSession().getAttribute("loginUser")).getDeptCode();
		  ApprSearch search=new ApprSearch();
		  
		  search.setDraftName(draftName);
		  search.setStartDate(startDate);
		  search.setEndDate(endDate);
		  search.setUserId(userId);
		  search.setDeptCode(userDept);
		  
		  //System.out.println("search 확인 :"+search);
		  
		  List<Approval> list=service.selectSearchDeptDocBox(search);
		  
		  m.addAttribute("list",list);
		  
		  return url;
	  }
	  
	  @RequestMapping("/appr/searchRefferedDocBox.do")
	  public String searchRefferedBox(HttpServletRequest req,Model m,String draftName,String startDate,String endDate,String url,int apprStatus) {
		  
		  String userId=((User)req.getSession().getAttribute("loginUser")).getUserId();
		  String userDept=((User)req.getSession().getAttribute("loginUser")).getDeptCode();
		  ApprSearch search=new ApprSearch();
		  
		  search.setDraftName(draftName);
		  search.setStartDate(startDate);
		  search.setEndDate(endDate);
		  search.setUserId(userId);
		  search.setDeptCode(userDept);
		  search.setApprStatus(apprStatus);
		  
		  //System.out.println("search 확인 :"+search);
		  
		  List<Approval> list=service.searchRefferedDocBox(search);
		  
		  m.addAttribute("list",list);
		  
		  return url;
	  }
	  
	  
}
