package com.madmax.stool.project.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.project.model.service.AsidebarService;
import com.madmax.stool.project.model.service.SelectedProjectSelectService;

public class AsidebarController {
	
	@Autowired
	private Logger logger;
	
	@Autowired
	private AsidebarService service;
	
	public ModelAndView selectProjectMemberNo(ModelAndView mv,int pjNo) {
		//프로젝트 참여자 수 
		Map<String,Object> projectMemberNo=service.selectProjectMemberNo(pjNo);
		
		//프로젝트 참여자 리스트 가져옴
//		List<Map<String,Object>> projectMemberList=service.selectProjectMemberList(pjNo);
		
		
		//스툴유저 가져옴
		List<Map<String,Object>> user=service.selectStoolUser(pjNo);
		
		
		mv.addObject("projectMemberNo",projectMemberNo);
//		if(projectMemberList.size()>0)mv.addObject("projectMemberList",projectMemberList);
		mv.addObject("user",user);
		
		return mv;
	}
}
