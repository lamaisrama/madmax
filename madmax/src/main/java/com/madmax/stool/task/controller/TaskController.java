package com.madmax.stool.task.controller;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.project.model.vo.Project;
import com.madmax.stool.task.model.service.TaskService;
import com.madmax.stool.task.model.vo.Task;

@Controller
public class TaskController {
	
	@Autowired
	private TaskService service;
	
	@Autowired
	private Logger logger;
	
	
	
	@RequestMapping("/task/selectTask.do")
	public ModelAndView selectTask(ModelAndView mv) {
		//프로젝트 테이블에서 프로젝트 명 가져오기
		//세션에서 로그인한 멤버의 아이디값을 가져와서
		//그 사용자를 프로젝트 참여 멤버테이블에서 찾아. 
		//세션에서 가져왔다고 가정하고, String을 보내자
		String id="USER04";
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
		
		return "redirect://";
	}
	
	
	  @RequestMapping("/task/selectTaskEach.do") 
	  public ModelAndView selectTaskEach(int no,ModelAndView mv) { 
		/*
		 * logger.debug("번호:"+no); List<Task> tasks=service.selectTaskEach(no);
		 * logger.debug("내용:"+tasks); model.addAttribute("tasks", tasks);
		 */
		  List<Task> tasks=service.selectTaskEach(no);
		  
		  String id="USER04";
		  List<Project> projects=service.selectProject(id);
		
			
			
		  mv.addObject("projects",projects);
		  mv.addObject("tasks",tasks);
		  mv.setViewName("task/allTaskView");
		  return mv; 
	  }
	 
}
