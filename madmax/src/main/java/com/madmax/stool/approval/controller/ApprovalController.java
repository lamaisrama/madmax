package com.madmax.stool.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.madmax.stool.approval.model.vo.User;

@Controller
public class ApprovalController {
	
	
	@RequestMapping("/appr/approval.do")
	public String approvalList() {
		return "approval/apprList";
	}
	
	@RequestMapping("/appr/apprReqBox.do")
	public String appovalRequestBox() {
		return "approval/apprReqBox";
	}
	
	@RequestMapping("/appr/draftForm.do")
	public String selectDraftForm(@RequestParam(required=false, defaultValue="1") int dNo) {
		
		return "approval/apprDraft";
	}
	
	@RequestMapping("/appr/purchaseForm.do")
	public String selectPurchaseForm() {
		return "approval/apprDocForm/purchaseReq";
	}
	
	@RequestMapping("/appr/line.do")
	public String approvalLine() {
		return "approval/apprLine";
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

