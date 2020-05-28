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
import com.madmax.stool.project.model.vo.AllAttachment;
import com.madmax.stool.project.model.vo.ProjectMember;

@Controller
public class SelectedProjectSelectController {
	
	@Autowired
	private Logger logger;
	
	@Autowired
	private SelectedProjectSelectService service;
	
	@RequestMapping("/selectedProject/selectedProject.do")
	public ModelAndView selectSelectedProject(ModelAndView mv, int pjNo, String loginId) {
		
	
		//프로젝트관련 정보
		Map<String,Object> pjInfo = new HashMap();
		pjInfo.put("pjNo", pjNo);
		pjInfo.put("loginId", loginId);
		Map<String,Object> projectInfo=service.selectProjectTB(pjNo);
		int favorite=service.selectFavorit(pjInfo);
		List<Map<String,Object>> bookmarkList=service.selectBookmarkList(pjInfo);
		List<Map<String,Object>> projectBoardList=service.selectProjectBoard(pjNo);
		List<ProjectMember> projectMember = service.selectProjectMemberList(pjNo);
		
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

		//상단 고정 갯수
		Map<String,Object> pinpostCount=service.selectPinPostCount();
		
		//태그
		List<Map<String,Object>> hashTag=service.selectHashTag();
		
		//언급
		List<Map<String,Object>> notification=service.selectNotification();
		
		//프로젝트 참여 멤버 수
//		Map<String,Object> projectMemberNo=service.selectProjectMemberNo();
		
		//한 프로젝트의 파일함의 파일 가져오기
		//List<Map<String,Object>> allFileList=service.selectAllFileList(pjNo);
		List<AllAttachment> attachments=service.selectAllProjectFiles(pjNo);
		
		
		//오른쪽 사이드바 프로젝트 참여자 가져오기
//		List<Map<String,Object>> projectMember=service.selectProjectMember();
		
		//스툴유저 테이블 가져오기
		List<Map<String,Object>> user=service.selectUser();
		
		mv.addObject("projectInfo",projectInfo);
		mv.addObject("favorite",favorite);
		if(bookmarkList.size()>0) mv.addObject("bookmarkList",bookmarkList);
		if(projectMember.size()>0) mv.addObject("projectMember",projectMember);
		if(projectBoardList.size()>0) mv.addObject("projectBoardList",projectBoardList);		
		
		if(writingList.size()>0) mv.addObject("writingList",writingList);
		if(taskList.size()>0) mv.addObject("taskList",taskList);
		if(scheduleList.size()>0) mv.addObject("scheduleList",scheduleList);
		
		if(writingComment.size()>0) mv.addObject("writingComment",writingComment);
		if(taskComment.size()>0)mv.addObject("taskComment",taskComment);
		if(scheduleComment.size()>0)mv.addObject("scheduleComment",scheduleComment);
		
		if(writingAttachment.size()>0)mv.addObject("writingAttachment",writingAttachment);
		if(taskAttachment.size()>0)mv.addObject("taskAttachment",taskAttachment);
		if(taskManager.size()>0)mv.addObject("taskManager",taskManager);
		
		if(pinpostCount.size()>0)mv.addObject("pinpostCount",pinpostCount);
		
		if(hashTag.size()>0)mv.addObject("hashTag",hashTag);
		if(notification.size()>0)mv.addObject("notification",notification);
		
//		if(projectMember.size()>0)mv.addObject("projectMember",projectMember);
		
//		mv.addObject("projectMemberNo",projectMemberNo);
		//if(allFileList.size()>0)mv.addObject("allFileList",allFileList);
		if(attachments.size()>0)mv.addObject("allFileList",attachments);
		mv.addObject("user",user);
		
		
		
		
		mv.setViewName("selectedProject/selectedProject");
		
		
		
		return mv;
	}
	
	
}
