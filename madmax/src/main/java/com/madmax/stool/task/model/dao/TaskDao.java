package com.madmax.stool.task.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.project.model.vo.Project;
import com.madmax.stool.task.model.vo.NotiMember;
import com.madmax.stool.task.model.vo.TaskFilter;
import com.madmax.stool.task.model.vo.TaskPb;
import com.madmax.stool.task.model.vo.TaskProject;

public interface TaskDao {

	

	List<Project> selectProject(SqlSessionTemplate session, String id);

	List<TaskPb> selectTaskEach(SqlSessionTemplate session, int no);

	List<TaskPb> selectTaskFilter(SqlSessionTemplate session,TaskFilter tf);

	TaskPb selectTaskView(SqlSessionTemplate session, int boardNo);

	List<NotiMember> selectTaskNoti(SqlSessionTemplate session, int boardNo);

	TaskProject selectProjectTitle(SqlSessionTemplate session, int pjNo);

}
