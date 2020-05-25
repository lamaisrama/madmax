package com.madmax.stool.task.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.project.model.vo.Project;
import com.madmax.stool.task.model.service.TaskService;
import com.madmax.stool.task.model.vo.TaskFilter;
import com.madmax.stool.task.model.vo.TaskPb;

@Controller

public class TaskController {
	
	@Autowired
	private TaskService service;
	
	@Autowired
	private Logger logger;
	
	
	
	@RequestMapping("/task/selectTask.do")
	public ModelAndView selectTask(ModelAndView mv,HttpServletRequest req) {
		//프로젝트 테이블에서 프로젝트 명 가져오기
		//세션에서 로그인한 멤버의 아이디값을 가져와서
		//그 사용자를 프로젝트 참여 멤버테이블에서 찾아. 
		//세션에서 가져왔다고 가정하고, String을 보내자
		String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		//프로젝트 테이블&업무 테이블 조인해서 데이터 가져오기
		List<Project> projects=service.selectProject(id);
		
		/*
		 * for(ProTask p:projects) { List<Task>
		 * tasks=service.selectTaskEach(p.getProjectNo()); p.setTasks(tasks); }
		 */
		
		
		mv.addObject("projects",projects);
		
		mv.setViewName("task/allTaskView");
		
		
		return mv;
	}
	
	@RequestMapping("/task/backhome.do")
	public String backHome() {
		
		return "main";
	}
	
	
	  @RequestMapping("/task/selectTaskEach.do") 
	  public ModelAndView selectTaskEach(int no,ModelAndView mv,HttpServletRequest req) { 
		/*
		 * logger.debug("번호:"+no); List<Task> tasks=service.selectTaskEach(no);
		 * logger.debug("내용:"+tasks); model.addAttribute("tasks", tasks);
		 */
		  List<TaskPb> tasks=service.selectTaskEach(no);
		  
		  String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		  List<Project> projects=service.selectProject(id);
		
			
			
		  mv.addObject("projects",projects);
		  mv.addObject("tasks",tasks);
		  mv.setViewName("task/allTaskView");
		  return mv; 
	  }
	  @RequestMapping("/task/selectTaskFilter.do")
	  public ModelAndView selectTaskFilter(TaskFilter tf,HttpServletRequest req) {
		  logger.debug("프로젝트번호:"+tf.getProjectNo());
		  logger.debug("프로젝트상태:"+tf.getStatus());
		
		  ModelAndView mv=new ModelAndView();
		  String id=((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		  List<Project> projects=service.selectProject(id);
		  
		  tf.setUserId(id);
		  List<TaskPb> tasks=service.selectTaskFilter(tf);
		 logger.debug("가져왔니?"+tasks);
		
		  
		  mv.addObject("projects",projects);
		  mv.addObject("tasks",tasks);
		  mv.setViewName("jsonView");
		  return mv;
	  }
	  
	  //업무번호로 task 1row 가져오기
	  @RequestMapping("/task/selectTaskView.do")
	  public ModelAndView selectTaskView(int boardNo) {
		  logger.debug("넘어온 글(총괄)번호:"+boardNo);
		  
		  ModelAndView mv=new ModelAndView();
		  TaskPb tp=service.selectTaskView(boardNo);
		  String notiMember=service.selectTaskNoti(boardNo);
		  
		  mv.addObject("task",tp);
		  mv.addObject("notiMember",notiMember);//이건 업무 담당자임..
		  mv.setViewName("jsonView");
		  return mv;
		  
	  }
	  
	  
	 
}
