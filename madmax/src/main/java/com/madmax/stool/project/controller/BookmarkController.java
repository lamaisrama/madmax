package com.madmax.stool.project.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView selectBkList(HttpServletRequest req,
			@RequestParam(required = false, defaultValue="1") int pageNo) {
		ModelAndView mv=new ModelAndView();	
		//세션에서 로그인한 아이디값 가져오기
		
		String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		List<ProjectBoard> pb=service.selectPbList();
		List<BookmarkAll> list=service.selectBkList(id);
		List<BookmarkAll> viewList=new ArrayList<BookmarkAll>();
		logger.debug("북마크 테이블값:"+list.size());
		//다 가져온다음에
		//list index로 if 문 분기처리..
		//넘어온 값이 1보다 크면 그거랑 10까지 보내주기
		//처음엔 5개만 뿌려주고. 그담부턴 10개, 15개이런식으로 올라가게
		
		int numPerPage=2;
		int size= ((pageNo-1)/numPerPage)*numPerPage+1;
	/*	if(cPage==1) {*/
			for(int i=0;i<size+1;i++) {
				viewList.add(list.get(i));
				logger.debug("몇번 돔?"+i);
			}
			
		/*}if(cPage>1) {
			for(int i=0;i<((cPage-1)/numPerPage)*numPerPage+1;i++) {
				
			}
		}*/
		logger.debug("화면에 보일값"+viewList);//여기에 담아서.
		logger.debug("몇개?"+viewList.size());
		//가져온글 정렬하기(내림차순)
		Collections.sort(viewList);
		
		mv.addObject("pBoard",pb);
		mv.addObject("List",viewList);
		mv.setViewName("project/bookmarkList");
		
		
		
		return mv;
	}
	
	//내가 언급된 글 리스트 가져오기
	@RequestMapping("/project/myNoti.do")
	public ModelAndView selectNotiList(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		List<BookmarkAll> notilist=service.selectNotiList(id);
		
		notilist.get(0);
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
