package com.madmax.stool.task.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.task.model.vo.Task;

@Repository
public class TaskDaoImpl implements TaskDao {

	@Override
	public List<Task> selectTask(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("task.selectTask");
	}

}
