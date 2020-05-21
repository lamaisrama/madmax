package com.madmax.stool.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.project.model.service.SelectedProjectSelectService;

@Controller
public class SelectedProjectSelectController {
	
	@Autowired
	private Logger logger;
	
	@Autowired
	private SelectedProjectSelectService service;
	
	@RequestMapping("/selectedProject/selectedProject.do")
	public ModelAndView selectSelectedProject(ModelAndView mv, int pjNo, String loginId) {
		
//		Map<String,Object> map=new HashMap();
		
		Map<String,Object> pjInfo = new HashMap();
		pjInfo.put("pjNo", pjNo);
		pjInfo.put("loginId", loginId);
		System.out.println("tq대체 왜!! :"+pjInfo.get("loginId"));
		
		Map<String,Object> projectInfo=service.selectProjectTB(pjNo);
		int favorite=service.selectFavorit(pjInfo);
		List<Map<String,Object>> projectBoardList=service.selectProjectBoard(pjNo);
		List<Map<String,Object>> writingList=service.selectWritingList(pjNo);
		List<Map<String,Object>> taskList=service.selectTaskList(pjNo);
		List<Map<String,Object>> scheduleList=service.selectScheduleList(pjNo);
//		Map<String,Object> pinpostCount=service.selectPinPostCount();
		
//		map.put("projectBoardList",projectBoardList);
//		map.put("writingList", writingList);
		mv.addObject("projectInfo",projectInfo);
		mv.addObject("favorite",favorite);
		mv.addObject("projectBoardList",projectBoardList);
		mv.addObject("writingList",writingList);
		mv.addObject("scheduleList",scheduleList);
		mv.addObject("taskList",taskList);
//		mv.addObject("pinpostCount",pinpostCount);
		mv.setViewName("selectedProject/selectedProject");
		return mv;
	}
	
	
}
