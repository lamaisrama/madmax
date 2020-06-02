package com.madmax.stool.project.controller;

import static com.madmax.stool.common.PagingFactory.getPage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.calendar.model.service.CalendarService;
import com.madmax.stool.calendar.model.vo.Calendar;
import com.madmax.stool.project.model.service.ProjectService;
import com.madmax.stool.project.model.vo.Favorite;
import com.madmax.stool.project.model.vo.Project;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	@Autowired
	private Logger logger;
	@Autowired
	private CalendarService cService;
	private String rootName="/stool";
	// 프로젝트 생성
	@RequestMapping("/project/insertProject.do")
	public String insertProject(Project p,Model m,HttpServletRequest req) {
		
	
		if(p.getProjectType()==null) {//디폴트는 공개 안함
			p.setProjectType("N");
		}else {
			p.setProjectType("Y");
		}
		String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		//세션에서 받아와 넣을것!
		p.setUserId(id);	
		 int result=service.insertProject(p);
		 
		 logger.debug("가져온 프로젝트번호:"+result);
		
		 if(result>0) {
		 m.addAttribute("msg","프로젝트 생성 성공"); 
		 m.addAttribute("loc","/selectedProject/selectedProject.do?pjNo="+result+"&loginId="+id); 
		 }else {
		 m.addAttribute("msg","프로젝트 생성 실패"); 
		 m.addAttribute("loc","/task/backhome.do"); 
		 }
		 

		return "common/msg";
	}
	
	//전체프로젝트 리스트 가져오기
	@RequestMapping("/project/projectList.do")
	public ModelAndView selectprojectList(HttpServletRequest req,
			@RequestParam(required = false, defaultValue="1") int cPage, 
			@RequestParam(required=false,defaultValue="7") int numPerpage) {
		
		ModelAndView mv=new ModelAndView();
		
		String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		 
		List<Project> list=service.selectProjectList(id,cPage,numPerpage);
		
		int totalData=service.selectProjectCount(id);
		int nameSize=0;//이름 숫자
		//List<String> pmNames=new ArrayList();
		for(Project p:list) {
			int pNo=p.getProjectNo();
			List<String> names=service.selectProjectMembers(pNo);
			String pmNames="";
			
			pmNames=String.join(",",names);
			p.setMemberCount(names.size());
			
			p.setMembers(pmNames);
			
			
		}
		mv.addObject("list",list);
		mv.addObject("pageBar",getPage(totalData, cPage, numPerpage, rootName+"/project/projectList.do"));
		//mv.addObject("member",pmNames);
		mv.setViewName("project/allProjectList");
		
		
		return mv;
	}
	
	//회사공개프로젝트 가져오는 메소드
	@RequestMapping("/project/companyProjectList.do")
	public ModelAndView selectComprojectList(HttpServletRequest req,
			@RequestParam(required = false, defaultValue="1") int cPage, 
			@RequestParam(required=false,defaultValue="7") int numPerpage) {
		
		ModelAndView mv=new ModelAndView();
		
		String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		 
		List<Project> list=service.selectComProjectList(id,cPage,numPerpage);
		
		int totalData=service.selectComProjectCount(id);
		//List<String> pmNames=new ArrayList();
		
		mv.addObject("list",list);
		mv.addObject("pageBar",getPage(totalData, cPage, numPerpage, "/stool/project/projectList.do"));
		//mv.addObject("member",pmNames);
		mv.setViewName("project/companyProjectList");
		
		
		return mv;
	}
	
	//즐찾프로젝트 
	@RequestMapping("/project/favList")
	public String favList(Model m, HttpServletRequest req) {
		
		String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		
		List<Favorite> list = service.selectFavorite(id);
		
		int total = service.selectFavoriteCount(id); 
		
		logger.debug("조회결과 : " + list);
		
		m.addAttribute("list", list);
		m.addAttribute("total", total);
		
		return "project/favoriteList";
	}

	@RequestMapping("/project/favList.do")
	public ModelAndView favList(ModelAndView mv,HttpServletRequest req) {
	
		String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		
		List<Favorite> list = service.selectFavorite(id);
		List<Calendar> cal=cService.selectSchedule(id);
		int total = service.selectFavoriteCount(id); 
		
		logger.debug("조회결과 : " + list);
		
		mv.addObject("schedule",cal);//일정도 같이 보여주자
		mv.addObject("list", list);
		mv.addObject("total", total);
		mv.setViewName("main");
		
		return mv;
	}
	
	
}
