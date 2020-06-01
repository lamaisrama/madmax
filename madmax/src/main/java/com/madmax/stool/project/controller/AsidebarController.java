package com.madmax.stool.project.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.project.model.service.AsidebarService;
import com.madmax.stool.project.model.vo.AllAttachment;
import com.madmax.stool.project.model.vo.InsertProjectMember;


@Controller
public class AsidebarController {
	
	@Autowired
	private Logger logger;
	
	@Autowired
	private AsidebarService service;
	
	//프로젝트 참여자 추가하기
	@RequestMapping("/aside/insertProjectMember.do")
	@ResponseBody
	public int insertProjectMember(HttpServletRequest request,@RequestParam Map<String, Object> map) {
		
		System.out.println(map);
		int result=service.insertProjectMember(map);
		return result;
	}
	

	//오른쪽 사이드바 프로젝트 전체 멤버 리스트 + 프로젝트 참여 인원수 보여주기 (실패..한 로직이지만 해결됨 ㅠㅠ)
//	@RequestMapping
//	public ModelAndView MemberCount(ModelAndView mv,int pjNo) {
//		
//		//프로젝트 참여자 수 
//		int memberCount=service.selectMemberCount(pjNo);
//		
//		mv.addObject("memberCount",memberCount);
//		mv.setViewName("selectedProject/asidebar");
//		System.out.println("멤버수:"+memberCount);
//		return mv; 
//	
//	}

	//한 프로젝트에서 업로드된 모든 파일 불러오기
	
//	@RequestMapping
//	public ModelAndView selectFileList(int pjNo,ModelAndView mv) {
//		
//		List<AllAttachment> attachments=service.selectAllProjectFiles(pjNo);
//
//		mv.addObject("attchments",attachments);
//		
//		mv.setViewName("selectedProject/asidebar");
//		logger.debug(""+attachments);
//		return mv;
//	}
	

	
}
