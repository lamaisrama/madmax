package com.madmax.stool.task.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.project.model.vo.Project;
import com.madmax.stool.task.model.vo.NotiMember;
import com.madmax.stool.task.model.vo.TaskFilter;
import com.madmax.stool.task.model.vo.TaskPb;


@Repository
public class TaskDaoImpl implements TaskDao {



	@Override
	public List<Project> selectProject(SqlSessionTemplate session,String id) {
		// TODO Auto-generated method stub
		return session.selectList("task.selectProject",id);
	}

	@Override
	public List<TaskPb> selectTaskEach(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectList("task.selectTaskEach",no);
	}

	@Override
	public List<TaskPb> selectTaskFilter(SqlSessionTemplate session, TaskFilter tf) {
		// TODO Auto-generated method stub
		return session.selectList("task.selectTaskFilter",tf);
	}

	@Override
	public TaskPb selectTaskView(SqlSessionTemplate session, int boardNo) {
		// TODO Auto-generated method stub
		return session.selectOne("task.selectTaskView",boardNo);
	}

	@Override
	public List<NotiMember> selectTaskNoti(SqlSessionTemplate session, int boardNo) {
		// TODO Auto-generated method stub
		return session.selectList("task.selectTaskNoti", boardNo);
	}

}
