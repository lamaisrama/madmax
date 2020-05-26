package com.madmax.stool.project.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.madmax.stool.project.model.service.BookmarkService;
import com.madmax.stool.project.model.vo.BookmarkAll;
import com.madmax.stool.project.model.vo.ProjectBoard;


@Controller
public class BookmarkController {
	
	@Autowired
	private Logger logger;
	@Autowired
	private BookmarkService service;

	//내가 담아둔글 리스트 가져오기
	@RequestMapping("/project/bookmarkList.do")
	public ModelAndView selectBkList(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();	
		//세션에서 로그인한 아이디값 가져오기
		
		String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		List<ProjectBoard> pb=service.selectPbList();
		List<BookmarkAll> list=service.selectBkList(id);
		logger.debug("북마크 테이블값:"+list.size());
		
		//가져온글 정렬하기(내림차순)
		Collections.sort(list);
		
		mv.addObject("pBoard",pb);
		mv.addObject("List",list);
		mv.setViewName("project/bookmarkList");
		
		
		
		return mv;
	}
	
	//내가 언급된 글 리스트 가져오기
	@RequestMapping("/project/myNoti.do")
	public ModelAndView selectNotiList(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		List<BookmarkAll> notilist=service.selectNotiList(id);
		
		Collections.sort(notilist);
		
		mv.addObject("List",notilist);
		mv.setViewName("project/myNotiList");
		
		
		return mv;
	}
	//내가 쓴 게시물 가져오기
	@RequestMapping("/project/myBoard.do")
	public ModelAndView selectBoardList(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		List<BookmarkAll> boardlist=service.selectMyBoardList(id);
		
		Collections.sort(boardlist);
		
		mv.addObject("List", boardlist);
		mv.setViewName("project/myBoardList");
		return mv;
	}
	
}
