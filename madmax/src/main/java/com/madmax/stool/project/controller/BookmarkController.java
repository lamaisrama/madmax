package com.madmax.stool.project.controller;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.project.model.service.BookmarkService;
import com.madmax.stool.project.model.vo.BookmarkAll;

@Controller
public class BookmarkController {
	
	@Autowired
	private Logger logger;
	@Autowired
	private BookmarkService service;

	
	@RequestMapping("/project/bookmarkList.do")
	public ModelAndView selectBkList() {
		ModelAndView mv=new ModelAndView();	
		//세션에서 로그인한 아이디값 가져오기
		String id="user1";
		List<BookmarkAll> list=service.selectBkList(id);
		
		mv.addObject("List",list);
		mv.setViewName("project/bookmarkList");
		
		
		
		return mv;
	}
}
