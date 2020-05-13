package com.madmax.stool.task.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.task.model.vo.Task;

public class TaskDaoImpl implements TaskDao {

	@Override
	public List<Task> selectTask(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("task.selectTask");
	}

}
