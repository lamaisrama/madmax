package com.madmax.stool.approval.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.approval.model.service.ApprovalService;
import com.madmax.stool.approval.model.vo.ApprDocType;
import com.madmax.stool.approval.model.vo.DeptUsers;
import com.madmax.stool.approval.model.vo.User;
import com.madmax.stool.common.PagingFactory;

@Controller
public class ApprovalController {
	@Autowired 
	ApprovalService service;
	
	
	@RequestMapping("/appr/approval.do")
	public ModelAndView approvalList(ModelAndView mv, 
			@RequestParam(required = false, defaultValue="1") int cPage,
			@RequestParam(required=false, defaultValue="10") int numPerPage) {
		List<ApprDocType> list = service.selectApprDocList(cPage, numPerPage);
		int totalData = service.selectApprDocListCount();
		mv.addObject("list", list);
		mv.addObject("pageBar", PagingFactory.getPage(totalData, cPage, numPerPage, "/stool/appr/approval.do"));
		mv.setViewName("approval/apprList");
		return mv;
	}
	
	@RequestMapping("/appr/apprReqBox.do")
	public String appovalRequestBox() {
		return "approval/apprReqBox";
	}
	
	@RequestMapping("/appr/draftForm.do")
	public ModelAndView selectDraftForm(ModelAndView mv, @RequestParam(required=false, defaultValue="3") int dNo) {
		mv.addObject("type", service.selectApprDocForm(dNo));
		mv.setViewName("/approval/apprDocWrite");
		return mv;
	}
	
	@RequestMapping("/appr/draftFormEnd")
	public String selectDraftFormEnd() {
		
		return "";
	}
	
	@RequestMapping("/appr/purchaseForm.do")
	public String selectPurchaseForm() {
		return "approval/apprDocForm/purchaseReq";
	}
	
	@RequestMapping("/appr/line.do")
	public ModelAndView approvalLine(ModelAndView mv) {
		
		List<DeptUsers> deptUsers = service.selectDeptInfo(); 
		
		
		for(DeptUsers du : deptUsers) { 
			List<User> users = service.selectDeptUsers(du);
			du.setUsers(users);
			System.out.println(du);
		}
		
		
		mv.addObject("list", deptUsers);
		mv.setViewName("approval/apprLine");
		return mv;
	}
	
	@RequestMapping("/appr/apprTempBox.do")
	public String approvalTempBox() {
		return "approval/apprTempBox";
	}
	@RequestMapping("/appr/apprWaitBox.do")
	public String approvalWaitBox() {
		return "approval/apprWaitBox";
	}
	@RequestMapping("/appr/apprProgBox.do")
	public String approvalProgBox() {
		return "approval/apprProgBox";
	}
	@RequestMapping("/appr/apprDoneBox.do")
	public String approvalDoneBox() {
		return "approval/apprDoneBox";
	}
	@RequestMapping("/appr/myDocBox")
	public String myDocBox() {
		return "/approval/myDocBox";
	}
	@RequestMapping("/appr/deptDocBox")
	public String deptDocBox() {
		return "approval/deptDocBox";
	}
	@RequestMapping("/appr/myStorageBox")
	public String myStorageBox() {
		return "approval/myStorageBox";
	}
	
	@RequestMapping("/appr/test.do")
	public String test() {
		return "";
	}
	@RequestMapping("/appr/checkUserName")
	public User checkUserName() {
		
		return new User();
	}
	

}

