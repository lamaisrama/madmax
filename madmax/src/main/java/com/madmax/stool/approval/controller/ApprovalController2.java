package com.madmax.stool.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApprovalController2 {

	
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
}
