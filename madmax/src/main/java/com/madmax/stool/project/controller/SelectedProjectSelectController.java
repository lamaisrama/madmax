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
	
	@RequestMapping("/selectedProject/selectedProjectView.do")
	public ModelAndView selectSelectedProject(ModelAndView mv, int pjNo) {
		
	
		List<Map<String,Object>> projectBoardList=service.selectProjectBoard(pjNo);
		
		//글
		List<Map<String,Object>> writingList=service.selectWritingList(pjNo);
		List<Map<String,Object>> writingComment=service.selectWritingComment();
		List<Map<String,Object>> writingAttachment=service.selectWritingAttachment();
		
		//업무
		List<Map<String,Object>> taskList=service.selectTaskList(pjNo);
		List<Map<String,Object>> taskComment=service.selectTaskComment();
		List<Map<String,Object>> taskManager=service.selectTaskManager();
		List<Map<String,Object>> taskAttachment=service.selectTaskAttachment();
		
		//일정
		List<Map<String,Object>> scheduleList=service.selectScheduleList(pjNo);
		List<Map<String,Object>> scheduleComment=service.selectScheduleComment();
//		List<Map<String,Object>> scheduleManager=service.selectScheduleManager();

		//상단 고정 갯수
		Map<String,Object> pinpostCount=service.selectPinPostCount();
		
		//태그
		List<Map<String,Object>> hashTag=service.selectHashTag();
		
		//언급
		List<Map<String,Object>> notification=service.selectNotification();
		List<Map<String,Object>> projectMember=service.selectProjectMember();
		 
		
		
		mv.addObject("projectBoardList",projectBoardList);
		mv.addObject("writingList",writingList);
		mv.addObject("scheduleList",scheduleList);
		mv.addObject("taskList",taskList);
		
		mv.addObject("pinpostCount",pinpostCount);
		
		mv.addObject("writingComment",writingComment);
		mv.addObject("taskComment",taskComment);
		mv.addObject("scheduleComment",scheduleComment);
		
		mv.addObject("writingAttachment",writingAttachment);
		mv.addObject("taskAttachment",taskAttachment);
		
		mv.addObject("taskManager",taskManager);
		mv.addObject("hashTag",hashTag);
		mv.addObject("notification",notification);
		mv.addObject("projectMember",projectMember);
		mv.setViewName("selectedProject/selectedProject");
		return mv;
	}
	
	
}
