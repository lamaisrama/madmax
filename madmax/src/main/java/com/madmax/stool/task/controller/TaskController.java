package com.madmax.stool.task.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.task.model.service.TaskService;
import com.madmax.stool.task.model.vo.Task;

@Controller
public class TaskController {
	
	@Autowired
	private TaskService service;
	
	
	
	
	@RequestMapping("/task/selectTask.do")
	public ModelAndView selectTask(ModelAndView mv) {
		List<Task> list=service.selectTask();
		mv.addObject("list",list);
		mv.setViewName("task/allTaskView");
		
		
		return mv;
	}
	
	
	
}
