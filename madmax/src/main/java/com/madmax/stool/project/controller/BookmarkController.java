package com.madmax.stool.project.controller;

import java.util.ArrayList;
import java.util.Collection;
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
		int size=(int)(((double)(pageNo-1)/numPerPage)*numPerPage+1);
		if(list.size()>0) {
			
				if(pageNo==1) {
						if(list.size()==1) {
							//글이 하나일때
								viewList.add(list.get(0));
							}else {
							//글이 하나이상일때는 numPerpage보여줘
								for(int i=0;i<numPerPage;i++) {
									viewList.add(list.get(i));
									logger.debug("몇번 돔?"+i);
									}
								}
				}else if(pageNo>1) {
					int length=size*2;
					logger.debug("돌 사이즈:"+length);
						if(length<list.size()) {
							for(int i=0;i<length;i++) {
								viewList.add(list.get(i));
								logger.debug("2번째 포문몇번 돔?"+i);
									}
							}else {
								for(int i=0;i<list.size();i++) {
								viewList.add(list.get(i));
								mv.addObject("msg","마지막 글입니다");
									}
							
							}
					}
				logger.debug("화면에 보일값"+viewList);//여기에 담아서.
				logger.debug("몇개?"+viewList.size());
				//가져온글 정렬하기(내림차순)
				Collections.sort(viewList);
				mv.addObject("List", viewList);
			}else {
				mv.addObject("pBoard",pb);
				mv.addObject("List",list);
				
			}
		
		mv.setViewName("project/bookmarkList");
		return mv;
	}
	
	//내가 언급된 글 리스트 가져오기
	@RequestMapping("/project/myNoti.do")
	public ModelAndView selectNotiList(HttpServletRequest req,
			@RequestParam(required = false, defaultValue="1") int pageNo) {
		ModelAndView mv=new ModelAndView();
		String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		List<BookmarkAll> notilist=service.selectNotiList(id);
		List<BookmarkAll> viewList=new ArrayList<BookmarkAll>();
		logger.debug("북마크 테이블값:"+notilist.size());
		//다 가져온다음에
		//list index로 if 문 분기처리..
		//넘어온 값이 1보다 크면 그거랑 10까지 보내주기
		//처음엔 5개만 뿌려주고. 그담부턴 10개, 15개이런식으로 올라가게
		int numPerPage=2;
		int size=(int)(((double)(pageNo-1)/numPerPage)*numPerPage+1);
		if(notilist.size()>0) {
			
				if(pageNo==1) {
						if(notilist.size()==1) {
							//글이 하나일때
								viewList.add(notilist.get(0));
							}else {
							//글이 하나이상일때는 numPerpage보여줘
								for(int i=0;i<numPerPage;i++) {
									viewList.add(notilist.get(i));
									logger.debug("몇번 돔?"+i);
									}
								}
				}else if(pageNo>1) {
					int length=size*2;
					logger.debug("돌 사이즈:"+length);
						if(length<notilist.size()) {
							for(int i=0;i<length;i++) {
								viewList.add(notilist.get(i));
								logger.debug("2번째 포문몇번 돔?"+i);
									}
							}else {
								for(int i=0;i<notilist.size();i++) {
								viewList.add(notilist.get(i));
								mv.addObject("msg","마지막 글입니다");
									}
							
						}
					
				}
			logger.debug("화면에 보일값"+viewList);//여기에 담아서.
			logger.debug("몇개?"+viewList.size());
			//가져온글 정렬하기(내림차순)
			Collections.sort(viewList);
			mv.addObject("List", viewList);
			}else {
			
			mv.addObject("List", notilist);

			}
		
		mv.setViewName("project/myNotiList");
		return mv;
	}
	//내가 쓴 게시물 가져오기
	@RequestMapping("/project/myBoard.do")
	public ModelAndView selectBoardList(HttpServletRequest req,
			@RequestParam(required = false, defaultValue="1") int pageNo) {
		ModelAndView mv=new ModelAndView();
		String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		List<BookmarkAll> boardlist=service.selectMyBoardList(id);
		List<BookmarkAll> viewList=new ArrayList<BookmarkAll>();
		logger.debug("북마크 테이블값:"+boardlist.size());
		//다 가져온다음에
		//list index로 if 문 분기처리..
		//넘어온 값이 1보다 크면 그거랑 10까지 보내주기
		//처음엔 5개만 뿌려주고. 그담부턴 10개, 15개이런식으로 올라가게
		int numPerPage=2;
		logger.debug("pageNo:"+pageNo);
		logger.debug("괄호안:"+((double)(pageNo-1)/numPerPage));
		int size=(int)(((double)(pageNo-1)/numPerPage)*numPerPage+1);
		logger.debug("사이즈몇인데"+size);
			if(boardlist.size()>0) {
			
					if(pageNo==1) {
							if(boardlist.size()==1) {
								//글이 하나일때
									viewList.add(boardlist.get(0));
								}else {
								//글이 하나이상일때는 numPerpage보여줘
									for(int i=0;i<numPerPage;i++) {
										viewList.add(boardlist.get(i));
										logger.debug("몇번 돔?"+i);
										}
									}
					}else if(pageNo>1) {
						int two=2;
						int length=size*two;
						logger.debug("돌 사이즈:"+length);
							if(length<boardlist.size()) {
								for(int i=0;i<length;i++) {
									viewList.add(boardlist.get(i));
									logger.debug("2번째 포문몇번 돔?"+i);
										}
								}else {
									for(int i=0;i<boardlist.size();i++) {
									viewList.add(boardlist.get(i));
									mv.addObject("msg","마지막 글입니다");
										}
								
							}
						
					}
				logger.debug("화면에 보일값"+viewList);//여기에 담아서.
				logger.debug("몇개?"+viewList.size());
				//가져온글 정렬하기(내림차순)
				Collections.sort(viewList);
				mv.addObject("List", viewList);
					}else {
		
						mv.addObject("List", boardlist);
											
					}
			mv.setViewName("project/myBoardList");
			return mv;
	}
	
}
