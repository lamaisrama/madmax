package com.madmax.stool.task.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.project.model.vo.Project;
import com.madmax.stool.task.model.vo.ProTask;
import com.madmax.stool.task.model.vo.Task;
import com.madmax.stool.task.model.vo.TaskJoinPnPm;

public interface TaskDao {

	

	List<Project> selectProject(SqlSessionTemplate session, String id);

	List<Task> selectTaskEach(SqlSessionTemplate session, int no);

}
