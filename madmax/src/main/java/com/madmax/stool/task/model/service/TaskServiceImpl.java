package com.madmax.stool.task.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.project.model.vo.Project;
import com.madmax.stool.task.model.dao.TaskDao;
import com.madmax.stool.task.model.vo.NotiMember;
import com.madmax.stool.task.model.vo.TaskFilter;
import com.madmax.stool.task.model.vo.TaskPb;
import com.madmax.stool.task.model.vo.TaskProject;


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
	public List<TaskPb> selectTaskEach(int no) {
		// TODO Auto-generated method stub
		return dao.selectTaskEach(session,no);
	}



	@Override
	public List<TaskPb> selectTaskFilter(TaskFilter tf) {
		// TODO Auto-generated method stub
		return dao.selectTaskFilter(session,tf);
	}



	@Override
	public TaskPb selectTaskView(int boardNo) {
		// TODO Auto-generated method stub
		return dao.selectTaskView(session,boardNo);
	}



	@Override
	public List<NotiMember> selectTaskNoti(int boardNo) {
		// TODO Auto-generated method stub
		return dao.selectTaskNoti(session,boardNo);
	}



	@Override
	public TaskProject selectProjectTitle(int pjNo) {
		// TODO Auto-generated method stub
		return dao.selectProjectTitle(session,pjNo);
	}

}
