package com.madmax.stool.task.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.project.model.vo.Project;
import com.madmax.stool.task.model.dao.TaskDao;
import com.madmax.stool.task.model.vo.ProTask;
import com.madmax.stool.task.model.vo.Task;
import com.madmax.stool.task.model.vo.TaskJoinPnPm;

@Service
public class TaskServiceImpl implements TaskService {

	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private TaskDao dao;
	
	

	@Override
	public List<Project> selectProject(String id) {
		// TODO Auto-generated method stub
		return dao.selectProject(session,id);
	}



	@Override
	public List<Task> selectTaskEach(int no) {
		// TODO Auto-generated method stub
		return dao.selectTaskEach(session,no);
	}

}
