package com.madmax.stool.task.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.task.model.vo.Task;

public interface TaskDao {

	List<Task> selectTask(SqlSessionTemplate session);

}
