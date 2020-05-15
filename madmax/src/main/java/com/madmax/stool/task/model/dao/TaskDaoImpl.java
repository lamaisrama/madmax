package com.madmax.stool.task.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.project.model.vo.Project;
import com.madmax.stool.task.model.vo.ProTask;
import com.madmax.stool.task.model.vo.Task;
import com.madmax.stool.task.model.vo.TaskJoinPnPm;

@Repository
public class TaskDaoImpl implements TaskDao {



	@Override
	public List<Project> selectProject(SqlSessionTemplate session,String id) {
		// TODO Auto-generated method stub
		return session.selectList("task.selectProject",id);
	}

	@Override
	public List<Task> selectTaskEach(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectList("task.selectTaskEach",no);
	}

}
